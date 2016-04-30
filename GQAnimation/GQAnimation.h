//
//  GQAnimation.h
//  GQAnimationDemo
//
//  Created by 高旗 on 16/4/29.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    GQAnimationSun = 0,     //晴天
    GQAnimationRain,        //雨天
    GQAnimationCloud,       //多云
    GQAnimationThunder,     //雷阵雨
    GQAnimationStar,        //星星闪动
    GQAnimationScan         //二维码扫描动画
}GQAnimationType;

typedef enum {
    GQAnimationGravityTop = 1000,       //视图头部
    GQAnimationGravityBottom,           //视图中间
    GQAnimationGravityCenter            //视图尾部
}GQAnimationGravity;

@interface GQAnimation : NSObject

@property (nonatomic, readonly) BOOL isAnimation;

/**
 *  初始化动画
 *
 *  @param frame     将要显示的动画大小
 *  @param type      动画类型
 *  @param superView 添加到指定view
 *
 *  @return GQAnimation
 */
- (id)initWithFrame:(CGRect)frame withAnimationType:(GQAnimationType)type withSuperView:(UIView *)superView;

/**
 *  重置动画
 *
 *  @param type GQAnimationType
 */
- (void)resetType:(GQAnimationType)type;

/**
 *  暂停动画
 */
- (void)pauseAnimation;

/**
 *  恢复动画
 */
- (void)resumeAnimation;

@end
