//
//  UIViewController+BackButtonHandle.m
//  outwork
//
//  Created by john on 15/12/24.
//  Copyright © 2015年 fengzj. All rights reserved.
//

#import "UIViewController+BackButtonHandle.h"

@implementation UIViewController (BackButtonHandle)

- (BOOL)navigationShouldPopOnBackButton{
    [self.navigationController popViewControllerAnimated:YES];
    return NO;
}

@end

@implementation UINavigationController (ShouldPopOnBackButton)

/**
 *  截取系统的viewController返回事件
 *
 *  @param navigationBar <#navigationBar description#>
 *  @param item          <#item description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem*)item {
    
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        
        return YES;
        
    }
    
    
    BOOL shouldPop = YES;
    
    UIViewController* vc = [self topViewController];
    
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        
        shouldPop = [vc navigationShouldPopOnBackButton];
        
    }
    
    
    if(shouldPop) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self popViewControllerAnimated:YES];
            
        });
        
    } else {
        
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        
        for(UIView *subview in [navigationBar subviews]) {
            
            if(subview.alpha < 1.) {
                
                [UIView animateWithDuration:.25 animations:^{
                    
                    subview.alpha = 1.;
                    
                }];
                
            }
            
        }
        
    }
    
    
    return NO;
    
}


@end
