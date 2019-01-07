//
//  IZSettingViewController.m
//  Thief
//
//  Created by 鼎立华服 on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZSettingViewController.h"
#import "IZSettingView.h"
#import "IZSettingCell.h"
#import "IZSettingModel.h"

@interface IZSettingViewController ()<IZCollectionViewDelegate>

@property(nonatomic, strong) IZSettingView *settingView;

@property(nonatomic, strong) UICollectionViewFlowLayout *layout;

@property(nonatomic, strong) IZSettingModel *model;

@end

@implementation IZSettingViewController

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.titleView.title = @"设置";
}

- (void)initSubviews {
    [super initSubviews];
    [self.view addSubview:self.settingView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)iz_numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.model.models.count;
}

- (NSInteger)iz_collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.model.models[section].count;
}

- (UICollectionViewCell *)iz_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IZSettingModel *model = self.model.models[indexPath.section][indexPath.row];
    NSLog(@"%@", model.title);
    IZSettingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (IZSettingView *)settingView {
    if (!_settingView) {
        _settingView = [[IZSettingView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        _settingView.alwaysBounceVertical = YES;
//        _settingView.iz_delegate = self;
        [_settingView registerClass:[IZSettingCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _settingView;
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(SCREEN_WIDTH-15, 64);
    }
    return _layout;
}

- (IZSettingModel *)model {
    if (!_model) {
        _model = [[IZSettingModel alloc] init];
    }
    return _model;
}

@end
