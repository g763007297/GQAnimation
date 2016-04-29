//
//  GQAnimation.m
//  GQAnimationDemo
//
//  Created by 高旗 on 16/4/29.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "GQAnimation.h"
#import "GQAnimConfigure.h"
#import <QuartzCore/QuartzCore.h>

#import <objc/runtime.h>

static const NSString *animationType = @"animationType";

static NSString *thunderAnimKey = @"thunder";

static NSString *starAnimKey = @"star";

@interface GQAnimation()

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, assign) GQAnimationType animationType;

@property (nonatomic, assign) CGRect rectFrame;

@end

@implementation GQAnimation

- (id)initWithFrame:(CGRect)frame withAnimationType:(GQAnimationType)type withSuperView:(UIView *)superView{
    self = [super init];
    if (self) {
        _animationType = type;
        _rectFrame = frame;
        _animationView.backgroundColor = [UIColor clearColor];
        _animationView = [[UIView alloc] initWithFrame:frame];
        [_animationView setClipsToBounds:YES];
        [superView addSubview:_animationView];
        [self setAnimationWithFrame:frame];
    }
    return self;
}

- (void)setAnimationWithFrame:(CGRect)frame{
    CGFloat MAXSize = MAX(CGRectGetWidth(frame), CGRectGetHeight(frame));
    CGFloat MIXSize = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame));
    
    [_animationView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_animationView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    switch (_animationType) {
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
            int number = arc4random() % (int)ceilf(MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)));
            for (int i = 0; i < number; i++) {
                
                int x = arc4random() % (int)ceilf(MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)));
                
                int y = arc4random() % (int)ceilf(MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)));
                
                UIImageView *_star = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star3"]];
                
                _star.contentMode = UIViewContentModeScaleAspectFit;
                
                _star.frame = CGRectMake(x, y, 30, 30);
                
                [_star setTransform:CGAffineTransformMakeScale(15, 15)];
                
                CABasicAnimation *starAnimation = [GQAnimConfigure configureStarAnimation:[self randFloatBetween:0.5 and:1.5]];
                
                [_star.layer addAnimation:starAnimation forKey:starAnimKey];
                [_animationView addSubview:_star];
            }
            break;
        }
        default:
            break;
    }
}


-(float) randFloatBetween:(float)low and:(float)high
{
    float diff = high - low;
    return (((float) rand() / RAND_MAX) * diff) + low;
}

- (void)resetType:(GQAnimationType)type{
    _animationType = type;
    [self setAnimationWithFrame:_rectFrame];
}

@end
