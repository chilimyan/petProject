//
//  CLProgressLayer.h
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

/* 进度条风格 */
typedef NS_ENUM(NSUInteger, CLProgressStyle) {
    /* 默认风格 */
    CLProgressStyleNoraml,
    /* 渐变风格 */
    CLProgressStyleGradual,
};


@interface CLProgressLayer : CAShapeLayer

/* 进度条显示风格 */
@property (nonatomic, assign) CLProgressStyle progressStyle;
/* 进度条颜色，默认白色 */
@property (nonatomic, strong) UIColor *progressColor;

/**
 进度条开始加载
 */
- (void)progressAnimationStart;

/**
 进度条加载完成
 */
- (void)progressAnimationCompletion;

@end
