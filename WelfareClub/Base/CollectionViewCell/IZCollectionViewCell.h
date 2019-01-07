//
//  IZCollectionViewCell.h
//  Thief
//
//  Created by iizvv on 2018/12/31.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Somo.h>

NS_ASSUME_NONNULL_BEGIN

@interface IZCollectionViewCell : UICollectionViewCell<SomoSkeletonLayoutProtocol>

/** 是否使用过Skeleton */
@property(nonatomic, assign) BOOL shouldLoading;

/** 是否增加点击效果 */
@property(nonatomic, assign) BOOL animated;

@end

NS_ASSUME_NONNULL_END
