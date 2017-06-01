//
//  UIView+Extension.m
//  pet
//
//  Created by Apple on 2017/6/1.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setCornerRadius:(CGFloat)radius
{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerAllCorners
                                           cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
