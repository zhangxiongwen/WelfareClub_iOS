//
//  IZLivePlatformCell.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZLivePlatformCell.h"

@implementation IZLivePlatformCell

- (void)iz_setCellINFO {
    [self.contentView addSubview:self.platformIcon];
    [self.contentView addSubview:self.name];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.platformIcon.frame = CGRectMake(0, 5, self.iz_width, self.iz_width);
    self.platformIcon.centerX = self.contentView.centerX;
    self.name.frame = CGRectMake(0, self.platformIcon.bottom+3, self.contentView.width, self.contentView.height-self.platformIcon.bottom-3);
}

- (UIImageView *)platformIcon {
    if (!_platformIcon) {
        _platformIcon = UIImageView.alloc.init;
        _platformIcon.layer.cornerRadius = self.iz_width/2;
        _platformIcon.layer.masksToBounds = YES;
    }
    return _platformIcon;
}

- (QMUILabel *)name {
    if (!_name) {
        _name = QMUILabel.alloc.init;
        _name.font = [UIFont fontWithName:@"GJJXKJW--GB1-0" size:14];
        _name.textAlignment = NSTextAlignmentCenter;
    }
    return _name;
}

- (NSArray <SomoView *>*)somoSkeletonLayout {
    [self layoutIfNeeded];
    SomoView *s0 = [[SomoView alloc] initWithFrame:CGRectMake(0, 5, self.iz_width, self.iz_width) somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal];
    SomoView *s1 = [[SomoView alloc] initWithFrame:CGRectMake(0, s0.bottom+3, self.iz_width, 30) somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal];
    s0.centerX = self.contentView.centerX;
    s1.centerX = s0.centerX;
    return @[s0, s1];
}

- (CGFloat)iz_width {
    return self.width-30;
}

@end
