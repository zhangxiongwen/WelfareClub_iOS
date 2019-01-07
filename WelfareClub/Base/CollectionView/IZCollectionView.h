//
//  IZCollectionView.h
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KafkaRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IZCollectionViewDelegate <NSObject>

@optional

/** 即将显示Cell */
- (void)iz_collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;

@required
/** 多少行 */
- (NSInteger)iz_collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

/** 内容 */
- (UICollectionViewCell *)iz_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

/** 选中cell */
- (void)iz_collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface IZCollectionView : UICollectionView

@property(nonatomic, assign) id <IZCollectionViewDelegate> iz_delegate;

@end

NS_ASSUME_NONNULL_END
