//
//  CLDynamicHeadView.m
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLDynamicHeadView.h"

@interface CLDynamicHeadView ()

@property (nonatomic, strong)UIButton *tipBtn;

@end

@implementation CLDynamicHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tipBtn];
        [self setupConstrains];
    }
    return self;
}

- (void)setupConstrains{
    WS(weakSelf);
    [self.tipBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(weakSelf);
    }];
}

- (UIButton *)tipBtn{
    if (!_tipBtn) {
        _tipBtn = [[UIButton alloc] init];
        [_tipBtn setTitle:@"您可能感兴趣的宠友" forState:UIControlStateNormal];
        _tipBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_tipBtn setImage:[UIImage imageNamed:@"笑脸"] forState:UIControlStateNormal];
        [_tipBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_tipBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [_tipBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 4, 0, 0)];
        [_tipBtn setTitleColor:COLOR_TAB_DESEL forState:UIControlStateNormal];
    }
    return _tipBtn;
}

@end
