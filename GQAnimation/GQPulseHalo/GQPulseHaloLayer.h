//
//  GQPulseHaloLayer.h
//  GQAnimationDemo
//
//  Created by tusm on 16/5/4.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface GQPulseHaloLayer : CALayer

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSTimeInterval animationDuration;
@property (nonatomic, assign) NSTimeInterval pulseInterval;

@end
