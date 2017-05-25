//
//  CLIntroductionVC.m
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLIntroductionVC.h"

@interface CLIntroductionVC ()

@property (nonatomic, strong)UIButton *loginBtn;
@property (nonatomic, strong)UIButton *registBtn;

@end

@implementation CLIntroductionVC

- (instancetype)init {
    self.coverImageNames = @[@"引导页01", @"引导页02", @"引导页03", @"引导页04"];
    //    self.backgroundImageNames = @[@"引导页01", @"引导页02", @"引导页03", @"引导页04"];
    self = [super init];
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.pageControl.hidden = YES;
    self.enterButton.hidden = YES;
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registBtn];
}

- (void)showIntro{
    
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    if(root.presentedViewController){
        root = root.presentedViewController;
    }
    [root.view addSubview:self.view];
    
    __typeof (&*self) __weak weakSelf = self;
    
    self.didSelectedEnter = ^() {
        [weakSelf.view removeFromSuperview];
    };
    
}

- (void)loginClicked{
    [self.view removeFromSuperview];
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen.width/2 - 150/2,kScreen.height - 20 - 44,150, 44)];
        [_loginBtn setImage:[UIImage imageNamed:@"登录"] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen.width/2 - 150/2,kScreen.height - 20 - 44 - 44 - 12,150, 44)];
        [_registBtn setImage:[UIImage imageNamed:@"注册"] forState:UIControlStateNormal];
        [_registBtn addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registBtn;
}


@end
