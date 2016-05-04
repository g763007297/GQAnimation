//
//  TableViewController.m
//  GQAnimationDemo
//
//  Created by 高旗 on 16/4/29.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "TableViewController.h"

#import "DemoViewController.h"

@interface TableViewController (){
    NSArray *array;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.layer.contents = (id)[UIImage imageNamed:@"bg_cloud_night"].CGImage;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    array = @[@"晴天",@"雨天",@"多云",@"雷阵雨",@"星星",@"二维码扫描动画",@"脉冲动画"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.backgroundView = [[UIView alloc] init];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoViewController *detailViewController = [[DemoViewController alloc] init];
    detailViewController.navTitle = array[indexPath.row];
    detailViewController.index = (int)indexPath.row;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
