//
//  IZCollectionView.m
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZCollectionView.h"

@interface IZCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation IZCollectionView

- (void)iz_loadView {
    self.backgroundColor =  QMUICMI.backgroundColor;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.alwaysBounceVertical = YES;
}

- (void)setIz_delegate:(id<IZCollectionViewDelegate>)iz_delegate {
    _iz_delegate = iz_delegate;
    if (iz_delegate) {
        self.dataSource = self;
        self.delegate = self;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.iz_delegate iz_collectionView:collectionView numberOfItemsInSection:section];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.iz_delegate && [self.iz_delegate respondsToSelector:@selector(iz_collectionView:willDisplayCell:forItemAtIndexPath:)]) {
        [self.iz_delegate iz_collectionView:collectionView willDisplayCell:cell forItemAtIndexPath:indexPath];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.iz_delegate iz_collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.iz_delegate iz_collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}

@end
