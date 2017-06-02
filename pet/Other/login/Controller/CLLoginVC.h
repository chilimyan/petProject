//
//  CLLoginVC.h
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLLoginVC : UITableViewController

@property (nonatomic, copy) void(^loginBlock)();

@end
