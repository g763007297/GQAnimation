//
//  UIView+Addition.h
//  GQAnimationDemo
//
//  Created by tusm on 16/4/30.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)

/**
 *  暂停view所有layer层的动画
 *
 *  @param pause YES?暂停:恢复
 */
- (void)pauseSubLayersAnimation:(BOOL)pause;

@end
