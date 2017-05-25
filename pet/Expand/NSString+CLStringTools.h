//
//  NSString+CLStringTools.h
//  vwork
//
//  Created by john on 16/8/16.
//  Copyright © 2016年 redsea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CLStringTools)
//匹配电话号码
- (BOOL)isPhoneNumber;
//匹配身份证号码
- (BOOL)checkUserIdCard;
//匹配URL
- (BOOL)checkURL;
//匹配邮箱
- (BOOL)validateEmail;
@end
