//
//  AipCaptureCardVC.h
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AipOcrDelegate.h"

typedef NS_ENUM(NSInteger, CardType) {
    
    CardTypeIdCardFont = 0,
    CardTypeIdCardBack,
    CardTypeBankCard
};


@interface AipCaptureCardVC : UIViewController

@property (nonatomic, assign) CardType cardType;
@property (nonatomic, weak) id<AipOcrDelegate> delegate;

+(UIViewController *)ViewControllerWithCardType:(CardType)type andDelegate:(id<AipOcrDelegate>)delegate;

@end
