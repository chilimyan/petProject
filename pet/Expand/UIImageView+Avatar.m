//
//  UIImageView+Avatar.m
//  outwork
//
//  Created by fengzj on 15/6/12.
//  Copyright (c) 2015年 fengzj. All rights reserved.
//

#import "UIImageView+Avatar.h"
#import <objc/runtime.h>

static char *userInfo;
static char *showDetail;

@implementation UIImageView (Avatar)

- (void)setUser:(CLUser *)user{
    objc_setAssociatedObject(self, &userInfo, user, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CLUser *)user{
    return objc_getAssociatedObject(self, &userInfo);
}

- (void)setUserDetail:(showDetailBlock)userDetail{
     objc_setAssociatedObject(self, &showDetail, userDetail, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (showDetailBlock)userDetail{
    return objc_getAssociatedObject(self, &showDetail);
}

- (void)displayUser:(CLUser *)user withRadius:(CGFloat)withRadius isCircle:(BOOL)isCircle{
    // 基础配置
    self.userInteractionEnabled = YES;
    CGFloat radius = withRadius;
    UIImage *defaultImage = [UIImage getNameImage:user.userName];
    if (isCircle) {
        if (defaultImage.size.width > defaultImage.size.height) {
            radius = defaultImage.size.height/2;
        }else{
            radius = defaultImage.size.width/2;
        }
    }
    UIImage *nameImage = [defaultImage imageAddCornerWithRadius:radius];
    self.image = nameImage;
    // 下载图片
    if ([user.userPhoto isEqualToString:@""]) {
        self.image = nameImage;
    } else {
        [self sd_setImageWithURL:[NSURL URLWithString:user.userPhoto]
                placeholderImage:nameImage
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           if (image) {
                               if (isCircle) {
                                   if (image.size.width > image.size.height) {
                                       self.image = [image imageAddCornerWithRadius:image.size.height/2];
                                   }else{
                                       self.image = [image imageAddCornerWithRadius:image.size.width/2];
                                   }
                               }else{
                                   self.image = [image imageAddCornerWithRadius:radius];
                               }
                           } else {
                               self.image = nameImage;
                           }
                       }];
    }
}


- (void)displayUser:(CLUser *)user isCornerRadius:(BOOL)isCornerRadius{
    if (isCornerRadius) {
        [self displayUser:user withRadius:5 isCircle:NO];
    }else{
        [self displayUser:user withRadius:0 isCircle:NO];
    }
}

//显示头像并且点击查看大图
- (void)displayUser:(CLUser *)user withTouchBigImage:(BOOL)isTouch isCircle:(BOOL)isCircle{
    self.user = user;
    if (isCircle) {
        [self displayUser:self.user withRadius:0 isCircle:isCircle];
    }else{
        [self displayUser:self.user withRadius:0 isCircle:isCircle];
    }
    if (isTouch) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImage)];
        [self addGestureRecognizer:tapGesture];
    }
}

//显示头像并且点击查看用户详情
- (void)displayUser:(CLUser *)user withTouchDetail:(BOOL)isTouch isCircle:(BOOL)isCircle{
    self.user = user;
    if (isCircle) {
        [self displayUser:self.user withRadius:0 isCircle:isCircle];
    }else{
        [self displayUser:self.user withRadius:0 isCircle:isCircle];
    }
    if (isTouch) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDetail)];
        [self addGestureRecognizer:tapGesture];
    }
}

- (void)showDetail{
    if (self.userDetail) {
        self.userDetail();
    }
}

- (void)showImage{
    UIView *view = [[UIView alloc] init];
    view.frame = [UIScreen mainScreen].bounds;
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0;
    view.userInteractionEnabled = YES;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = [UIScreen mainScreen].bounds;
    imageView.backgroundColor = [UIColor blackColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:imageView];
    
    [imageView displayUser:self.user];
    
    [UIView animateWithDuration:0.4 animations:^{
        view.alpha = 1;
    } completion:^(BOOL finished) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideImage:)];
        [view addGestureRecognizer:tapGesture];
    }];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:view];
}

- (void)hideImage:(UITapGestureRecognizer *)gesture {
    [UIView animateWithDuration:0.4 animations:^{
        gesture.view.alpha = 0;
    } completion:^(BOOL finished) {
        [gesture.view removeFromSuperview];
    }];
}



@end

