//
//  UICollectionViewCell+IZExtension.m
//  WelfareClub
//
//  Created by 鼎立华服 on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "UICollectionViewCell+IZExtension.h"

@implementation UICollectionViewCell (IZExtension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ExchangeImplementations([self class], @selector(initWithFrame:), @selector(iz_cellinitWithFrame:));
    });
}

- (instancetype)iz_cellinitWithFrame:(CGRect)frame {
    UICollectionViewCell *cell = [self iz_cellinitWithFrame:frame];
    [self iz_setCellINFO];
    return cell;
}

- (void)iz_setCellINFO {
}

@end
