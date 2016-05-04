//
//  GQPulseHaloView.h
//  GQAnimationDemo
//
//  Created by tusm on 16/5/4.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GQPulseHaloView : UIView

@property (nonatomic, assign) NSInteger numberPules;                //一共显示多少个脉冲

@property (nonatomic, strong) UIColor *layerBgColor;                //每个脉冲的背景颜色

@property (nonatomic, assign) NSTimeInterval siglePulesInterval;    //每个脉冲的间隔 默认0.2s  时间不应隔太久

@property (nonatomic, assign) CGFloat radius;                       //脉冲的大小   默认60pt

@property (nonatomic, assign) NSTimeInterval pulseInterval;         //一轮脉冲执行完之后暂停时间 默认0s  如果需要连续动画就不需要设置

- (instancetype)initWithFrame:(CGRect)frame withNumberPules:(NSInteger)numberPules;

/**
 *  开始动画
 */
- (void)startAnimation;

/**
 *  暂停动画
 */
- (void)pauseAnimation;

@end
