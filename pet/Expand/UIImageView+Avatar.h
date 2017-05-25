//
//  UIImageView+Avatar.h
//  outwork
//
//  Created by fengzj on 15/6/12.
//  Copyright (c) 2015年 fengzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLUser.h"
#import "UIImage+Extension.h"

@interface UIImageView (Avatar)

typedef void (^showDetailBlock)();

@property (nonatomic , strong)CLUser *user;
@property (nonatomic, copy) showDetailBlock userDetail;
//圆角默认为5
- (void)displayUser:(CLUser *)user;
//是否要圆角，圆角默认为5
- (void)displayUser:(CLUser *)user isCornerRadius:(BOOL)isCornerRadius;
//显示头像并且点击查看大图
- (void)displayUser:(CLUser *)user withTouchBigImage:(BOOL)isTouch isCircle:(BOOL)isCircle;
//显示头像并且点击查看用户详情
- (void)displayUser:(CLUser *)user withTouchDetail:(BOOL)isTouch isCircle:(BOOL)isCircle;


@end

