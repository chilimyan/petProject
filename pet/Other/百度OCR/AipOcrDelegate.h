//
//  AipOcrDelegate.h
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AipOcrDelegate <NSObject>

@optional
- (void) ocrOnIdCardSuccessful:(id)result;

@optional
- (void) ocrOnBankCardSuccessful:(id)result;

@optional
- (void) ocrOnGeneralSuccessful:(id)resut;

@optional
- (void) ocrOnFail:(NSError *)error;
@end


