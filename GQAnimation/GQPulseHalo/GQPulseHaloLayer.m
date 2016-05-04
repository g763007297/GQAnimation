//
//  GQPulseHaloLayer.m
//  GQAnimationDemo
//
//  Created by tusm on 16/5/4.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "GQPulseHaloLayer.h"

@interface GQPulseHaloLayer ()
@property (nonatomic, strong) CAAnimationGroup *animationGroup;
@end

@implementation GQPulseHaloLayer

- (id)init {
    self = [super init];
    if (self) {
        
        self.contentsScale = [UIScreen mainScreen].scale;
        self.opacity = 0;
        
        self.radius = 60;
        self.animationDuration = 3;
        self.pulseInterval = 0;
        self.backgroundColor = [[UIColor colorWithRed:0.000 green:0.478 blue:1.000 alpha:1] CGColor];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            
            [self setupAnimationGroup];
            
            if(self.pulseInterval != INFINITY) {
                
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    [self addAnimation:self.animationGroup forKey:@"pulse"];
                });
            }
        });
    }
    return self;
}

- (void)setRadius:(CGFloat)radius {
    
    _radius = radius;
    
    CGFloat diameter = self.radius * 2;
    
    self.bounds = CGRectMake(0, 0, diameter, diameter);
    self.cornerRadius = self.radius;
}

- (void)setupAnimationGroup {
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    self.animationGroup = [CAAnimationGroup animation];
    self.animationGroup.duration = self.animationDuration + self.pulseInterval;
    self.animationGroup.repeatCount = INFINITY;
    self.animationGroup.removedOnCompletion = NO;
    self.animationGroup.timingFunction = defaultCurve;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.0;
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = self.animationDuration;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = self.animationDuration;
    opacityAnimation.values = @[@1, @0];
    opacityAnimation.keyTimes = @[@0, @1];
    opacityAnimation.removedOnCompletion = NO;
    
    NSArray *animations = @[scaleAnimation, opacityAnimation];
    
    self.animationGroup.animations = animations;
}


@end
