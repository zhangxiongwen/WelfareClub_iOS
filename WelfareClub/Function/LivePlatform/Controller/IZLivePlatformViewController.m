////  IZLivePlatformViewController.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/4.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZLivePlatformViewController.h"
#import "IZAnchorViewController.h"
#import "IZLivePlatformView.h"
#import "IZLivePlatformCell.h"
#import "IZLivePlatformModel.h"
#import "UIImageView+IZExtension.h"

@interface IZLivePlatformViewController ()<IZCollectionViewDelegate>

@property(nonatomic, strong) IZLivePlatformView *livePlatformView;

@property(nonatomic, strong) UICollectionViewFlowLayout *layout;

@property(nonatomic, strong) IZLivePlatformModel *model;

@end

@implementation IZLivePlatformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.livePlatformView.headRefreshControl beginRefreshing];
}

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.titleView.title = @"直播平台";
}

- (void)initSubviews {
    [super initSubviews];
    [self.view addSubview:self.livePlatformView];
    [self.livePlatformView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.right.equalTo(self.view);
    }];
}

- (NSInteger)iz_numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)iz_collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.isShouldLoading?self.model.models.count:100;
}

- (void)iz_collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    ((IZLivePlatformCell *)cell).shouldLoading = self.isShouldLoading;
}

- (UICollectionViewCell *)iz_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IZLivePlatformCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (self.isShouldLoading) {
        IZLivePlatformModel *model = self.model.models[indexPath.row];
        cell.platformIcon.placeholder = model.xinimg;
        cell.name.text = model.title;
    }
    return cell;
}

- (void)iz_collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    IZLivePlatformModel *model = self.model.models[indexPath.row];
    IZAnchorViewController *anchor = [[IZAnchorViewController alloc] init];
    anchor.urlString = model.address;
    anchor.title = model.title;
    [self.navigationController pushViewController:anchor animated:YES];
}

- (IZLivePlatformModel *)model {
    if (!_model) {
        _model = IZLivePlatformModel.alloc.init;
    }
    return _model;
}

- (IZLivePlatformView *)livePlatformView {
    if (!_livePlatformView) {
        _livePlatformView = [[IZLivePlatformView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _livePlatformView.iz_delegate = self;
        [_livePlatformView registerClass:[IZLivePlatformCell class] forCellWithReuseIdentifier:@"cell"];
        __weak __typeof(self)weakSelf = self;
        [_livePlatformView bindHeadRefreshHandler:^{
            [weakSelf.model iz_livePlatformCallback:^{
                weakSelf.shouldLoading = YES;
                [self->_livePlatformView.headRefreshControl endRefreshing];
                [self->_livePlatformView reloadData];
            }];
        } themeColor:UIColorRed refreshStyle:KafkaRefreshStyleReplicatorDot];
    }
    return _livePlatformView;
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.alloc.init;
        _layout.itemSize = CGSizeMake(SCREEN_WIDTH/4, SCREEN_WIDTH/4);
        _layout.minimumLineSpacing = CGFLOAT_MIN;
        _layout.minimumInteritemSpacing = CGFLOAT_MIN;
    }
    return _layout;
}

@end
