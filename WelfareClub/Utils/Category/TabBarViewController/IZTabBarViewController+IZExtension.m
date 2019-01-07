//
//  IZTabBarViewController+IZExtension.m
//  Thief
//
//  Created by iizvv on 2018/12/14.
//  Copyright © 2018年 iizvv. All rights reserved.
//

#import "IZTabBarViewController+IZExtension.h"
#import "IZNavigationController.h"
#import "IZViewController.h"


@implementation IZTabBarViewController (IZExtension)

- (void)iz_addChildViewController:(IZViewController *)viewController tabBarTitle:(NSString *)tabBarTitle imgName:(NSString *)imgName {
    viewController.title = tabBarTitle;
    viewController.tabBarItem.image = UIImageMake(imgName);
    viewController.hidesBottomBarWhenPushed = NO;
    IZNavigationController *navigationController = [[IZNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navigationController];
}

@end
