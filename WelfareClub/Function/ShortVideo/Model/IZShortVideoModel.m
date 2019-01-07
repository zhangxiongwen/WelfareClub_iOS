////  IZShortVideoModel.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZShortVideoModel.h"

@interface IZShortVideoModel ()

@property(nonatomic, copy, readwrite) NSArray<IZShortVideoModel *> *models;

@property(nonatomic, copy, readwrite) NSArray<NSURL *> *urls;

/** 视频id */
@property(nonatomic, copy, readwrite) NSString *vid;

/** 视频标题 */
@property(nonatomic, copy, readwrite) NSString *title;

/** 图片 */
@property(nonatomic, copy, readwrite) NSString *thumb;

/** 图片 */
@property(nonatomic, copy, readwrite) NSString *thumb_s;

/** 视频地址 */
@property(nonatomic, copy, readwrite) NSString *href;

/** 点赞人数 */
@property(nonatomic, copy, readwrite) NSString *likes;

/** 查看人数 */
@property(nonatomic, copy, readwrite) NSString *views;

/** 发布时间 */
@property(nonatomic, copy, readwrite) NSString *addtime;

@property(nonatomic, assign) NSInteger page;

@end

@implementation IZShortVideoModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"vid":@"id"};
}

- (void)iz_shortVideoDataType:(IZShortVideoDataType)type callback:(void(^)(BOOL hasData))callback {
    __weak __typeof(self)weakSelf = self;
    if (type == IZShortVideoDataTypeLast) {
        self.page = 1;
    }
    self.urls = @[].copy;
    [IZNetwork iz_getUrlString:iz_shortVideoURL params:@{@"service":@"Video.getRecommendVideos", @"uid":@"-9999", @"type":@"0", @"isstart":@"1", @"p":[NSString qmui_stringWithNSInteger:self.page]} callback:^(id  _Nonnull success) {
        if ([success[@"ret"] integerValue] == 200) {
            if (callback) {
                NSArray *temp = success[@"data"][@"info"];
                if (weakSelf.page == 1) {
                    weakSelf.models = nil;
                }
                weakSelf.models = [weakSelf.models arrayByAddingObjectsFromArray:[NSArray yy_modelArrayWithClass:[IZShortVideoModel class] json:temp]];
                [weakSelf.models enumerateObjectsUsingBlock:^(IZShortVideoModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    weakSelf.urls = [weakSelf.urls arrayByAddingObject:[NSURL URLWithString:obj.href]];
                }];
                BOOL hasData = (temp.count>=20);
                weakSelf.page+=hasData;
                callback(hasData);
            }
        }
    }];
}

- (NSArray<IZShortVideoModel *> *)models {
    if (!_models) {
        _models = [NSArray array];
    }
    return _models;
}

@end
