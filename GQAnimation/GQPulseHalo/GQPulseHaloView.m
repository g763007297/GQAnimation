//
//  GQPulseHaloView.m
//  GQAnimationDemo
//
//  Created by tusm on 16/5/4.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "GQPulseHaloView.h"
#import "GQPulseHaloLayer.h"

@interface GQPulseHaloView(){
    NSTimeInterval totalTime;//动画持续的总时间
    BOOL isAnimation;
};

@property (nonatomic, assign) NSTimeInterval animationDuration; //单个脉冲持续的时间   默认 3s

@property (nonatomic, strong) NSMutableArray *layerArray;   //存储sublayer的数组

@end

@implementation GQPulseHaloView

- (instancetype)initWithFrame:(CGRect)frame withNumberPules:(NSInteger)numberPules{
    self = [super initWithFrame:frame];
    if (self) {
        self.radius = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))/2;
        self.backgroundColor = [UIColor clearColor];
        _numberPules = numberPules;
        self.animationDuration = 1;
        self.pulseInterval = 0;
        self.siglePulesInterval = 0.2;
        isAnimation = NO;
        [self setClipsToBounds:YES];
        [self setupLayers];
    }
    return self;
}

/**
 *  初始化所有脉冲
 */
- (void)setupLayers{
    _layerArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i <self.numberPules; i++) {
        GQPulseHaloLayer *layer = [[GQPulseHaloLayer alloc] init];
        totalTime = _animationDuration + _siglePulesInterval * (_numberPules);
        layer.position = CGPointMake(_radius, _radius);
        layer.animationDuration = totalTime;
        layer.radius = _radius;
        NSTimeInterval intervalTime = _pulseInterval;
        layer.pulseInterval = intervalTime;
        [_layerArray addObject:layer];
    }
}

/**
 *  设置脉冲背景颜色
 *
 *  @param layerBgColor UIColor
 */
- (void)setLayerBgColor:(UIColor *)layerBgColor{
    _layerBgColor = layerBgColor;
    for (GQPulseHaloLayer *layer in _layerArray) {
        [layer setBackgroundColor:_layerBgColor.CGColor];
    }
}

/**
 *  设置每个脉冲中间间隔时间
 *
 *  @param siglePulesInterval NSTimeInterval
 */
- (void)setSiglePulesInterval:(NSTimeInterval)siglePulesInterval{
    _siglePulesInterval = siglePulesInterval;
    for (GQPulseHaloLayer *layer in _layerArray) {
        [layer setAnimationDuration:totalTime];
    }
}

/**
 *  设置单个脉冲最大的半径
 *
 *  @param radius CGFloat
 */
- (void)setRadius:(CGFloat)radius{
    _radius = radius;
    for (GQPulseHaloLayer *layer in _layerArray) {
        [layer setRadius:radius];
    }
}

/**
 *  设置一共有多少个脉冲循环播放
 *
 *  @param numberPules
 */
- (void)setNumberPules:(NSInteger)numberPules{
    _numberPules = numberPules;
    [self setupLayers];
}

/**
 *  开始动画
 */
- (void)startAnimation{
    if (isAnimation == YES) {
        return;
    }
    isAnimation = YES;
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    for (int i = 0; i < [_layerArray count]; i++) {
        [self performSelector:@selector(addSublayer:) withObject:_layerArray[i] afterDelay:(totalTime/_numberPules * i)];
    }
}

/**
 *  添加脉冲
 *
 *  @param layer CALayer
 */
- (void)addSublayer:(CALayer *)layer{
    [self.layer addSublayer:layer];
}

/**
 *  动画暂停
 */
- (void)pauseAnimation{
    if (isAnimation == NO) {
        return;
    }
    isAnimation = NO;
}


@end
