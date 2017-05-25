//
//  UIImage+Extension.m
//  vwork
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 redsea. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

//显示图片指定区域
- (UIImage *)subImageWithRect:(CGRect)rect
{
    CGImageRef newImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    
    return newImage;
}


+ (UIImage *)clipImage:(UIImage *)image userName:(NSString *)userName{
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[self getBgColor:userName].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 200, 200));
    if (image.size.width>image.size.height) {
        [image drawInRect:CGRectMake(0, 0, 200*image.size.width/image.size.height, 200)];
    } else {
        [image drawInRect:CGRectMake(0, 0, 200, 200*image.size.height/image.size.width)];
    }
    
    UIImage *photoImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return photoImage;
}

+ (UIColor *)getBgColor:(NSString *)userName{
//    if (userName) {
//        NSArray *bgColor = @[[UIColor colorWithHex:0xffbd0d],[UIColor colorWithHex:0x00ccff],[UIColor colorWithHex:0x02c579],[UIColor colorWithHex:0xff5857],[UIColor colorWithHex:0xffd258],[UIColor colorWithHex:0x69cef3],[UIColor colorWithHex:0x69e2ba],[UIColor colorWithHex:0xff9594],[UIColor colorWithHex:0xbfbfbf]];
//        NSData *nameData = [userName dataUsingEncoding:NSUTF8StringEncoding];
//        Byte *nameByte = (Byte *)[nameData bytes];
//        return bgColor[nameByte[nameData.length - 1] % bgColor.count];
//    }
    return [UIColor whiteColor];
}

