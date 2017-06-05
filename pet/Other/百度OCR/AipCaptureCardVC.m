//
//  AipCaptureCardVC.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "AipCaptureCardVC.h"

@interface AipCaptureCardVC ()

@end

@implementation AipCaptureCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(UIViewController *)ViewControllerWithCardType:(CardType)type andDelegate:(id<AipOcrDelegate>)delegate {
    
//    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"AipOcrSdk" bundle:[NSBundle bundleForClass:[self class]]];
//    
    AipCaptureCardVC *vc = [[AipCaptureCardVC alloc] init];
//    
//    vc.cardType = type;
//    vc.delegate = delegate;
//    
//    AipNavigationController *navController = [[AipNavigationController alloc] initWithRootViewController:vc];
//    return navController;
    return [[UINavigationController alloc] initWithRootViewController:vc];
}


@end
