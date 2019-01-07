//
//  AppDelegate.m
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+IZExtension.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /** 启动初始化配置 */
    iz_applyConfiguration(self, application, launchOptions);
    
    return YES;
}

@end
