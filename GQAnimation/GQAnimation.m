//
//  GQAnimation.m
//  GQAnimationDemo
//
//  Created by 高旗 on 16/4/29.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "GQAnimation.h"
#import "GQAnimConfigure.h"

#import "GQPulseHaloView.h"
#import "GQScaningView.h"
#import <QuartzCore/QuartzCore.h>
#import "CALayer+Addtion.h"
#import "UIView+Addition.h"

#import <objc/runtime.h>

NSString * const KAnimationType = @"__GAnimation__Type";

static NSString *thunderAnimKey = @"__GThunder__Key";

static NSString *starAnimKey = @"__GStar__Key";

@interface GQAnimation()

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, assign) CGRect rectFrame;

@property (nonatomic, strong) GQScaningView *scaningView;

@property (nonatomic, strong) GQPulseHaloView *pulseHaloView;

@end

@implementation GQAnimation

- (id)initWithFrame:(CGRect)frame withAnimationType:(GQAnimationType)type withSuperView:(UIView *)superView{
    self = [super init];
    if (self) {
        [self setAnimationType:type];
        _rectFrame = frame;
        _animationView.backgroundColor = [UIColor clearColor];
        _animationView = [[UIView alloc] initWithFrame:frame];
        [_animationView setClipsToBounds:YES];
        [superView addSubview:_animationView];
        [self setAnimationWithFrame:frame];
    }
    return self;
}

//获取动画类型
- (GQAnimationType)animationType
{
    return [objc_getAssociatedObject(self, &KAnimationType) intValue];
}

//设置动画类型
- (void)setAnimationType:(GQAnimationType)animationType
{
    [self willChangeValueForKey:KAnimationType];
    objc_setAssociatedObject(self, &KAnimationType, @(animationType), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:KAnimationType];
}

