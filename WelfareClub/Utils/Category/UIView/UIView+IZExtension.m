//
//  UIView+IZExtension.m
//  Thief
//
//  Created by iizvv on 2018/12/18.
//  Copyright © 2018年 iizvv. All rights reserved.
//

#import "UIView+IZExtension.h"

@implementation UIView (IZExtension)

+ (void)load {
    ExchangeImplementations(self, @selector(initWithFrame:), @selector(iz_initWithFrame:));
}

- (instancetype)iz_initWithFrame:(CGRect)rect {
    UIView *view = [self iz_initWithFrame:rect];
    [self iz_loadView];
    return view;
}

- (void)iz_loadView {
    
}

@end
