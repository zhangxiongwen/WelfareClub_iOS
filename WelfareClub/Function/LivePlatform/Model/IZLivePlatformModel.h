//
//  IZLivePlatformModel.h
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZLivePlatformModel : IZObject

@property(nonatomic, copy, readonly) NSArray <IZLivePlatformModel *> *models;

/** 平台图标 */
@property(nonatomic, copy, readonly) NSString *xinimg;

/** 平台名称 */
@property(nonatomic, copy, readonly) NSString *title;

/** 平台在线主播数 */
@property(nonatomic, assign, readonly) NSInteger Number;

/** 平台主播地址 */
@property(nonatomic, copy, readonly) NSString *address;

/** 平台列表 */
- (void)iz_livePlatformCallback:(void(^)(void))callback;

@end

NS_ASSUME_NONNULL_END
