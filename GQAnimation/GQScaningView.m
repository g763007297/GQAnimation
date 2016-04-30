//
//  ScaningView.m
//  Sunshine_mall
//
//  Created by apple on 15/4/20.
//  Copyright (c) 2015年 GQ. All rights reserved.
//

#import "GQScaningView.h"
#import <QuartzCore/QuartzCore.h>

#define scan_ratio	0.2

static UIImage *imageWithSize(CGSize size, UIInterfaceOrientation direction, UIColor *color)
{
    if (color==nil)
        return nil;
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGFloat locs[]={0, 1};
    
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient=CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color.CGColor, (id)[UIColor clearColor].CGColor],  locs);
    CGColorSpaceRelease(colorSpace);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    if (direction==UIInterfaceOrientationPortrait)
    {
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0, size.height), CGPointZero, 0);
    }else if (direction==UIInterfaceOrientationPortraitUpsideDown)
    {
        CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(0, size.height), 0);
    }else if (direction==UIInterfaceOrientationLandscapeLeft)
    {
        CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(size.width, 0), 0);
    }else
    {
        CGContextDrawLinearGradient(context, gradient, CGPointMake(size.width, 0), CGPointZero, 0);
    }
    
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    UIGraphicsEndImageContext();
    return image;
}

static UIColor *rgb_color(unsigned rgb)
{
    return [UIColor colorWithRed:1.0/0xff*(rgb>>16&0xff) green:1.0/0xff*(rgb>>8&0xff) blue:1.0/0xff*(rgb&0xff) alpha:1];
}

@interface GQScaningView () {
    UIImageView *_focusBar;
}

@end

@implementation GQScaningView

- (void)update
{
    switch (_scanDirection)
    {
        case UIInterfaceOrientationPortrait:
        {
            _focusBar.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height*scan_ratio);
            break;
        }
        case UIInterfaceOrientationLandscapeLeft:
        {
            _focusBar.frame=CGRectMake(self.bounds.size.width, 0, self.bounds.size.width*scan_ratio, self.bounds.size.height);
            break;
        }
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            _focusBar.frame=CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.bounds.size.height*scan_ratio);
            break;
        }
        case UIInterfaceOrientationLandscapeRight:
        {
            _focusBar.frame=CGRectMake(0, self.bounds.size.width, self.bounds.size.width*scan_ratio, self.bounds.size.height);
            break;
        }
        default:
            break;
    }
    _focusBar.image=imageWithSize(CGSizeMake(self.bounds.size.width, self.bounds.size.height*scan_ratio), _scanDirection, _focusColor);
}

- (void)addPhoto
{
    
    if(self.photoImage != nil)
    {
        UIView *backColorView = [[UIView alloc] initWithFrame:self.frame];
        [backColorView setBackgroundColor:[UIColor blackColor]];
        
        UIImageView *backgroungView = [[UIImageView alloc] initWithImage:self.photoImage];
        
        [backgroungView setContentMode:UIViewContentModeScaleAspectFit];
        
        //这里判断图片的大小,图片太宽
        if(((self.photoImage.size.width / self.photoImage.size.height) >= (self.frame.size.width / self.frame.size.height)) && self.photoImage.size.width > self.frame.size.width)
        {
            float rate = self.frame.size.width / self.photoImage.size.width;
            [backgroungView setFrame:CGRectMake(0, 0, self.photoImage.size.width * rate , self.photoImage.size.height * rate)];
        }
        else if(((self.photoImage.size.width / self.photoImage.size.height) <= (self.frame.size.width / self.frame.size.height)) && self.photoImage.size.height > self.frame.size.height)
        {
            float rate = self.frame.size.height / self.photoImage.size.height;
            [backgroungView setFrame:CGRectMake(0, 0, self.photoImage.size.width * rate , self.photoImage.size.height * rate)];
        }
        else
        {
            [backgroungView setFrame:CGRectMake(0, 0, self.photoImage.size.width, self.photoImage.size.height)];
        }
        
        
        [backColorView addSubview:backgroungView];
        [backgroungView setCenter:backColorView.center];
        
        [self insertSubview:backColorView atIndex:0];
    }
    
}

- (void)scanningDidStop
{
    _isScanning=NO;
}

- (void)startScanning
{
    [self addPhoto];
    
    if (_isScanning)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(scanningDidStop) object:nil];
        [_focusBar.layer removeAllAnimations];
    }
    
    [self update];
    
    _focusBar.hidden=NO;
    
    CABasicAnimation *anim=[CABasicAnimation animationWithKeyPath:@"position"];
    anim.duration=_duration;
    anim.repeatCount=_repeatCount;
    switch (_scanDirection)
    {
        case UIInterfaceOrientationPortrait:
        {
            anim.fromValue=[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width/2, 0)];
            anim.toValue=[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height)];
            break;
        }
        case UIInterfaceOrientationLandscapeLeft:
        {
            anim.fromValue=[NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height/2)];
            anim.toValue=[NSValue valueWithCGPoint:CGPointMake(0, self.frame.size.height/2)];
            break;
        }
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            anim.fromValue=[NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height)];
            anim.toValue=[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width/2, 0)];
            break;
        }
        case UIInterfaceOrientationLandscapeRight:
        {
            anim.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, self.bounds.size.height/2)];
            anim.toValue=[NSValue valueWithCGPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
            break;
        }
            
        default:
            break;
    }
    [_focusBar.layer addAnimation:anim forKey:@"slide"];
    [self performSelector:@selector(scanningDidStop) withObject:nil afterDelay:_repeatCount*_duration];
    _isScanning=YES;
}

- (void)stopScanning
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(scanningDidStop) object:nil];
    _focusBar.hidden=YES;
    [_focusBar.layer removeAllAnimations];
    _isScanning=NO;
}

- (void)setDuration:(float)duration
{
    _duration=MAX(duration, 0.1);
}

- (void)setRepeatCount:(unsigned)repeatCount
{
    _repeatCount=MAX(repeatCount, 1);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _focusBar=[UIImageView new];
        [self addSubview:_focusBar];
        self.clipsToBounds=YES;
        _focusBar.alpha=0.5;
        
        self.focusColor=rgb_color(0x0099ff);
        self.scanDirection=UIInterfaceOrientationPortrait;
        _duration=self.frame.size.height/130;
        _repeatCount=9999;
    }
    return self;
}


@end
