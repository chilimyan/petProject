//
//  UIViewController+Extention.m
//  outwork
//
//  Created by john on 15/11/27.
//  Copyright © 2015年 fengzj. All rights reserved.
//

#import "UIViewController+Extention.h"
#import <objc/runtime.h>

@implementation UIViewController (Extention)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    Class class = [self class];
    swizzleMethod(class, @selector(viewDidLoad), @selector(aop_viewDidLoad));
    swizzleMethod(class, @selector(viewDidAppear:), @selector(aop_viewDidAppear:));
    swizzleMethod(class, @selector(viewWillAppear:), @selector(aop_viewWillAppear:));
    swizzleMethod(class, @selector(viewWillDisappear:), @selector(aop_viewWillDisappear:));
});
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)   {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)aop_viewDidAppear:(BOOL)animated {
    [self aop_viewDidAppear:animated];
}

-(void)aop_viewWillAppear:(BOOL)animated {
    [self aop_viewWillAppear:animated];
}

-(void)aop_viewWillDisappear:(BOOL)animated {
    [self aop_viewWillDisappear:animated];
}

- (void)aop_viewDidLoad {
    [self aop_viewDidLoad];
    //注意，不加这个判断右滑会出现不知名bug
    if (!([self isKindOfClass:NSClassFromString(@"UINavigationController")]
          || [self isKindOfClass:NSClassFromString(@"UIInputWindowController")]
          || [self isKindOfClass:NSClassFromString(@"UIAlertController")]
        || [self isKindOfClass:NSClassFromString(@"UIApplicationRotationFollowingController")]
          || [self isKindOfClass:NSClassFromString(@"UICompatibilityInputViewController")])) {
        self.view.backgroundColor = COLOR_BACK_GRAY;

        self.extendedLayoutIncludesOpaqueBars = YES;
    }
}

@end
