////  IZShortVideoModel.h
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZObject.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, IZShortVideoDataType) {
    /** 新数据 */
    IZShortVideoDataTypeLast,
    /** 以前的 */
    IZShortVideoDataTypeBefore,
};

@interface IZShortVideoModel : IZObject

@property(nonatomic, copy, readonly) NSArray<IZShortVideoModel *> *models;

@property(nonatomic, copy, readonly) NSArray<NSURL *> *urls;

/** 视频id */
@property(nonatomic, copy, readonly) NSString *vid;

/** 视频标题 */
@property(nonatomic, copy, readonly) NSString *title;

/** 图片 */
@property(nonatomic, copy, readonly) NSString *thumb;

/** 图片 */
@property(nonatomic, copy, readonly) NSString *thumb_s;

/** 视频地址 */
@property(nonatomic, copy, readonly) NSString *href;

/** 点赞人数 */
@property(nonatomic, copy, readonly) NSString *likes;

/** 查看人数 */
@property(nonatomic, copy, readonly) NSString *views;

/** 发布时间 */
@property(nonatomic, copy, readonly) NSString *addtime;

/** 短视频 */
- (void)iz_shortVideoDataType:(IZShortVideoDataType)type callback:(void(^)(BOOL hasData))callback;

@end

NS_ASSUME_NONNULL_END
