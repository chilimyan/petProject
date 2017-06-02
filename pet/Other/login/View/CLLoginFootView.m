//
//  CLLoginFootView.m
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLLoginFootView.h"

@interface CLLoginFootView ()

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *forgetBtn;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UIButton *sinaBtn;
@property (nonatomic, strong) UIButton *wxBtn;
@property (nonatomic, strong) UIButton *qqBtn;

@end

@implementation CLLoginFootView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
        [self setupConstrain];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.forgetBtn];
    [self addSubview:self.loginBtn];
    [self addSubview:self.wxBtn];
    [self addSubview:self.sinaBtn];
    [self addSubview:self.qqBtn];
    [self addSubview:self.moreBtn];
}

- (void)setupConstrain{
    WS(weakSelf);
    [@[self.forgetBtn,self.loginBtn] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:158 leadSpacing:20 tailSpacing:20];
    [@[self.forgetBtn,self.loginBtn] mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(20);
        make.bottom.mas_equalTo(weakSelf.sinaBtn.mas_top).mas_offset(-40);
    }];
    [@[self.sinaBtn,self.wxBtn,self.qqBtn] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:44 leadSpacing:90 tailSpacing:90];
    [@[self.sinaBtn,self.wxBtn,self.qqBtn] mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(44);
        make.bottom.mas_equalTo(weakSelf.moreBtn.mas_top).mas_offset(-20);
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.mas_equalTo(weakSelf.mas_bottom).mas_offset(-10);
        make.top.mas_equalTo(weakSelf.sinaBtn.mas_bottom).mas_offset(20);
        make.width.mas_equalTo(120);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}

- (void)loginClicked{
    if (self.loginBlock) {
        self.loginBlock();
    }
}
- (void)forgetClicked{
    
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"登录1"] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _loginBtn;
}

- (UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] init];
        [_forgetBtn addTarget:self action:@selector(forgetClicked) forControlEvents:UIControlEventTouchUpInside];
        [_forgetBtn setBackgroundImage:[UIImage imageNamed:@"忘记了"] forState:UIControlStateNormal];
        [_forgetBtn setTitle:@"忘记了？" forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgetBtn setTitleColor:[UIColor colorWithCSS:@"#5c5af7"] forState:UIControlStateNormal];
    }
    return _forgetBtn;
}

- (UIButton *)sinaBtn{
    if (!_sinaBtn) {
        _sinaBtn = [[UIButton alloc] init];
        [_sinaBtn addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
        [_sinaBtn setImage:[UIImage imageNamed:@"微博"] forState:UIControlStateNormal];
    }
    return _sinaBtn;
}

- (UIButton *)wxBtn{
    if (!_wxBtn) {
        _wxBtn = [[UIButton alloc] init];
        [_wxBtn addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
        [_wxBtn setImage:[UIImage imageNamed:@"微信"] forState:UIControlStateNormal];
    }
    return _wxBtn;
}


- (UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [[UIButton alloc] init];
        [_qqBtn addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
        [_qqBtn setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    }
    return _qqBtn;
}


- (UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc] init];
        [_moreBtn addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_moreBtn setTitle:@"更多登录方式" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor colorWithCSS:@"#bdbdbd"] forState:UIControlStateNormal];
    }
    return _moreBtn;
}


@end
