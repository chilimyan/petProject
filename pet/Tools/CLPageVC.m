//
//  CLPageVC.m
//  vwork
//
//  Created by john on 16/10/14.
//  Copyright © 2016年 redsea. All rights reserved.
//

#import "CLPageVC.h"

@interface CLPageVC ()<CAPSPageMenuDelegate>

@end

@implementation CLPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //配置界面
    if ([self isSegmentPage]) {
       self.navigationItem.titleView = self.segment;
    }
    
    [self.view addSubview:self.pagemenu.view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isSegmentPage{
    return NO;
}

- (NSMutableArray *)getControllers{
    return self.controllerArray;
}

- (NSDictionary *)getProperty{
    if ([self isSegmentPage]) {
        return @{
                 CAPSPageMenuOptionHideTopMenuBar: @(YES)
                 };
    }
    return @{
             CAPSPageMenuOptionViewBackgroundColor: [UIColor whiteColor],
             CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor whiteColor],
             CAPSPageMenuOptionUnselectedMenuItemLabelColor: COLOR_BTN,
             CAPSPageMenuOptionSelectionIndicatorColor: COLOR_GRAY,
             CAPSPageMenuOptionSelectedMenuItemLabelColor: COLOR_RED,
             CAPSPageMenuOptionMenuItemFont: [UIFont systemFontOfSize:14.0],
             CAPSPageMenuOptionMenuHeight: @(40.0),
             CAPSPageMenuOptionAddBottomMenuHairline: @(YES),
             CAPSPageMenuOptionUseMenuLikeSegmentedControl: @(YES)
             };
}

#pragma mark -response methods
- (void)segmentChange:(UISegmentedControl *)segment{
    [self.pagemenu moveToPage:segment.selectedSegmentIndex];
}


#pragma mark -CAPSPageMenuDelegate
- (void)willMoveToPage:(UIViewController *)controller index:(NSInteger)index{
    
}

- (void)didMoveToPage:(UIViewController *)controller index:(NSInteger)index{
    if ([self isSegmentPage]) {
        self.segment.selectedSegmentIndex = index;
    }
}
#pragma mark -setters and getters

- (CAPSPageMenu *)pagemenu{
    if (!_pagemenu) {
        _pagemenu = [[CAPSPageMenu alloc] initWithViewControllers:[self getControllers] frame:CGRectMake(0.0, 64, kScreen.width, kScreen.height - 64) options:[self getProperty]];
        _pagemenu.view.backgroundColor = [UIColor whiteColor];
        _pagemenu.delegate = self;
        _pagemenu.menuItemWidth = 75;
    }
    return _pagemenu;
}

- (UISegmentedControl *)segment{
    if (!_segment) {
        _segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(kScreen.width/2 - 120/2,10, 120, 35)];
        [_segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segment;
}

- (NSMutableArray *)controllerArray{
    if (!_controllerArray) {
        _controllerArray = [[NSMutableArray alloc]init];
    }
    
    return _controllerArray;
}


@end
