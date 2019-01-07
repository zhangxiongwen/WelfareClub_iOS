//
//  AppDelegate+IZExtension.m
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "AppDelegate+IZExtension.h"
#import <LSSafeProtector.h>//安全插件
#import "IZTabBarViewController.h"//rootViewController

@implementation AppDelegate (IZExtension)

#pragma mark - 启动配置
void iz_applyConfiguration(AppDelegate *selfClass, UIApplication *application, NSDictionary *launchOptions) {
    
    /** 启动安全插件 */
    [selfClass iz_safeProtector];
    
    /** 配置rootViewController */
    [selfClass iz_rootViewController];
}

#pragma mark - 安全插件
- (void)iz_safeProtector {
    [LSSafeProtector openSafeProtectorWithIsDebug:IS_DEBUG block:^(NSException *exception, LSSafeProtectorCrashType crashType) {
        NSLog(@"%@--->%ld", exception, crashType);
    }];
    [LSSafeProtector setLogEnable:YES];
}

#pragma mark - rootViewController
- (void)iz_rootViewController {
    self.window = UIWindow.alloc.init;
    self.window.rootViewController = IZTabBarViewController.new;
    [self.window makeKeyAndVisible];
}

@end
