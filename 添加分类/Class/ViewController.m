//
//  ViewController.m
//  添加分类
//
//  Created by luowenx on 16/10/12.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "ViewController.h"
#import "UIBarButtonItem+Badge.h"
#import "UIButton+badge.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"主页";
    
    [self createNavLeftButton];
    [self createButton];
    
    // set  badgeValue
    // 红点位置可根据 badgeOffsetX、badgeOffsetY调整，也可直接设置badgeOriginX、badgeOriginY
    self.navigationItem.leftBarButtonItem.badgeValue = @"33";
    self.navigationItem.leftBarButtonItem.shouldAnimateBadge = YES;
    
}

// init  left  navigationItem
- (void) createNavLeftButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(15, 5, 38, 38);
    
    btn.backgroundColor = [UIColor orangeColor];
    
    [btn setTitle:@"左边" forState:(UIControlStateNormal)];
    
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
    [btn addTarget:self action:@selector(onBack) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

// init  button
- (void) createButton
{
    //  normal  button
    
    UIButton *customBtn = [UIButton buttonWithNormalTitle:@"正常的按钮"
                                         NormalTitleColor: [UIColor orangeColor]
                                               BackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:customBtn];
    customBtn.frame = CGRectMake(10, 70, 200, 30);
    
    //  ...
    UIButton *badgeButton = [UIButton buttonWithNormalTitle:@"有红点的按钮"
                                           NormalTitleColor: [UIColor orangeColor]
                                                 BackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:badgeButton];
    badgeButton.frame = CGRectMake(10, 170, 200, 30);
    [badgeButton showBadge];
    [self.view addSubview:badgeButton];

}

- (void) onBack
{
    NSInteger num  = [self.navigationItem.leftBarButtonItem.badgeValue integerValue];
    num++;
    self.navigationItem.leftBarButtonItem.badgeValue = [NSString stringWithFormat:@"%@",@(num)];
}



@end
