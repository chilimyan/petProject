//
//  CLSystemSet.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLSystemSet.h"

@implementation CLSystemSet

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

+ (void)justifyAppearance {

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.backgroundColor = [UIColor whiteColor];
    window.tintColor = [UIColor whiteColor];
    
    [[UITabBar appearance] setBarStyle:UIBarStyleDefault];

    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_TAB_DESEL} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_TAB_SEL} forState:UIControlStateSelected];

    [[UITabBar appearance] setBarTintColor:COLOR_TAB_BACK];
    [[UITabBar appearance] setTranslucent:NO];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"导航"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIButton appearanceWhenContainedIn:[UINavigationBar class], nil]  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    
//    [[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setTintColor:[UIColor whiteColor]];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    
    [[UISearchBar appearance] setSearchBarStyle:UISearchBarStyleDefault];
    [[UISearchBar appearance] setBackgroundImage:[UIImage new]];
    [[UISearchBar appearance] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    //返回按钮图片
    UIImage *backButtonImage = [[[UIImage imageNamed:@"返回按钮"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[UINavigationBar appearance] setBackIndicatorImage:backButtonImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backButtonImage];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(5,0) forBarMetrics:UIBarMetricsDefault];
}


@end
