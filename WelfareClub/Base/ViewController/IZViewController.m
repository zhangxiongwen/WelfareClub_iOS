//
//  IZViewController.m
//  Thief
//
//  Created by iizvv on 2018/12/19.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZViewController.h"

@interface IZViewController ()

@end

@implementation IZViewController

- (void)didInitialize {
    [super didInitialize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iz_networkRequestFailure:) name:iz_networkRequestFailure object:nil];
    
}

- (void)initSubviews {
    [super initSubviews];
    [self.view addSubview:self.navigationBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 网络请求失败,子类可根据需求重写
- (void)iz_networkRequestFailure:(NSNotification *)failure {
    NSLog(@"请求失败:%@", failure);
    
}

- (BOOL)preferredNavigationBarHidden {
    return NO;
}

- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable {
    return YES;
}

- (BOOL)forceEnableInteractivePopGestureRecognizer {
    return YES;
}

- (UIView *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[UIView alloc] qmui_initWithSize:CGSizeMake(SCREEN_WIDTH, NavigationBarHeight+StatusBarHeight)];
        _navigationBar.backgroundColor = UIColorRed;
    }
    return _navigationBar;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:iz_networkRequestFailure object:nil];
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
