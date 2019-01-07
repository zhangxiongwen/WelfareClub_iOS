//
//  IZSettingModel.m
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZSettingModel.h"

@interface IZSettingModel ()

@property(nonatomic, copy, readwrite) NSArray <NSArray <IZSettingModel *> *> *models;

/** title */
@property(nonatomic, copy, readwrite) NSString *title;

/** subTitle */
@property(nonatomic, copy, readwrite) NSString *subTitle;

@end

@implementation IZSettingModel

- (NSArray<NSArray<IZSettingModel *> *> *)models {
    if (!_models) {
        _models = @[
                    @[
                        [self iz_modelkeys:@[@"title", @"subTitle"] objs:@[@"test", @"test"]],
                        ],
                    ];
    }
    return _models;
}

@end
