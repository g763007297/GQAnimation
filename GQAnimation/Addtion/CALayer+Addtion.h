//
//  CALayer+Addtion.h
//  GQAnimationDemo
//
//  Created by tusm on 16/4/30.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Addtion)

/**
 *  暂停layer上的动画
 */
-(void)pauseLayerAnimation;

/**
 *  恢复layer上的动画
 */
-(void)resumeLayerAnimation;

@end
