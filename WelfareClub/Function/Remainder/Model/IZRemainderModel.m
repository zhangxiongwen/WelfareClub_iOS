////  IZRemainderModel.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/6.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZRemainderModel.h"

@interface IZRemainderModel ()

@property(nonatomic, copy, readwrite) NSArray <IZRemainderModel *> *models;

/** 标题 */
@property(nonatomic, copy, readwrite) NSString *title;

@end

@implementation IZRemainderModel

- (NSArray<IZRemainderModel *> *)models {
    if (!_models) {
        _models = @[
                    [self iz_modelkeys:@[@"title", @"color"] objs:@[@"小说", UIColorGreen]],
                    [self iz_modelkeys:@[@"title", @"color"] objs:@[@"电影", UIColorBlue]],
                    [self iz_modelkeys:@[@"title", @"color"] objs:@[@"资源下载", UIColorYellow]],
                    ];
    }
    return _models;
}

@end
