////  IZRemainderCell.m
//  WelfareClub
//
//  Created by iizvv on 2019/1/6.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

#import "IZRemainderCell.h"

@implementation IZRemainderCell

- (void)iz_setCellINFO {
    [self.contentView addSubview:self.title];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.title.frame = self.bounds;
}

- (QMUILabel *)title {
    if (!_title) {
        _title = [[QMUILabel alloc] init];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont fontWithName:@"SCFXJH" size:44];
        _title.textColor = UIColorWhite;
    }
    return _title;
}

@end
