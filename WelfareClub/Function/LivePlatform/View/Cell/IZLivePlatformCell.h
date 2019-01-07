//
//  IZLivePlatformCell.h
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZLivePlatformCell : IZCollectionViewCell

/** 平台logo */
@property(nonatomic, strong) UIImageView *platformIcon;

/** 平台名称 */
@property(nonatomic, strong) QMUILabel *name;

@end

NS_ASSUME_NONNULL_END
