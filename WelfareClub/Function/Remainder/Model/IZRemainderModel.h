////  IZRemainderModel.h
//  WelfareClub
//
//  Created by iizvv on 2019/1/6.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZRemainderModel : IZObject

@property(nonatomic, copy, readonly) NSArray <IZRemainderModel *> *models;

/** 标题 */
@property(nonatomic, copy, readonly) NSString *title;

/** 背景颜色 */
@property(nonatomic, assign, readonly) UIColor *color;

@end

NS_ASSUME_NONNULL_END
