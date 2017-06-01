//
//  CLTabVC.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLTabVC.h"
#import "CLDoctorVC.h"
#import "CLServiceVC.h"
#import "CLMallVC.h"
#import "CLMineVC.h"
#import "CLCommunityVC.h"

@interface CLTabVC ()

@end

@implementation CLTabVC

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [self.selectedViewController beginAppearanceTransition:YES animated:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.selectedViewController endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.selectedViewController beginAppearanceTransition:NO animated:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.selectedViewController endAppearanceTransition];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加自控制器
    [self addChildController];
    
}

- (void)addChildController {
    UIViewController *vc = [[CLCommunityVC alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"社区" image:[[UIImage imageNamed:@"commu_desel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"commu_sel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    UIViewController *vc1 = [[CLDoctorVC alloc] init];
    vc1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"医生" image:[[UIImage imageNamed:@"doc_desel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"doc_sel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    UIViewController *vc2 = [[CLMallVC alloc] init];
    vc2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"商城" image:[[UIImage imageNamed:@"mall_desel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"mall_sel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    UIViewController *vc3 = [[CLServiceVC alloc] init];
    vc3.title = @"宠物服务";
    vc3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"服务" image:[[UIImage imageNamed:@"service_desel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"service_sel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    UIViewController *vc4 = [[CLMineVC alloc] initWithStyle:UITableViewStyleGrouped];
    vc4.title = @"个人中心";
    vc4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[[UIImage imageNamed:@"my_desel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"my_sel_tab_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    
    self.viewControllers  = [self getAuthority:@[nav,nav1,nav2,nav3,nav4]];
}

/**
 *  获取主菜单权限
 *
 *  @param viewControllers <#viewControllers description#>
 *
 *  @return 主菜单
 */
-(NSMutableArray *)getAuthority:(NSArray *)viewControllers{
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:viewControllers[0]];
    [tempArray addObject:viewControllers[1]];
    [tempArray addObject:viewControllers[2]];
    [tempArray addObject:viewControllers[3]];
    [tempArray addObject:viewControllers[4]];
    return tempArray;
}

@end
