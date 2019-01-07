//
//  IZTabBarViewController+IZExtension.h
//  Thief
//
//  Created by iizvv on 2018/12/14.
//  Copyright © 2018年 iizvv. All rights reserved.
//

#import "IZTabBarViewController.h"
@class IZViewController;

NS_ASSUME_NONNULL_BEGIN

@interface IZTabBarViewController (IZExtension)

/**
 添加ChildViewController

 @param viewController 控制器
 @param tabBarTitle tabbaritem.title
 @param imgName 图片名称
 */
- (void)iz_addChildViewController:(IZViewController *)viewController tabBarTitle:(NSString *)tabBarTitle imgName:(NSString *)imgName;

@end

NS_ASSUME_NONNULL_END
