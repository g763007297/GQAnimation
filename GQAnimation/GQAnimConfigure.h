//
//  GQAnimConfigure.h
//  WeatherInZhuhai
//
//  Created by 高旗 on 16/4/29.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GQAnimConfigure : NSObject

/**
 *  无限自动旋转的太阳光晕
 *
 *  @param duration 周期旋转时间
 *
 *  @return CABasicAnimation
 */
+ (CABasicAnimation *)configureRatationAnimation:(CFTimeInterval)duration;

/**
 *  星星闪动动画效果
 *
 *  @param duration 周期闪动时间
 *
 *  @return CABasicAnimation
 */
+ (CABasicAnimation *)configureStarAnimation:(CFTimeInterval)duration;

/**
 *  雷动画效果
 *
 *  @param duration 周期时间
 *
 *  @return CABasicAnimation
 */
+ (CABasicAnimation *)configureThunderAnimation:(CFTimeInterval)duration;

/**
 *  配置缩小放大动画效果
 *
 *  @param duration       每次重复时间
 *  @param repeatCount    重复次数
 *  @param timeOffset     时间偏移量
 *  @param autoreverses   是否返回到动画原始形态
 *  @param timingFunction 动画效果
 *
 *  @return CABasicAnimation
 */
+ (CABasicAnimation *)configureScaleAnimation:(CFTimeInterval)duration withRepeatCount:(float)repeatCount withTimeOffeset:(CFTimeInterval)timeOffset withAutoreverses:(BOOL)autoreverses withTimingFunction:(CAMediaTimingFunction*)timingFunction withRemovedOnCompletion:(BOOL)removedOnCompletion;

/**
 *  平移   掉落  加速动画效果
 *
 *  @param birthRate     产生云的速度
 *  @param lifetime      生命周期
 *  @param velocity      初始速度
 *  @param contentName   图片名称
 *  @param xAcceleration x轴方向的加速度
 *  @param yAcceleration y轴方向的加速度
 *
 *  @return CAEmitterCell
 */
+ (CAEmitterCell *)birthRate:(float)birthRate withLifetime:(float)lifetime withVelocity:(float)velocity withcontentName:(NSString *)contentName xAcceleration:(float)xAcceleration yAcceleration:(float)yAcceleration;

/**
 *  单个云飘动的动画效果
 *
 *  @param birthRate     云朵出生的速度
 *  @param contentName   图片名称
 *  @param xAcceleration x轴方向的加速度
 *
 *  @return CAEmitterCell
 */

+ (CAEmitterCell *)getCloudWithbirthRate:(float)birthRate withcontentName:(NSString *)contentName xAcceleration:(float)xAcceleration;

/**
 *  配置多云飘动效果属性
 *
 *  @param emitterPosition 所有云飘动的范围
 *  @param emitterSize     单个云的大小
 *  @param emitterMode     云飘动的模式
 *  @param emitterShape    云的形状
 *  @param shadowOpacity   阴影效果
 *  @param shadowRadius    阴影角度
 *  @param shadowOffset    阴影偏移量
 *  @param shadowColor     阴影颜色
 *  @param emitterCells    云数组
 *
 *  @return CAEmitterLayer
 */
+ (CAEmitterLayer *)configureLayerWithEmitterPosition:(CGPoint)emitterPosition withEmitterSize:(CGSize)emitterSize withEmitterMode:(NSString *)emitterMode withEmitterShape:(NSString *)emitterShape withShadowOpacity:(float)shadowOpacity withShadowRadius:(CGFloat)shadowRadius withShadowOffset:(CGSize)shadowOffset withShadowColor:(CGColorRef)shadowColor withEmitterCells:(NSArray *)emitterCells;

/**
 *  单个雨滴落的动画效果
 *
 *  @param birthRate     雨滴出生的速度
 *  @param contentName   图片名称
 *  @param yAcceleration y轴方向的加速度
 *
 *  @return CAEmitterCell
 */

+ (CAEmitterCell *)getRainWithbirthRate:(float)birthRate withcontentName:(NSString *)contentName yAcceleration:(float)yAcceleration;

/**
 *  随机生成制定区间的浮点数
 *
 *  @param low  区间低位
 *  @param high 区间高位
 *
 *  @return 浮点数
 */
+(float)randFloatBetween:(float)low and:(float)high;


@end
