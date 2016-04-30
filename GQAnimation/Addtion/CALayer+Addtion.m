//
//  CALayer+Addtion.m
//  GQAnimationDemo
//
//  Created by tusm on 16/4/30.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "CALayer+Addtion.h"

@implementation CALayer (Addtion)

//暂停layer上的动画
-(void)pauseLayerAnimation
{
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
}

//恢复layer上的动画
-(void)resumeLayerAnimation
{
    CFTimeInterval pausedTime = [self timeOffset];
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.beginTime = timeSincePause;
}

@end
