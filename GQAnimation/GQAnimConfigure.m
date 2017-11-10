//
//  GQAnimConfigure.m
//  WeatherInZhuhai
//
//  Created by 高旗 on 16/4/29.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "GQAnimConfigure.h"

@implementation GQAnimConfigure

//无限旋转动画效果
+ (CABasicAnimation *)configureRatationAnimation:(CFTimeInterval)duration {
    CABasicAnimation *ratationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    ratationAnimation.duration = duration;
    ratationAnimation.repeatCount = MAXFLOAT;
    ratationAnimation.fromValue = [NSNumber numberWithDouble:0];
    ratationAnimation.toValue = [NSNumber numberWithDouble:M_PI*2];
    return ratationAnimation;
}

//星星闪动动画效果
+ (CABasicAnimation *)configureStarAnimation:(CFTimeInterval)duration {
    return [self configureScaleAnimation:duration withRepeatCount:INFINITY withTimeOffeset:0 withAutoreverses:YES withTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] withRemovedOnCompletion:NO];
}

//雷动画效果
+ (CABasicAnimation *)configureThunderAnimation:(CFTimeInterval)duration {
    return [self configureScaleAnimation:duration withRepeatCount:INFINITY withTimeOffeset:2.0f withAutoreverses:NO withTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] withRemovedOnCompletion:YES];
}

//配置缩小放大效果
+ (CABasicAnimation *)configureScaleAnimation:(CFTimeInterval)duration
                              withRepeatCount:(float)repeatCount
                              withTimeOffeset:(CFTimeInterval)timeOffset
                             withAutoreverses:(BOOL)autoreverses
                           withTimingFunction:(CAMediaTimingFunction*)timingFunction
                      withRemovedOnCompletion:(BOOL)removedOnCompletion {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:1.0f];
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.beginTime = CACurrentMediaTime();
    animation.timeOffset = timeOffset;
    animation.autoreverses = autoreverses;
    animation.timingFunction = timingFunction;
    animation.removedOnCompletion = removedOnCompletion;
    return animation;
}

//平移   掉落  加速动画效果
+ (CAEmitterCell *)birthRate:(float)birthRate
                withLifetime:(float)lifetime
                withVelocity:(float)velocity
             withcontentName:(NSString *)contentName
               xAcceleration:(float)xAcceleration
               yAcceleration:(float)yAcceleration {
    CAEmitterCell *emitter = [CAEmitterCell emitterCell];
    
    emitter.birthRate		= birthRate;
    emitter.lifetime		= lifetime;
    
    emitter.velocity		= velocity;
    //    emitter.velocityRange = 10;
    emitter.xAcceleration = xAcceleration;
    emitter.yAcceleration = yAcceleration;
    //    emitter.spin = 0.0;
    
    emitter.contents		= (id) [[UIImage imageNamed:contentName] CGImage];
    return emitter;
}

//单个云飘动的动画效果
+ (CAEmitterCell *)getCloudWithbirthRate:(float)birthRate
                         withcontentName:(NSString *)contentName
                           xAcceleration:(float)xAcceleration {
    return [self birthRate:birthRate
              withLifetime:120.0f
              withVelocity:0.0f
           withcontentName:contentName
             xAcceleration:xAcceleration
             yAcceleration:0];
}

//配置多云飘动效果属性
+ (CAEmitterLayer *)configureLayerWithEmitterPosition:(CGPoint)emitterPosition
                                      withEmitterSize:(CGSize)emitterSize
                                      withEmitterMode:(NSString *)emitterMode
                                     withEmitterShape:(NSString *)emitterShape
                                    withShadowOpacity:(float)shadowOpacity
                                     withShadowRadius:(CGFloat)shadowRadius
                                     withShadowOffset:(CGSize)shadowOffset
                                      withShadowColor:(CGColorRef)shadowColor
                                     withEmitterCells:(NSArray *)emitterCells {
    
    CAEmitterLayer *layerEmitter = [CAEmitterLayer layer];
    layerEmitter.emitterPosition = emitterPosition;
    layerEmitter.emitterSize     = emitterSize;
    
    layerEmitter.emitterMode	= emitterMode;
    layerEmitter.emitterShape	= emitterShape;
    
    layerEmitter.shadowOpacity = shadowOpacity;
    layerEmitter.shadowRadius  = shadowRadius;
    layerEmitter.shadowOffset  = shadowOffset;
    layerEmitter.shadowColor   = shadowColor;
    
    layerEmitter.emitterCells = emitterCells;
    return layerEmitter;
}

//单个雨滴落的动画效果
+ (CAEmitterCell *)getRainWithbirthRate:(float)birthRate
                        withcontentName:(NSString *)contentName
                          yAcceleration:(float)yAcceleration {
    return [self birthRate:birthRate withLifetime:120.0f withVelocity:0.0f withcontentName:contentName xAcceleration:0 yAcceleration:yAcceleration];
}

//随机生成制定区间的浮点数
+(float)randFloatBetween:(float)low and:(float)high {
    float diff = high - low;
    return (((float) rand() / RAND_MAX) * diff) + low;
}

@end
