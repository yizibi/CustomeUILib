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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = @"图片添加水波纹标记";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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

@end
