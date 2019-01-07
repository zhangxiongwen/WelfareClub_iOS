//
//  IZTabBarViewController.m
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZTabBarViewController.h"
#import "IZTabBarViewController+IZExtension.h"
#import "IZShortVideoViewController.h"
#import "IZLivePlatformViewController.h"
#import "IZRemainderViewController.h"
#import "IZSettingViewController.h"

@interface IZTabBarViewController ()

@end

@implementation IZTabBarViewController

- (void)didInitialize {
    [super didInitialize];
    [self iz_addChildViewController:IZShortVideoViewController.new tabBarTitle:@"短视频" imgName:@""];
    [self iz_addChildViewController:IZLivePlatformViewController.new tabBarTitle:@"直播" imgName:@""];
    [self iz_addChildViewController:IZRemainderViewController.new tabBarTitle:@"其它" imgName:@""];
    [self iz_addChildViewController:IZSettingViewController.new tabBarTitle:@"设置" imgName:@""];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
