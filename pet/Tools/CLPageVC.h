//
//  CLPageVC.h
//  vwork
//
//  Created by john on 16/10/14.
//  Copyright © 2016年 redsea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAPSPageMenu.h"

@interface CLPageVC : UIViewController

@property (nonatomic) CAPSPageMenu *pagemenu;
@property (nonatomic, strong)UISegmentedControl *segment;
@property (nonatomic, strong)NSMutableArray *controllerArray;
//获取子Controller
- (NSMutableArray *)getControllers;
//设置属性
- (NSDictionary *)getProperty;
//是否segment的page
- (BOOL)isSegmentPage;

@end
