//
//  UIImageView+IZExtension.m
//  WelfareClub
//
//  Created by 鼎立华服 on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "UIImageView+IZExtension.h"
#import <YYWebImage.h>

@implementation UIImageView (IZExtension)
@dynamic placeholder;

- (void)setPlaceholder:(NSString *)placeholder {
    [self yy_setImageWithURL:[NSURL URLWithString:placeholder] placeholder:UIImageMake(@"placeholder")];
}

@end
