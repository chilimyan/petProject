//
//  CLSelectSectionView.m
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLSelectSectionView.h"
#import <YYText.h>

@interface CLSelectSectionView ()

@property (nonatomic, strong)UIImageView *headImage;
@property (nonatomic, strong)YYLabel *userNameLabel;
@property (nonatomic, strong)UIButton *focusBtn;
@property (nonatomic, strong) CLSelectModel *selectModel;

@end

@implementation CLSelectSectionView

- (instancetype)initWithFrame:(CGRect)frame withSelectModel:(CLSelectModel *)model{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectModel = model;
        [self addSubview:self.headImage];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.focusBtn];
        [self loadData];
    }
    return self;
}

- (void)loadData{
    [self.headImage displayUser:[CLUser userWithName:self.selectModel.createName userPhoto:self.selectModel.createPhoto userId:self.selectModel.createId] withTouchDetail:NO isCircle:YES];
    NSMutableAttributedString *title = [NSMutableAttributedString new];
    NSMutableAttributedString *name = [[NSMutableAttributedString alloc] initWithString:self.selectModel.createName];
    name.yy_font = [UIFont systemFontOfSize:14];
    name.yy_color = COLOR_NAME;
    NSMutableAttributedString *address = [[NSMutableAttributedString alloc] initWithString:self.selectModel.createAddress];
    address.yy_font = [UIFont systemFontOfSize:12];
    address.yy_color = COLOR_GRAY;
    [title appendAttributedString:name];
    [title appendAttributedString:[self padding]];
    [title appendAttributedString:address];
    self.userNameLabel.attributedText = title;
}

- (NSAttributedString *)padding {
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"   "];
    return pad;
}

- (void)focusClicked:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,self.frame.size.height-20, self.frame.size.height-20)];
    }
    return _headImage;
}

- (YYLabel *)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel = [[YYLabel alloc] initWithFrame:CGRectMake(self.headImage.frame.origin.x + self.headImage.frame.size.width + 10,10 ,200, self.headImage.frame.size.height)];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        _userNameLabel.attributedText = [NSMutableAttributedString new];
    }
    return _userNameLabel;
}

- (UIButton *)focusBtn{
    if (!_focusBtn) {
        _focusBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 20-64,self.frame.size.height/2 - 30/2,64, 30)];
        [_focusBtn setImage:[UIImage imageNamed:@"关注"] forState:UIControlStateNormal];
        [_focusBtn setImage:[UIImage imageNamed:@"已关注"] forState:UIControlStateSelected];
        [_focusBtn addTarget:self action:@selector(focusClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _focusBtn;
}

@end
