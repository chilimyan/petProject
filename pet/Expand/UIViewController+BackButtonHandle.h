//
//  UIViewController+BackButtonHandle.h
//  outwork
//
//  Created by john on 15/12/24.
//  Copyright © 2015年 fengzj. All rights reserved.
//返回按钮拦截

#import <UIKit/UIKit.h>
@protocol BackButtonHandlerProtocol

@optional

// Override this method in UIViewController derived class to handle 'Back' button click

-(BOOL)navigationShouldPopOnBackButton;
@end

@interface UIViewController (BackButtonHandle)

@end
