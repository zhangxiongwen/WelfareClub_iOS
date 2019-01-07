//
//  QMUITableViewCell+IZExtension.m
//  Thief
//
//  Created by iizvv on 2018/12/18.
//  Copyright © 2018年 iizvv. All rights reserved.
//

#import "QMUITableViewCell+IZExtension.h"

@implementation QMUITableViewCell (IZExtension)

+ (void)load {
    ExchangeImplementations(self, @selector(initWithStyle:reuseIdentifier:), @selector(iz_initWithStyle:reuseIdentifier:));
}

- (instancetype)iz_initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier {
    QMUITableViewCell *cell = [self iz_initWithStyle:style reuseIdentifier:identifier];
    [self iz_setCellINFO];
    return cell;
}

- (void)iz_setCellINFO {
}

@end
