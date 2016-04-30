//
//  UIView+Addition.m
//  GQAnimationDemo
//
//  Created by tusm on 16/4/30.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "UIView+Addition.h"
#import "CALayer+Addtion.h"

@implementation UIView (Addition)

//暂停view所有layer层的动画
- (void)pauseSubLayersAnimation:(BOOL)pause{
    for (CALayer *subLayer in self.layer.sublayers) {
        pause?[subLayer pauseLayerAnimation]:[subLayer resumeLayerAnimation];
    }
    if ([self.subviews count]==0) {
        return;
    }
    for (UIView *subView in self.subviews) {
        [subView pauseSubLayersAnimation:pause];
    }
}

@end
