//
//  NSObject+IZExtension.h
//  Thief
//
//  Created by 鼎立华服 on 2018/12/20.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject(IZExtension)

/**
 创建模型对象

 @param keys keys
 @param objs objs
 @return 模型对象
 */
- (__kindof NSObject *)iz_modelkeys:(NSArray<NSString *> *)keys objs:(NSArray *)objs;

@end

NS_ASSUME_NONNULL_END
