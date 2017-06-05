//
//  CLCommunityVC.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLCommunityVC.h"
#import "CAPSPageMenu.h"
#import "CLChildCommunityVC.h"
#import "CLCommunityViewModel.h"

@interface CLCommunityVC ()<CAPSPageMenuDelegate>

@property (nonatomic) CAPSPageMenu *pagemenu;
@property (nonatomic, strong) UIButton *photoBtn;
@property (nonatomic, strong) NSMutableArray *controllerArray;

@end

@implementation CLCommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pagemenu.view];
    [self.view addSubview:self.photoBtn];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)photoClicked{
    
}

- (NSMutableArray *)getControllers{
    [self.controllerArray removeAllObjects];
    //一定要设置title
    for (int i= 0; i < 3; i ++) {
        switch (i) {
                case 0:
            {
                CLChildCommunityVC *vc = [[CLChildCommunityVC alloc]initWithStyle:UITableViewStylePlain];
                vc.title = SELECT_TITLE;
                vc.parentVC = self;
                [self.controllerArray addObject:vc];
            }
                break;
                case 1:
            {
                CLChildCommunityVC *vc = [[CLChildCommunityVC alloc]initWithStyle:UITableViewStyleGrouped];
                vc.title = DYNAMIC_TITLE;
                vc.parentVC = self;
                [self.controllerArray addObject:vc];
            }
                break;
                case 2:
            {
                CLChildCommunityVC *vc = [[CLChildCommunityVC alloc]initWithStyle:UITableViewStyleGrouped];
                vc.title = CHANNEL_TITLE;
                vc.parentVC = self;
                [self.controllerArray addObject:vc];
            }
                break;
                
            default:
                break;
        }
    }
    return self.controllerArray;
}


- (NSDictionary *)getProperty{
    return @{
             CAPSPageMenuOptionViewBackgroundColor: COLOR_BACK_GRAY,
             CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"导航"]],
             CAPSPageMenuOptionUnselectedMenuItemLabelColor: [UIColor whiteColor],
             CAPSPageMenuOptionSelectionIndicatorColor: [UIColor whiteColor],
             CAPSPageMenuOptionSelectedMenuItemLabelColor: [UIColor whiteColor],
             CAPSPageMenuOptionMenuItemFont: [UIFont systemFontOfSize:17.0],
             CAPSPageMenuOptionMenuHeight: @(64.0),
             CAPSPageMenuOptionAddBottomMenuHairline: @(NO),
             CAPSPageMenuOptionUseMenuLikeSegmentedControl: @(NO),
             CAPSPageMenuOptionCenterMenuItems: @(YES),
             CAPSPageMenuOptionMenuItemWidth: @(75.0),
             CAPSPageMenuOptionSelectionIndicatorHeight: @(2.0),
             CAPSPageMenuOptionHideTopMenuBar: @(NO),
             CAPSPageMenuOptionMenuMargin: @(-2.0),
             CAPSPageMenuOptionTextAndLineMargin: @(10.0)
             };
}


- (CAPSPageMenu *)pagemenu{
    if (!_pagemenu) {
        _pagemenu = [[CAPSPageMenu alloc] initWithViewControllers:[self getControllers] frame:CGRectMake(0.0, 0, kScreen.width, kScreen.height) options:[self getProperty]];
        _pagemenu.view.backgroundColor = COLOR_BACK_GRAY;
        _pagemenu.delegate = self;
        
    }
    return _pagemenu;
}

- (UIButton *)photoBtn{
    if (!_photoBtn) {
        _photoBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen.width - 70,20,70, 40)];
        [_photoBtn addTarget:self action:@selector(photoClicked) forControlEvents:UIControlEventTouchUpInside];
        [_photoBtn setImage:[UIImage imageNamed:@"相机"] forState:UIControlStateNormal];
    }
    return _photoBtn;
}

- (NSMutableArray *)controllerArray{
    if (!_controllerArray) {
        _controllerArray = [[NSMutableArray alloc]init];
    }
    
    return _controllerArray;
}


@end
