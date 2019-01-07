//
//  IZAnchorCell.h
//  WelfareClub
//
//  Created by 鼎立华服 on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZAnchorCell : IZCollectionViewCell

/** 头像 */
@property(nonatomic, strong) UIImageView *anchorIcon;

/** 名称 */
@property(nonatomic, strong) QMUILabel *name;

/** 占位 */
@property(nonatomic, strong) UIImageView *coverImageView;

/** 播放 */
@property(nonatomic, strong) QMUIButton *play;

/** 是否是播放模式 */
@property(nonatomic, assign) BOOL showPlay;

/** 播放按钮block  */
@property(nonatomic, copy) void (^playBlock)(QMUIButton *sender);

@end

NS_ASSUME_NONNULL_END
