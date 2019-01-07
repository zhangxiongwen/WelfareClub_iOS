//
//  IZAnchorModel.h
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZAnchorModel : IZObject

@property(nonatomic, copy, readonly) NSArray<IZAnchorModel *> *models;

@property(nonatomic, copy, readonly) NSArray<NSURL *> *urls;

/** 直播地址 */
@property(nonatomic, copy, readonly) NSString *address;

/** 头像 */
@property(nonatomic, copy, readonly) NSString *img;

/** 名称 */
@property(nonatomic, copy, readonly) NSString *title;

/** 主播列表 */
- (void)iz_anchorURLString:(NSString *)urlString callback:(void(^)(void))callback;

@end

NS_ASSUME_NONNULL_END
