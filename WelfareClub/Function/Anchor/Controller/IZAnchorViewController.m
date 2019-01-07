//
//  IZAnchorViewController.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZAnchorViewController.h"
#import "IZAnchorView.h"
#import "IZAnchorCell.h"
#import "IZAnchorModel.h"
#import "UIImageView+IZExtension.h"
#import <ZFPlayer/ZFPlayer.h>
#import <ZFPlayer/ZFIJKPlayerManager.h>
#import <ZFPlayer/ZFPlayerControlView.h>

@interface IZAnchorViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionViewFlowLayout *layout;

@property(nonatomic, strong) IZAnchorView *anchorView;

@property(nonatomic, strong) IZAnchorModel *model;

@property(nonatomic, strong) ZFPlayerController *player;

@property(nonatomic, strong) ZFPlayerControlView *controlView;

@property(nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation IZAnchorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.anchorView.headRefreshControl beginRefreshing];
    
    ZFIJKPlayerManager *playerManager = [[ZFIJKPlayerManager alloc] init];
    self.player = [ZFPlayerController playerWithScrollView:self.anchorView playerManager:playerManager containerViewTag:100];
    self.player.controlView = self.controlView;
    self.player.shouldAutoPlay = YES;
    __weak __typeof(self)weakSelf = self;
    self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {        [weakSelf setNeedsStatusBarAppearanceUpdate];
        weakSelf.anchorView.scrollsToTop = !isFullScreen;
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

- (void)initSubviews {
    [super initSubviews];
    [self.view addSubview:self.anchorView];
    [self.anchorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.right.equalTo(self.view);
    }];
}

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem qmui_itemWithTitle:@"Layout" target:self action:@selector(iz_changeLayout)];;
}

- (void)iz_changeLayout {
    if (self.layout.itemSize.width == self.view.width) {
        self.anchorView.pagingEnabled = NO;
        CGFloat iz_width = self.view.width/2-10;
        self.layout.itemSize = CGSizeMake(iz_width, iz_width);
        self.layout.minimumLineSpacing = 10;
        self.layout.minimumInteritemSpacing = 10;
        self.layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    }else {
        self.anchorView.pagingEnabled = YES;
        self.layout.itemSize = self.anchorView.size;
        self.layout.minimumLineSpacing = CGFLOAT_MIN;
        self.layout.minimumInteritemSpacing = CGFLOAT_MIN;
        self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    __weak __typeof(self)weakSelf = self;
    [self.anchorView zf_scrollToRowAtIndexPath:self.indexPath completionHandler:^{
        [weakSelf playTheVideoAtIndexPath:weakSelf.indexPath scrollToTop:YES];
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.isShouldLoading?self.model.models.count:100;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    ((IZAnchorCell *)cell).shouldLoading = self.isShouldLoading;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IZAnchorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (self.isShouldLoading) {
        IZAnchorModel *model = self.model.models[indexPath.row];
        cell.anchorIcon.placeholder = model.img;
        cell.coverImageView.placeholder = model.img;
        cell.name.text = model.title;
        __weak __typeof(self)weakSelf = self;
        cell.playBlock = ^(QMUIButton *sender) {
            [weakSelf playTheVideoAtIndexPath:indexPath scrollToTop:NO];
        };
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.indexPath = indexPath;
    [self playTheVideoAtIndexPath:indexPath scrollToTop:NO];
}

- (void)playTheVideoAtIndexPath:(NSIndexPath *)indexPath scrollToTop:(BOOL)scrollToTop {
    [self.player playTheIndexPath:indexPath scrollToTop:scrollToTop];
    self.indexPath = indexPath;
    IZAnchorModel *model = self.model.models[indexPath.row];
    [self.controlView showTitle:model.title
                 coverURLString:model.img
                 fullScreenMode:ZFFullScreenModeAutomatic];
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

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView =  ZFPlayerControlView.alloc.init;
    }
    return _controlView;
}

- (IZAnchorView *)anchorView {
    if (!_anchorView) {
        _anchorView = [[IZAnchorView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _anchorView.delegate = self;
        _anchorView.dataSource = self;
        _anchorView.contentInset = UIEdgeInsetsMake(0, 5, 44, 5);
        [_anchorView registerClass:[IZAnchorCell class] forCellWithReuseIdentifier:@"cell"];
        __weak __typeof(self)weakSelf = self;
        _anchorView.zf_scrollViewDidStopScrollCallback = ^(NSIndexPath * _Nonnull indexPath) {
            [weakSelf playTheVideoAtIndexPath:indexPath scrollToTop:NO];
        };
        [_anchorView bindHeadRefreshHandler:^{
            [weakSelf.model iz_anchorURLString:weakSelf.urlString callback:^{
                weakSelf.shouldLoading = YES;
                [self->_anchorView.headRefreshControl endRefreshing];
                [self->_anchorView reloadData];
                 weakSelf.player.assetURLs = weakSelf.model.urls;
            }];
        } themeColor:UIColorRed refreshStyle:KafkaRefreshStyleReplicatorDot];
    }
    return _anchorView;
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.alloc.init;
        CGFloat iz_width = SCREEN_WIDTH/2-10;
        _layout.itemSize = CGSizeMake(iz_width, iz_width);
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    }
    return _layout;
}

- (IZAnchorModel *)model {
    if (!_model) {
        _model = IZAnchorModel.alloc.init;
    }
    return _model;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    @weakify(self)
    [self.anchorView zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        @strongify(self)
        [self playTheVideoAtIndexPath:indexPath scrollToTop:NO];
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player stop];
}

//- (BOOL)preferredNavigationBarHidden {
//    return YES;
//}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}

@end
