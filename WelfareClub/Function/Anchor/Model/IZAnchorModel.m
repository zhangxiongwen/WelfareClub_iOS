//
//  IZAnchorModel.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZAnchorModel.h"

@interface IZAnchorModel ()

@property(nonatomic, copy, readwrite) NSArray<IZAnchorModel *> *models;

@property(nonatomic, copy, readwrite) NSArray<NSURL *> *urls;

/** 直播地址 */
@property(nonatomic, copy, readwrite) NSString *address;

/** 头像 */
@property(nonatomic, copy, readwrite) NSString *img;

/** 名称 */
@property(nonatomic, copy, readwrite) NSString *title;

@end

@implementation IZAnchorModel

- (void)iz_anchorURLString:(NSString *)urlString callback:(void(^)(void))callback {
    self.urls = @[].copy;
    __weak __typeof(self)weakSelf = self;
    [IZNetwork iz_getUrlString:urlString callback:^(id  _Nonnull success) {
        if (callback) {
            weakSelf.models = [NSArray yy_modelArrayWithClass:[IZAnchorModel class] json:success[@"zhubo"]];
            [weakSelf.models enumerateObjectsUsingBlock:^(IZAnchorModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                weakSelf.urls = [weakSelf.urls arrayByAddingObject:[NSURL URLWithString:obj.address]];
            }];
            callback();
        }
    }];
}

@end
