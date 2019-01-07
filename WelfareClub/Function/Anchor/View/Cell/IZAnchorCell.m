//
//  IZAnchorCell.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/5.
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZAnchorCell.h"

@interface IZAnchorCell ()

@property(nonatomic, strong) QMUIButton *enabledView;

@end

@implementation IZAnchorCell

- (void)iz_setCellINFO {
    self.coverImageView.tag = 100;
    [self.contentView addSubview:self.anchorIcon];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.enabledView];
    [self.coverImageView addSubview:self.play];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.anchorIcon.frame = CGRectMake(5, 5, 35, 35);
    self.name.frame = CGRectMake(self.anchorIcon.right+2.5, self.anchorIcon.centerY-5, self.contentView.width-self.anchorIcon.width-8, 20);
    self.coverImageView.frame = CGRectMake(0, self.anchorIcon.bottom+3, self.contentView.width, self.contentView.height-self.anchorIcon.bottom-3);
    self.play.frame = CGRectMake(self.coverImageView.width/2-22, self.coverImageView.height/2-22, 44, 44);
    self.enabledView.frame = CGRectMake(0, 0, self.width, self.coverImageView.top);
}

- (UIImageView *)anchorIcon {
    if (!_anchorIcon) {
        _anchorIcon = UIImageView.alloc.init;
        _anchorIcon.layer.cornerRadius = 35/2;
        _anchorIcon.layer.masksToBounds = YES;
    }
    return _anchorIcon;
}

- (QMUILabel *)name {
    if (!_name) {
        _name = QMUILabel.alloc.init;
        _name.font = [UIFont fontWithName:@"Jyinbikai" size:13];
    }
    return _name;
}

- (UIView *)enabledView {
    if (!_enabledView) {
        _enabledView = QMUIButton.alloc.init;
    }
    return _enabledView;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = UIImageView.alloc.init;
        _coverImageView.userInteractionEnabled = YES;
        _coverImageView.clipsToBounds = YES;
    }
    return _coverImageView;
}

- (QMUIButton *)play {
    if (!_play) {
        _play = QMUIButton.alloc.init;
        [_play setImage:UIImageMake(@"play") forState:UIControlStateNormal];
        [_play addTarget:self action:@selector(playDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _play;
}

- (void)playDidClick:(QMUIButton *)sender {
    if (self.playBlock) {
        self.playBlock(sender);
    }
}

- (NSArray<SomoView *> *)somoSkeletonLayout {
    [self layoutIfNeeded];
    SomoView *s0 = [[SomoView alloc] initWithFrame:CGRectMake(5, 5, 35, 35) somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal];
    s0.layer.cornerRadius = 35/2;
    s0.layer.masksToBounds = YES;
    SomoView *s1 = [[SomoView alloc] initWithFrame:CGRectMake(self.anchorIcon.right+2.5, self.anchorIcon.centerY-5, 80, 20) somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal];
    SomoView *s2 = [[SomoView alloc] initWithFrame:CGRectMake(0, self.anchorIcon.bottom+3, self.contentView.width, self.contentView.height-self.anchorIcon.bottom-3) somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal];
    return @[s0, s1, s2];
}

@end
