//
//  DemoViewController.m
//  GQAnimationDemo
//
//  Created by 高旗 on 16/4/29.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "DemoViewController.h"

#import "GQAnimation.h"

@interface DemoViewController ()

@property (nonatomic ,strong) GQAnimation *animationView;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _navTitle;
    self.view.layer.contents = (id)[UIImage imageNamed:@"bg_cloud_night"].CGImage;
    UIButton *btnRight = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48.0f, 48.0f)];
    [btnRight setTitle:@"刷新" forState:UIControlStateNormal];
    [btnRight setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    self.navigationController.visibleViewController.navigationItem.rightBarButtonItem = itemRight;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _animationView = [[GQAnimation alloc] initWithFrame:self.view.bounds withAnimationType:_index withSuperView:self.view];
}

- (void)change:(id)sender{
    [_animationView resetType:GQAnimationStar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
