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
    UIButton *refreashButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48.0f, 48.0f)];
    [refreashButton setTitle:@"刷新" forState:UIControlStateNormal];
    [refreashButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [refreashButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemRefreash = [[UIBarButtonItem alloc] initWithCustomView:refreashButton];
    
    UIButton *pauseAndResumeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 48.0f, 48.0f)];
    [pauseAndResumeButton setTitle:@"暂停" forState:UIControlStateNormal];
    [pauseAndResumeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [pauseAndResumeButton addTarget:self action:@selector(pauseAndResume:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *pauseAndResume = [[UIBarButtonItem alloc] initWithCustomView:pauseAndResumeButton];
    
    self.navigationController.visibleViewController.navigationItem.rightBarButtonItems = @[itemRefreash,pauseAndResume];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _animationView = [[GQAnimation alloc] initWithFrame:self.view.bounds withAnimationType:_index withSuperView:self.view];
}

- (void)change:(id)sender{
    [_animationView resetType:GQAnimationStar];
}

- (void)pauseAndResume:(id)sender{
    UIButton *button = (UIButton *)sender;
    if (_animationView.isAnimation) {
        [button setTitle:@"暂停" forState:UIControlStateNormal];
        [_animationView pauseAnimation];
    }else{
        [button setTitle:@"恢复" forState:UIControlStateNormal];
        [_animationView resumeAnimation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
