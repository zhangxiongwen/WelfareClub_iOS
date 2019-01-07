////  IZShortVideoCell.h
//  WelfareClub
//
//  Created by iizvv on 2019/1/4.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZShortVideoCell : IZCollectionViewCell

/** 标题 */
@property(nonatomic, strong) QMUILabel *title;

/** 图片 */
@property(nonatomic, strong) UIImageView *thumb;

/** 播放按钮 */
@property (nonatomic, strong) QMUIButton *play;

// 播放按钮block
@property (nonatomic, copy) void(^playBlock)(QMUIButton *sender);

@end

NS_ASSUME_NONNULL_END
