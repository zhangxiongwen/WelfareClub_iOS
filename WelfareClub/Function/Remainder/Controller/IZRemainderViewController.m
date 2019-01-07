////  IZRemainderViewController.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZRemainderViewController.h"
#import "IZRemainderView.h"
#import "IZRemainderCell.h"
#import "IZRemainderModel.h"
#import "IZFictionViewController.h"
#import "IZMovieViewController.h"
#import "IZStorageViewController.h"

@interface IZRemainderViewController ()<IZCollectionViewDelegate>

@property(nonatomic, strong) IZRemainderModel *model;

@property(nonatomic, strong) IZRemainderView *remainderView;

@property(nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation IZRemainderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.titleView.title = @"其它资源";
}

- (void)initSubviews {
    [super initSubviews];
    [self.view addSubview:self.remainderView];
    [self.remainderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.right.equalTo(self.view);
    }];
}

- (NSInteger)iz_collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.model.models.count;
}

- (UICollectionViewCell *)iz_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IZRemainderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    IZRemainderModel *model = self.model.models[indexPath.row];
    cell.title.text = model.title;
    cell.contentView.backgroundColor = model.color;
    cell.animated = YES;
    return cell;
}

- (void)iz_collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    IZRemainderModel *model = self.model.models[indexPath.row];
    if (ISEqual(model.title, @"小说")) {
        IZFictionViewController *fiction = IZFictionViewController.alloc.init;
        fiction.title = model.title;
        [self.navigationController pushViewController:fiction animated:YES];
    }
    if (ISEqual(model.title, @"电影")) {
        IZMovieViewController *movie = IZMovieViewController.alloc.init;
        movie.title = model.title;
        [self.navigationController pushViewController:movie animated:YES];
    }
    if (ISEqual(model.title, @"资源下载")) {
        IZStorageViewController *storage = IZStorageViewController.alloc.init;
        storage.title = model.title;
        [self.navigationController pushViewController:storage animated:YES];
    }
}

- (IZRemainderView *)remainderView {
    if (!_remainderView) {
        _remainderView = [[IZRemainderView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _remainderView.contentInset = UIEdgeInsetsMake(0, 5, 44, 5);
        _remainderView.iz_delegate = self;
        [_remainderView registerClass:[IZRemainderCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _remainderView;
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

- (IZRemainderModel *)model {
    if (!_model) {
        _model = IZRemainderModel.alloc.init;
    }
    return _model;
}

@end
