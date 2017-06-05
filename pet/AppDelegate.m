//
//  AppDelegate.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "AppDelegate.h"
#import "CLTabVC.h"
#import "CLSystemSet.h"
#import "CLIntroductionVC.h"
#import "CLBaiduOCRVC.h"

@interface AppDelegate ()

@property (nonatomic, strong) CLIntroductionVC *introductionVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[CLBaiduOCRVC alloc] initWithStyle:UITableViewStyleGrouped]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[CLTabVC alloc] init]];
    [self.window makeKeyWindow];
    
    // 欢迎页通知
    [self registerIntroduction];
    [CLSystemSet justifyAppearance];
    return YES;
}

- (void)registerIntroduction {
    // 第一次启动
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if(![userDefault boolForKey:@"firstLaunch"])
    {
        [userDefault setBool:YES forKey:@"firstLaunch"];
        [userDefault synchronize];
        [self showIntroduction];
    }
    
    // 欢迎页通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showIntroduction) name:@"showIntroduction" object:nil];
    
}

- (void)showIntroduction {
    self.introductionVC = [[CLIntroductionVC alloc] init];
    [self.introductionVC showIntro];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
