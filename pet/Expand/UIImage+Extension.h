//
//  UIImage+Extension.h
//  vwork
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 redsea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLUser.h"

@interface UIImage (Extension)

+ (UIImage *)getNameImage:(NSString *)name;
+ (UIImage *)clipImage:(UIImage *)image userName:(NSString *)userName;
- (UIImage *)subImageWithRect:(CGRect)rect;
+ (UIImage *)getGrouoNameImage:(NSString *)name;

@end

@interface UIImage (wiRoundedRectImage)

+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;
- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius;

@end

@interface UIImage (Group)

+ (UIImage *)getGroupImageWithUserList:(NSArray *)userList imageList:(NSArray *)imageList;

@end
