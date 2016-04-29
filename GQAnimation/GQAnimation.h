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
    GQAnimationRain,    //雨天
    GQAnimationCloud,   //多云
    GQAnimationThunder, //雷阵雨
    GQAnimationStar     //星星闪动
}GQAnimationType;

typedef enum {
    GQAnimationGravityTop = 1000,      //视图头部
    GQAnimationGravityBottom,   //视图中间
    GQAnimationGravityCenter    //视图尾部
}GQAnimationGravity;

@interface GQAnimation : NSObject

- (id)initWithFrame:(CGRect)frame withAnimationType:(GQAnimationType)type withSuperView:(UIView *)superView;

- (void)resetType:(GQAnimationType)type;

@end
