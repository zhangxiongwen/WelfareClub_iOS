//
//  NSObject+IZExtension.m
//  Thief
//
//  Created by iizvv on 2018/12/20.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "NSObject+IZExtension.h"

@implementation NSObject (IZExtension)

#pragma mark - 创建模型对象
- (__kindof NSObject *)iz_modelkeys:(NSArray<NSString *> *)keys objs:(NSArray *)objs {
    NSObject *o = [[[self class] alloc] init];
    if (keys.count == objs.count) {
        [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [o setValue:objs[idx] forKey:obj];
        }];
    }else {
        NSAssert(self, @"key与value数量不符");
    }
    return o;
}

@end