+ (UIImage *)getNameImage:(NSString *)name{
    // 绘制背景
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[self getBgColor:name].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 200, 200));
    
    // 添加名字
    NSString *username = (name.length>2 ? [name substringFromIndex:name.length-2] : name);
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    [username drawInRect:CGRectMake(0, 60, 200, 80) withAttributes:@{NSParagraphStyleAttributeName:paragraph, NSFontAttributeName:[UIFont boldSystemFontOfSize:200/42*14], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 获取图片
    UIImage *nameImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return nameImage;
}

+ (UIImage *)getGrouoNameImage:(NSString *)name{
    // 绘制背景
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[self getBgColor:name].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 200, 200));
    
    // 添加名字
    NSString *username = (name.length>1 ? [name substringFromIndex:name.length-1] : name);
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    [username drawInRect:CGRectMake(0, 60, 200, 80) withAttributes:@{NSParagraphStyleAttributeName:paragraph, NSFontAttributeName:[UIFont boldSystemFontOfSize:200/42*14], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 获取图片
    UIImage *nameImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return nameImage;
}



@end

@implementation UIImage (wiRoundedRectImage)

- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius{
    CGSize newSize = CGSizeZero;
    if (self.size.width > self.size.height) {
        newSize = CGSizeMake(self.size.height, self.size.height);
    }else{
        newSize = CGSizeMake(self.size.width, self.size.width);
    }
    // 开始图形上下文
    UIGraphicsBeginImageContextWithOptions(newSize, NO, [UIScreen mainScreen].scale);
    // 设置一个范围，取图片中间部分
    CGRect rect = CGRectMake(self.size.width/2 - newSize.width/2, self.size.height/2 - newSize.height/2, newSize.width, newSize.height);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    [self drawInRect:rect];
    // 从上下文上获取剪裁后的照片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    
    if (ovalWidth == 0 || ovalHeight == 0)
    {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r
{
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedFirst;
#endif
    //    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, bitmapInfo);
    //    CGRect rect = CGRectMake(0, 0, w, h);
    
    float scaleFactor = [[UIScreen mainScreen] scale];
    CGContextRef context = CGBitmapContextCreate(NULL, w * scaleFactor, h * scaleFactor, 8, w * scaleFactor * 4, colorSpace, bitmapInfo);
    CGContextScaleCTM(context, scaleFactor, scaleFactor);
    
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, r, r);
    CGContextClosePath(context);
    CGContextClip(context);
    if(image.size.height>image.size.width){
        CGFloat realHeight = (w / (image.size.width * 1.0) ) * image.size.height;
        CGContextDrawImage(context, CGRectMake(0, -(realHeight-h)/2.0, w, realHeight), img.CGImage);
    }else{
        CGFloat realWidth = ( h / (image.size.height * 1.0) * image.size.width);
        CGContextDrawImage(context, CGRectMake(-(realWidth-w)/2.0, 0, realWidth, h), img.CGImage);
    }
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    img = [UIImage imageWithCGImage:imageMasked];
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scaleFactor);
    [img drawInRect:rect];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end


@implementation UIImage (Group)

+ (UIImage *)getGroupImageWithUserList:(NSArray *)userList imageList:(NSArray *)imageList{
    // 打开画板
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    
    // 翻转坐标
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, 200);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 根据数组获取图片
    [self drawImageWithUserList:userList context:context imageList:imageList];
    
    // 从画板获取UIImage对象
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭画板
    UIGraphicsEndImageContext();
    
    return image;
}

+ (void)drawImageWithUserList:(NSArray *)userList context:(CGContextRef)context imageList:(NSArray *)imageList{
    CGFloat width = 200;
    CGFloat height = 200;
    CGContextSetFillColorWithColor(context,[UIColor whiteColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, width, height));
    if (imageList.count == 0 || imageList.count == 1 || imageList.count == 2) {
        return ;
    }else if (imageList.count == 3){
        for (int i = 0; i < imageList.count; i ++) {
            CLUser *user = userList[i];
            if (i == 0) {
                CGContextMoveToPoint(context, 0, 0);
                CGContextAddRect(context, CGRectMake(0, 0,98, 200));
                // 闭合路径
                CGContextClosePath(context);
                // 填充  颜色
                CGContextSetFillColorWithColor(context,[self getBgColor:user.userName].CGColor);
                CGContextDrawPath(context, kCGPathFill);
                UIImage *image = imageList[i];
                
                image = [self clipImage:image userName:user.userName];
                image = [image subImageWithRect:CGRectMake(image.size.width/2 - 98/2, 0, 98,image.size.height)];
                CGContextDrawImage(context, CGRectMake(0, 0, 98, height), image.CGImage);
            }else if (i == 1){
                CGContextMoveToPoint(context, 101, 0);
                CGContextAddRect(context, CGRectMake(101, 0,99, 98));
                // 闭合路径
                CGContextClosePath(context);
                // 填充  颜色
                CGContextSetFillColorWithColor(context,[self getBgColor:user.userName].CGColor);
                CGContextDrawPath(context, kCGPathFill);
                UIImage *image = imageList[i];
                image = [self clipImage:image userName:user.userName];
                CGContextDrawImage(context, CGRectMake(101,0, 99, 98), image.CGImage);
            }
            else{
                CGContextMoveToPoint(context, 101, 101);
                CGContextAddRect(context, CGRectMake(101, 101,99, 99));
                // 闭合路径
                CGContextClosePath(context);
                // 填充  颜色
                CGContextSetFillColorWithColor(context,[self getBgColor:user.userName].CGColor);
                CGContextDrawPath(context, kCGPathFill);
                UIImage *image = imageList[i];
                image = [self clipImage:image userName:user.userName];
                CGContextDrawImage(context, CGRectMake(width/2 + 1, 101, 99, 99), image.CGImage);
            }
        }
    }else if (imageList.count == 4){
        for (int i = 0; i < imageList.count; i ++) {
            CLUser *user = userList[i];
            if (i == 0) {
                CGContextMoveToPoint(context, 0, 0);
                CGContextAddRect(context, CGRectMake(0, 0,98, 98));
                // 闭合路径
                CGContextClosePath(context);
                // 填充  颜色
                CGContextSetFillColorWithColor(context,[self getBgColor:user.userName].CGColor);
                CGContextDrawPath(context, kCGPathFill);
                UIImage *image = imageList[i];
                image = [self clipImage:image userName:user.userName];
                CGContextDrawImage(context, CGRectMake(0, 0, 98, 98), image.CGImage);
            }else if (i == 1){
                CGContextMoveToPoint(context, 101, 0);
                CGContextAddRect(context, CGRectMake(101, 0,99, 98));
                // 闭合路径
                CGContextClosePath(context);
                // 填充  颜色
                CGContextSetFillColorWithColor(context,[self getBgColor:user.userName].CGColor);
                CGContextDrawPath(context, kCGPathFill);
                UIImage *image = imageList[i];
                image = [self clipImage:image userName:user.userName];
                CGContextDrawImage(context, CGRectMake(width/2 + 1,0, 99, 98), image.CGImage);
            }
            else if (i == 2){
                CGContextMoveToPoint(context, 0, 101);
                CGContextAddRect(context, CGRectMake(0, 101,98, 99));
                // 闭合路径
                CGContextClosePath(context);
                // 填充  颜色
                CGContextSetFillColorWithColor(context,[self getBgColor:user.userName].CGColor);
                CGContextDrawPath(context, kCGPathFill);
                UIImage *image = imageList[i];
                image = [self clipImage:image userName:user.userName];
                CGContextDrawImage(context, CGRectMake(0,101, 98, 99), image.CGImage);
            }else{
                CGContextMoveToPoint(context, 101, 101);
                CGContextAddRect(context, CGRectMake(101, 101,99, 99));
                // 闭合路径
                CGContextClosePath(context);
                // 填充  颜色
                CGContextSetFillColorWithColor(context,[self getBgColor:user.userName].CGColor);
                CGContextDrawPath(context, kCGPathFill);
                UIImage *image = imageList[i];
                image = [self clipImage:image userName:user.userName];
                CGContextDrawImage(context, CGRectMake(width/2 + 1, 101, 99, 99), image.CGImage);
            }
        }
    }
    
}


@end

