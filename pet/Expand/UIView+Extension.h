//
//  UIView+Extension.h
//  pet
//
//  Created by Apple on 2017/6/1.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

- (void)setCornerRadius:(CGFloat)radius;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@end
