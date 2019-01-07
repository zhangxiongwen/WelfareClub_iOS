//
//  IZCollectionViewCell.m
//  Thief
//
//  Created by 鼎立华服 on 2018/12/31.
//  Copyright © 2018 iizvv. All rights reserved.
//

#import "IZCollectionViewCell.h"

@implementation IZCollectionViewCell

- (void)setShouldLoading:(BOOL)shouldLoading {
    _shouldLoading = shouldLoading;
    if (!shouldLoading) {
        [self beginSomo];
    }else {
        [self endSomo];
    }
}

- (NSArray<SomoView *> *)somoSkeletonLayout {
    return @[[[SomoView alloc] initWithFrame:self.contentView.bounds somoColor:UIColorHex(#efefef) animationStyle:SomoAnimationStyleGradientHorizontal]];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (self.animated) {
        __weak __typeof(self)weakSelf = self;
        [UIView animateWithDuration:.05f animations:^{
            if (highlighted) {
                weakSelf.transform = CGAffineTransformMakeScale(.95, .95);
            }else {
                weakSelf.transform = CGAffineTransformIdentity;
            }
        }];
    }
}

@end