- (void)setAnimationWithFrame:(CGRect)frame{
    _isAnimation = YES;
//    CGFloat MAXSize = MAX(CGRectGetWidth(frame), CGRectGetHeight(frame));
    CGFloat MIXSize = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame));
    
    [_animationView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_animationView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    switch ([self animationType]) {
        //多云效果
        case GQAnimationCloud:{
            do{
                CAEmitterCell *yjjc_h_a2 = [GQAnimConfigure getCloudWithbirthRate:0.02f withcontentName:@"yjjc_h_a2" xAcceleration:0.5f];
                CAEmitterCell *yjjc_h_a3 = [GQAnimConfigure getCloudWithbirthRate:0.01f withcontentName:@"yjjc_h_a3" xAcceleration:0.5f];
                CAEmitterCell *yjjc_h_a4 = [GQAnimConfigure getCloudWithbirthRate:0.03f withcontentName:@"yjjc_h_a4"xAcceleration:0.5f];
                CAEmitterCell *yjjc_h_a5 = [GQAnimConfigure getCloudWithbirthRate:0.04f withcontentName:@"yjjc_h_a5"xAcceleration:0.5f];
                CAEmitterCell *yjjc_h_c2 = [GQAnimConfigure getCloudWithbirthRate:0.05f withcontentName:@"yjjc_h_c2"xAcceleration:0.5f];
                CAEmitterCell *yjjc_h_c3 = [GQAnimConfigure getCloudWithbirthRate:0.06f withcontentName:@"yjjc_h_c3"xAcceleration:0.5f];
                CAEmitterCell *yjjc_h_c4 = [GQAnimConfigure getCloudWithbirthRate:0.07f withcontentName:@"yjjc_h_c4"xAcceleration:0.5f];
                NSMutableArray *animationCell = [[NSMutableArray alloc] initWithCapacity:0];
                
                [animationCell addObjectsFromArray:[NSArray arrayWithObjects:yjjc_h_a2,yjjc_h_a3,yjjc_h_a4,yjjc_h_a5,yjjc_h_c2,yjjc_h_c3,yjjc_h_c4,nil]];
                
                CAEmitterLayer *_cloudyEmitter = [GQAnimConfigure configureLayerWithEmitterPosition:CGPointMake(-300, 100) withEmitterSize:CGSizeMake(0.0, 25.0) withEmitterMode:kCAEmitterLayerSurface withEmitterShape:kCAEmitterLayerLine withShadowOpacity:1.0 withShadowRadius:0.0 withShadowOffset:CGSizeMake(0.0, 1.0) withShadowColor:[[UIColor whiteColor] CGColor] withEmitterCells:animationCell];
                
                [_animationView.layer insertSublayer:_cloudyEmitter atIndex:0];
            }while(0);
            break;
        }
        //晴天动画
        case GQAnimationSun:{
            UIImageView *_sunshine1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunshine1"]];
            _sunshine1.frame = CGRectMake(0, 0, MIXSize, MIXSize);
            _sunshine1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _sunshine1.clipsToBounds = YES;
            _sunshine1.backgroundColor = [UIColor clearColor];
            [_animationView insertSubview:_sunshine1 atIndex:0];
            
            UIImageView *_sunshine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sunshine"]];
            _sunshine.frame = CGRectMake(0, 0, MIXSize, MIXSize);
            _sunshine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _sunshine.clipsToBounds = YES;
            _sunshine.backgroundColor = [UIColor clearColor];
            [_animationView insertSubview:_sunshine atIndex:0];
            
            UIImageView *_sun_large = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun_large"]];
            _sun_large.frame = CGRectMake(0, 0, MIXSize, MIXSize);
            _sun_large.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _sun_large.clipsToBounds = YES;
            _sun_large.backgroundColor = [UIColor clearColor];
            [_animationView insertSubview:_sun_large atIndex:0];
            do{
                CABasicAnimation *sunshineAnimation = [GQAnimConfigure configureRatationAnimation:100];
                [_sunshine1.layer addAnimation:sunshineAnimation forKey:@"transform"];
                [_sunshine.layer addAnimation:sunshineAnimation forKey:@"transform"];
            }while(0);
            break;
        }
        //雷阵雨效果
        case GQAnimationThunder:{
            UIImageView *_thunder = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lightning_1"]];
            _thunder.frame = CGRectMake(0, -50, MIXSize/4, MIXSize/4);
            [_thunder setTransform:CGAffineTransformMakeScale(0 ,0)];
            [_animationView addSubview:_thunder];
            
            UIImageView *_thunder1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lightning_2"]];
            _thunder1.frame = CGRectMake(MIXSize/2, -50, MIXSize/4, MIXSize/4);
            [_thunder1 setTransform:CGAffineTransformMakeScale(0 ,0)];
            [_animationView addSubview:_thunder1];
            
            UIImageView *_thunder2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lightning_01"]];
            _thunder2.frame = CGRectMake(MIXSize/5, 0, MIXSize/4, MIXSize/4);
            [_thunder2 setTransform:CGAffineTransformMakeScale(0 ,0)];
            [_animationView addSubview:_thunder2 ];
            
            CABasicAnimation *animation = [GQAnimConfigure configureThunderAnimation:1.0f];
            
            [_thunder.layer setAnchorPoint:CGPointMake(0.5, 0)];
            [_thunder.layer addAnimation:animation forKey:thunderAnimKey];
            
            animation.duration = 1.3f;
            [_thunder1.layer setAnchorPoint:CGPointMake(0.5, 0)];
            [_thunder1.layer addAnimation:animation forKey:thunderAnimKey];
            
            animation.duration = 1.5f;
            [_thunder2.layer setAnchorPoint:CGPointMake(0, 0)];
            [_thunder2.layer addAnimation:animation forKey:thunderAnimKey];
            do{
                CAEmitterCell *raindrop_l = [GQAnimConfigure getRainWithbirthRate:10.0f withcontentName:@"raindrop_l" yAcceleration:300];
                CAEmitterCell *raindrop_m = [GQAnimConfigure getRainWithbirthRate:20.0f withcontentName:@"raindrop_m" yAcceleration:300];
                CAEmitterCell *raindrop_s = [GQAnimConfigure getRainWithbirthRate:30.0f withcontentName:@"raindrop_s" yAcceleration:300];
                CAEmitterCell *raindrop_xl = [GQAnimConfigure getRainWithbirthRate:10.0f withcontentName:@"raindrop_xl" yAcceleration:300];
                NSMutableArray *animationCell = [[NSMutableArray alloc] initWithCapacity:0];
                
                [animationCell addObjectsFromArray:[NSArray arrayWithObjects:raindrop_l,raindrop_m,raindrop_s,raindrop_xl, nil]];
                
                CAEmitterLayer *_raindropEmitter = [GQAnimConfigure configureLayerWithEmitterPosition:CGPointMake(CGRectGetWidth(frame) / 2.0, -30) withEmitterSize:CGSizeMake(CGRectGetWidth(frame) * 2.0, 0.0) withEmitterMode:kCAEmitterLayerOutline withEmitterShape:kCAEmitterLayerLine withShadowOpacity:1.0 withShadowRadius:0.0 withShadowOffset:CGSizeMake(0.0, 1.0) withShadowColor:[[UIColor whiteColor] CGColor] withEmitterCells:animationCell];
                [_animationView.layer insertSublayer:_raindropEmitter atIndex:0];
            }while(0);
            break;
        }
        //雨天效果
        case GQAnimationRain:{
            do{
                CAEmitterCell *raindrop_l = [GQAnimConfigure getRainWithbirthRate:10.0f withcontentName:@"raindrop_l" yAcceleration:300];
                CAEmitterCell *raindrop_m = [GQAnimConfigure getRainWithbirthRate:20.0f withcontentName:@"raindrop_m" yAcceleration:300];
                CAEmitterCell *raindrop_s = [GQAnimConfigure getRainWithbirthRate:30.0f withcontentName:@"raindrop_s" yAcceleration:300];
                CAEmitterCell *raindrop_xl = [GQAnimConfigure getRainWithbirthRate:10.0f withcontentName:@"raindrop_xl" yAcceleration:300];
                NSMutableArray *animationCell = [[NSMutableArray alloc] initWithCapacity:0];
                
                [animationCell addObjectsFromArray:[NSArray arrayWithObjects:raindrop_l,raindrop_m,raindrop_s,raindrop_xl, nil]];
                
                CAEmitterLayer *_raindropEmitter = [GQAnimConfigure configureLayerWithEmitterPosition:CGPointMake(CGRectGetWidth(frame) / 2.0, -30) withEmitterSize:CGSizeMake(CGRectGetWidth(frame) * 2.0, 0.0) withEmitterMode:kCAEmitterLayerOutline withEmitterShape:kCAEmitterLayerLine withShadowOpacity:1.0 withShadowRadius:0.0 withShadowOffset:CGSizeMake(0.0, 1.0) withShadowColor:[[UIColor whiteColor] CGColor] withEmitterCells:animationCell];
                
                [_animationView.layer insertSublayer:_raindropEmitter atIndex:0];
            }while(0);
            break;
        }
        //星星闪烁效果
        case GQAnimationStar:{
            //随机生成多少个星星
            int number = arc4random() % (int)ceilf(MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)));
            for (int i = 0; i < number; i++) {
                //星星生成的x点
                int x = arc4random() % (int)ceilf(MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)));
                //星星生成的y点
                int y = arc4random() % (int)ceilf(MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)));
                
                //初始化星星
                UIImageView *_star = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star3"]];
                _star.contentMode = UIViewContentModeScaleAspectFit;
                _star.frame = CGRectMake(x, y, 30, 30);
                [_star setTransform:CGAffineTransformMakeScale(15, 15)];
                
                //生成星星闪烁动画
                CABasicAnimation *starAnimation = [GQAnimConfigure configureStarAnimation:[GQAnimConfigure randFloatBetween:0.5 and:1.5]];
                //添加动画到layer
                [_star.layer addAnimation:starAnimation forKey:starAnimKey];
                [_animationView addSubview:_star];
            }
            break;
        }
        //二维码扫描动画
        case GQAnimationScan:{
            _scaningView = [[GQScaningView alloc] initWithFrame:frame];
            _scaningView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.3];
            _scaningView.duration = 1.5f;
            _scaningView.repeatCount = 10;
            _scaningView.layer.cornerRadius = 2.0f;
            _scaningView.layer.masksToBounds = YES;
            _scaningView.layer.borderWidth = 1.0;
            _scaningView.layer.borderColor = [[UIColor whiteColor] CGColor];
            [_animationView addSubview:_scaningView];
            [_scaningView startScanning];
            break;
        }
        //脉冲动画
        case GQAnimationPulseHalo:{
            CGPoint center = self.animationView.center;
            _pulseHaloView = [[GQPulseHaloView alloc] initWithFrame:(CGRect){center,CGSizeMake(MIXSize, MIXSize)} withNumberPules:20];
            _pulseHaloView.center = center;
            [self.animationView addSubview:_pulseHaloView];
            [_pulseHaloView startAnimation];
            break;
        }
        default:
            break;
    }
}

//重置动画
- (void)resetType:(GQAnimationType)type{
    [self setAnimationType:type];
    [self setAnimationWithFrame:_rectFrame];
}

//暂停动画
- (void)pauseAnimation{
    _isAnimation = NO;
    if (_scaningView) {
        [_scaningView pauseScanning];
    }
    [_animationView pauseSubLayersAnimation:YES];
}

//恢复动画
- (void)resumeAnimation{
    _isAnimation = YES;
    [_animationView pauseSubLayersAnimation:NO];
}

@end
