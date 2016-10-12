//
//  UIButton+badge.h
//  添加分类
//
//  Created by luowenx on 16/10/12.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+lwx_associate.h"

@interface UIButton (badge)
- (void)showBadge;

- (void)hideBadge;

@property (strong, nonatomic) UIColor * badgeColor;

@property (nonatomic) CGFloat badgeRadius;
@end


@interface UIButton (structure)

+ (UIButton *) buttonWithNormalTitle:(NSString *)title NormalTitleColor:(UIColor *)color BackgroundColor:(UIColor *)bgcolor;

@end
