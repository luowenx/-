//
//  UIButton+badge.m
//  添加分类
//
//  Created by luowenx on 16/10/12.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "UIButton+badge.h"

char const *badgeColorKey  = "badgeColorKey";
char const *badgeRadiusKey = "badgeRadiusKey";

@interface UIButton ()
lwx_property_strong(UIView*, badgeView)

@end


@implementation UIButton (badge)

//显示小红点
- (void)showBadge{
    //移除之前的小红点
    [self removeBadge];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 666;
    badgeView.layer.cornerRadius = 5;
    badgeView.layer.masksToBounds = YES;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect titleFrame = self.frame;
    
    //确定小红点的位置,此处根据需求定义位置
    
    badgeView.frame = CGRectMake(titleFrame.size.width -15 , 5, 10, 10);

    self.badgeView = badgeView;
    [self addSubview:self.badgeView];
}
//隐藏小红点
- (void)hideBadge{
    //移除小红点
    [self removeBadge];
}
//移除小红点
- (void)removeBadge{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 666) {
            [subView removeFromSuperview];
        }
    }
}
lwx_def_property_strong(UIView*, badgeView)
-(UIColor *)badgeColor{
    return [self lwx_getAssociatedObjectForKey:badgeColorKey];
}
-(void)setBadgeColor:(UIColor *)badgeColor{
    [self willChangeValueForKey:@"badgeColor"];  // 使支持kvo
    [self lwx_retainAssociatedObject:badgeColor forKey:badgeColorKey];
    [self didChangeValueForKey:@"badgeColor"];
    self.badgeView.backgroundColor = badgeColor;
}
- (CGFloat)badgeRadius{
    return [[self lwx_getAssociatedObjectForKey:badgeRadiusKey] floatValue];
}
-(void)setBadgeRadius:(CGFloat)badgeRadius{
    [self lwx_retainAssociatedObject:@(badgeRadius) forKey:badgeRadiusKey];
    [self.badgeView setBounds:CGRectMake(0, 0, badgeRadius * 2, badgeRadius * 2)];
    [self.badgeView.layer setCornerRadius:badgeRadius];
    [self.badgeView.layer setMasksToBounds:YES];
}


@end

@implementation UIButton (structure)

+ (UIButton *) buttonWithNormalTitle:(NSString *)title
                    NormalTitleColor:(UIColor *)color
                          BackgroundColor:(UIColor *)bgcolor
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:color forState:(UIControlStateNormal)];
    [btn setBackgroundColor:bgcolor];
    return btn;
}



@end


