//
//  IZShortVideoViewController.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/4.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZShortVideoViewController.h"
#import "IZShortVideoView.h"
#import "IZShortVideoCell.h"
#import "IZShortVideoModel.h"
#import <ZFPlayer/ZFPlayer.h>
#import <ZFPlayer/ZFAVPlayerManager.h>
#import <ZFPlayer/ZFPlayerControlView.h>
#import "UIImageView+IZExtension.h"

@interface IZShortVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) IZShortVideoModel *model;

@property(nonatomic, strong) IZShortVideoView *shortVideoView;

@property(nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) ZFPlayerController *player;

@property (nonatomic, strong) ZFPlayerControlView *controlView;

@end

@implementation IZShortVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.shortVideoView.headRefreshControl beginRefreshing];
    
    ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
    self.player = [ZFPlayerController playerWithScrollView:self.shortVideoView playerManager:playerManager containerViewTag:100];
    self.player.controlView = self.controlView;
    self.player.shouldAutoPlay = YES;
    __weak __typeof(self)weakSelf = self;
    self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {        [weakSelf setNeedsStatusBarAppearanceUpdate];
        weakSelf.shortVideoView.scrollsToTop = !isFullScreen;
    };
    
    self.player.playerDidToEnd = ^(id  _Nonnull asset) {
        if (weakSelf.player.playingIndexPath.row < self.model.urls.count - 1 && !self.player.isFullScreen) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:weakSelf.player.playingIndexPath.row+1 inSection:0];
            [weakSelf playTheVideoAtIndexPath:indexPath scrollToTop:YES];
        } else if (weakSelf.player.isFullScreen) {
            [weakSelf.player enterFullScreen:NO animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(weakSelf.player.orientationObserver.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.player stopCurrentPlayingCell];
            });
        }
    };
    
}

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.titleView.title = @"妖精短视频";
}

- (void)initSubviews {
    [super initSubviews];
    [self.view addSubview:self.shortVideoView];
    [self.shortVideoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.right.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.isShouldLoading?self.model.models.count:100;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    ((IZShortVideoCell *)cell).shouldLoading = self.isShouldLoading;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IZShortVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (self.isShouldLoading) {
        IZShortVideoModel *model = self.model.models[indexPath.row];
        cell.title.text = model.title.isNotBlank?model.title:@"妖精短视频🧚‍♀️🧚‍♀️🧚‍♀️";
        cell.thumb.placeholder = model.thumb;
        __weak __typeof(self)weakSelf = self;
        cell.playBlock = ^(QMUIButton *sender) {
            [weakSelf playTheVideoAtIndexPath:indexPath scrollToTop:NO];
        };
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self playTheVideoAtIndexPath:indexPath scrollToTop:NO];
}

- (void)playTheVideoAtIndexPath:(NSIndexPath *)indexPath scrollToTop:(BOOL)scrollToTop {
    [self.player playTheIndexPath:indexPath scrollToTop:scrollToTop];
    if (self.model.models.count) {
        IZShortVideoModel *model = self.model.models[indexPath.row];
        [self.controlView showTitle:model.title
                     coverURLString:model.thumb
                     fullScreenMode:ZFFullScreenModeAutomatic];
    }
}

#pragma mark - UIScrollViewDelegate  列表播放必须实现
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidEndDecelerating];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [scrollView zf_scrollViewDidEndDraggingWillDecelerate:decelerate];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidScrollToTop];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidScroll];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewWillBeginDragging];
}

- (IZShortVideoView *)shortVideoView {
    if (!_shortVideoView) {
        _shortVideoView = [[IZShortVideoView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _shortVideoView.delegate = self;
        _shortVideoView.dataSource = self;
        [_shortVideoView registerClass:[IZShortVideoCell class] forCellWithReuseIdentifier:@"cell"];
        __weak __typeof(self)weakSelf = self;
        [_shortVideoView bindHeadRefreshHandler:^{
            [weakSelf iz_shortVideoDataType:IZShortVideoDataTypeLast];
        } themeColor:UIColorRed refreshStyle:KafkaRefreshStyleReplicatorDot];
        [_shortVideoView bindFootRefreshHandler:^{
           [weakSelf iz_shortVideoDataType:IZShortVideoDataTypeBefore];
        } themeColor:UIColorRed refreshStyle:KafkaRefreshStyleReplicatorDot];
        /// 停止的时候找出最合适的播放
        _shortVideoView.zf_scrollViewDidStopScrollCallback = ^(NSIndexPath * _Nonnull indexPath) {
            [weakSelf playTheVideoAtIndexPath:indexPath scrollToTop:NO];
        };
    }
    return _shortVideoView;
}

- (void)iz_shortVideoDataType:(IZShortVideoDataType)type {
    __weak __typeof(self)weakSelf = self;
    [self.model iz_shortVideoDataType:type callback:^(BOOL hasData) {
        weakSelf.shouldLoading = YES;
        [weakSelf.shortVideoView.headRefreshControl endRefreshing];
        [weakSelf.shortVideoView.footRefreshControl endRefreshing];
        weakSelf.player.assetURLs = weakSelf.model.urls;
        [weakSelf.shortVideoView reloadData];
        if (hasData) {
            [weakSelf.shortVideoView.footRefreshControl resumeRefreshAvailable];
        }else {
            [weakSelf.shortVideoView.footRefreshControl endRefreshingAndNoLongerRefreshingWithAlertText:@"牛逼啊老弟,都给看完了!!!"];
        }
    }];
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.alloc.init;
        _layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*9/14);
        _layout.minimumLineSpacing = 8;
        _layout.minimumInteritemSpacing = 8;
        _layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    }
    return _layout;
}

- (IZShortVideoModel *)model {
    if (!_model) {
        _model = IZShortVideoModel.alloc.init;
    }
    return _model;
}

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = ZFPlayerControlView.alloc.init;
    }
    return _controlView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    @weakify(self)
    [self.shortVideoView zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        @strongify(self)
        [self playTheVideoAtIndexPath:indexPath scrollToTop:NO];
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player stop];
}

@end
