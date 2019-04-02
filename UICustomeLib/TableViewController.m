//
//  TableViewController.m
//  UICustomeLib
//
//  Created by lucy 李 on 2018/9/11.
//  Copyright © 2018年 liluxin. All rights reserved.
//

#import "TableViewController.h"
#import "UIImage+LX_Extention.h"
#import "WMPhotoBrowser.h"
#import "LXAnimationViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"图片添加水波纹标记";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"音符动画";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIImage *image = [UIImage imageNamed:@"map"];
        UIImage *newImage = [UIImage imageWithOriginalName:image signColor:[UIColor redColor] signPositionX: 0.653 ignPositionY:0.453];
        WMPhotoBrowser *browser = [WMPhotoBrowser new];
        browser.dataSource = @[newImage].mutableCopy;
        browser.downLoadNeeded = NO;
        browser.deleteNeeded = NO;
        browser.photoName = @"标题";
        browser.device_pos_x = 0.653;
        browser.device_pos_y = 0.453;
        browser.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:browser animated:YES];
    }
    else if (indexPath.row == 1) {
        LXAnimationViewController *VC = [[LXAnimationViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end
