//
//  ScaningView.h
//  Sunshine_mall
//
//  Created by apple on 15/4/20.
//  Copyright (c) 2015年 GQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GQScaningView : UIView

@property (nonatomic) UIInterfaceOrientation scanDirection;	//扫描方向,默认向下
@property (nonatomic, strong) UIColor *focusColor;	//焦点颜色,默认蓝色
@property (nonatomic, readonly) BOOL isScanning;
@property (nonatomic) float duration;	//单次扫描时间
@property (nonatomic) unsigned repeatCount;	//扫描次数,默认为9999
@property (nonatomic, weak) UIImage *photoImage;	//图像

- (void)startScanning;
- (void)stopScanning;

@end
