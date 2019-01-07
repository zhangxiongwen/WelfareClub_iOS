////  IZShortVideoCell.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/4.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZShortVideoCell.h"

@implementation IZShortVideoCell

- (void)iz_setCellINFO {
    self.thumb.tag = 100;
    [self.contentView addSubview:self.thumb];
    [self.contentView addSubview:self.title];
    [self.thumb addSubview:self.play];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.title.frame = CGRectMake(5, 5, self.width-5, 22);
    self.thumb.frame = CGRectMake(0, self.title.bottom+3, self.width, self.height-self.title.bottom-6);
    self.play.frame = CGRectMake(0, 0, 44, 44);
    self.play.center = self.thumb.center;
}

- (QMUILabel *)title {
    if (!_title) {
        _title = QMUILabel.alloc.init;
        _title.font = [UIFont fontWithName:@"Jyinbikai" size:14];
    }
    return _title;
}

- (UIImageView *)thumb {
    if (!_thumb) {
        _thumb = UIImageView.alloc.init;
        _thumb.userInteractionEnabled = YES;
        _thumb.tag = 100;
        _thumb.clipsToBounds = YES;
    }
    return _thumb;
}

- (QMUIButton *)play {
    if (!_play) {
        _play = [QMUIButton buttonWithType:UIButtonTypeCustom];
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
    SomoView *s0 = [[SomoView alloc] initWithFrame:CGRectMake(5, 5, self.width/2, 22) somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal];
    SomoView *s1 = [[SomoView alloc] initWithFrame:CGRectMake(0, self.title.bottom+3, self.width, self.height-self.title.bottom-6) somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal];
    return @[s0, s1];
}

@end
