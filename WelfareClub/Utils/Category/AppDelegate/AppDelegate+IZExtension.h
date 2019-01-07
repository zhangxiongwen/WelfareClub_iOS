//
//  AppDelegate+IZExtension.h
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "AppDelegate.h"


NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (IZExtension)

/**
 初始化配置, 需在`application: didFinishLaunchingWithOptions:`中调用

 @param selfClass AppDelegate实例化对象,传self
 @param application application
 @param launchOptions launchOptions
 */
void iz_applyConfiguration(AppDelegate *selfClass, UIApplication *application, NSDictionary *launchOptions);

@end

NS_ASSUME_NONNULL_END
