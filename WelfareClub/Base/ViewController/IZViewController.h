//
//  IZViewController.h
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "QMUICommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IZViewController : QMUICommonViewController

/** 导航栏 */
@property(nonatomic, strong) UIView *navigationBar;

/** 是否使用过Skeleton */
@property(nonatomic, assign, getter=isShouldLoading) BOOL shouldLoading;

/**
 网络请求失败,子类可根据需求重写
*/
- (void)iz_networkRequestFailure:(NSNotification *)failure;

@end

NS_ASSUME_NONNULL_END
