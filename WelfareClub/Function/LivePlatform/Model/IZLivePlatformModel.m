//
//  IZLivePlatformModel.m
//  WelfareClub
//
//  Created by 鼎立华服 on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZLivePlatformModel.h"

@interface IZLivePlatformModel ()

@property(nonatomic, copy, readwrite) NSArray <IZLivePlatformModel *> *models;

/** 平台图标 */
@property(nonatomic, copy, readwrite) NSString *xinimg;

/** 平台名称 */
@property(nonatomic, copy, readwrite) NSString *title;

/** 平台在线主播数 */
@property(nonatomic, assign, readwrite) NSInteger Number;

/** 平台主播地址 */
@property(nonatomic, copy, readwrite) NSString *address;


@end

@implementation IZLivePlatformModel

- (void)iz_livePlatformCallback:(void(^)(void))callback {
    __weak __typeof(self)weakSelf = self;
    [IZNetwork iz_getUrlString:iz_livePlatformURL callback:^(id  _Nonnull success) {
        if (callback) {
            NSArray <IZLivePlatformModel *>*temp = [NSArray yy_modelArrayWithClass:[IZLivePlatformModel class] json:success[@"pingtai"]];
            weakSelf.models = @[].copy;
            [temp enumerateObjectsUsingBlock:^(IZLivePlatformModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.Number) {
                    weakSelf.models = [weakSelf.models arrayByAddingObject:obj];
                }
            }];
            callback();
        }
    }];
}

- (NSString *)address {
    return [NSString stringWithFormat:@"%@%@", iz_livePlatformAnchorURL, _address];
}

@end
