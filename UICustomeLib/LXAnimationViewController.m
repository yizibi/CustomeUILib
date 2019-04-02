//
//  LXAnimationViewController.m
//  UICustomeLib
//
//  Created by lucy 李 on 2019/1/28.
//  Copyright © 2019年 liluxin. All rights reserved.
//

#import "LXAnimationViewController.h"
#import "LXMusicPlayingView.h"

@interface LXAnimationViewController ()

@end

@implementation LXAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"动画";
    self.view.backgroundColor = [UIColor whiteColor];
    LXMusicPlayingView *view = [[LXMusicPlayingView alloc] initWithFrame:CGRectMake(100, 200, 80,80) lineWidth:6 lineColor:[UIColor greenColor]];
    [self.view addSubview:view];
    
}



@end
