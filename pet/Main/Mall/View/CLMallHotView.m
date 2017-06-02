//
//  CLMallHotView.m
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMallHotView.h"

@interface CLMallHotView ()

@property (nonatomic, strong) UIView *backView;

@end


@implementation CLMallHotView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.backView];
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    WS(weakSelf);
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(weakSelf);
    }];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.textColor = COLOR_BLACK;
    tipLabel.text = @"热门推荐";
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:tipLabel];
    
    UIImageView *bannerImage = [[UIImageView alloc] init];
    bannerImage.image = [UIImage imageNamed:@"Banner04"];
    [self addSubview:bannerImage];
    
    UILabel *leftNameLabel = [[UILabel alloc] init];
    leftNameLabel.text = @"铲屎官入门";
    leftNameLabel.font = [UIFont systemFontOfSize:14];
    leftNameLabel.textColor = COLOR_BLACK;
    leftNameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:leftNameLabel];
    
    UILabel *leftMoneyLabel = [[UILabel alloc] init];
    leftMoneyLabel.text = @"领券满99减5";
    leftMoneyLabel.font = [UIFont systemFontOfSize:12];
    leftMoneyLabel.textColor = [UIColor whiteColor];
    leftMoneyLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Rectangle 14"]];
    leftMoneyLabel.textAlignment = NSTextAlignmentLeft;
    leftMoneyLabel.preferredMaxLayoutWidth = (200);
    [leftMoneyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];
    [leftMoneyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:leftMoneyLabel];
    
    UIImageView *leftImage = [[UIImageView alloc] init];
    leftImage.image = [UIImage imageNamed:@"timg-2.jpeg"];
    [self addSubview:leftImage];
    
    UIView *midleLine = [[UIView alloc] init];
    midleLine.backgroundColor = COLOR_BACK_GRAY;
    [self addSubview:midleLine];
    
    UILabel *rightTopLabel = [[UILabel alloc] init];
    rightTopLabel.text = @"限时折扣";
    rightTopLabel.font = [UIFont systemFontOfSize:14];
    rightTopLabel.textColor = COLOR_BLACK;
    rightTopLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:rightTopLabel];
    
    UILabel *rightTopMoneyLabel = [[UILabel alloc] init];
    rightTopMoneyLabel.text = @"3.9元起开抢";
    rightTopMoneyLabel.font = [UIFont systemFontOfSize:12];
    rightTopMoneyLabel.textColor = [UIColor whiteColor];
    rightTopMoneyLabel.textAlignment = NSTextAlignmentLeft;
    rightTopMoneyLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Rectangle 14"]];
    rightTopMoneyLabel.preferredMaxLayoutWidth = (200);
    [rightTopMoneyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                    forAxis:UILayoutConstraintAxisHorizontal];
    [rightTopMoneyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:rightTopMoneyLabel];
    
    UIImageView *rightTopImage = [[UIImageView alloc] init];
    rightTopImage.image = [UIImage imageNamed:@"铲屎官"];
    [self addSubview:rightTopImage];
    
    UILabel *rightDownLabel = [[UILabel alloc] init];
    rightDownLabel.text = @"限时折扣";
    rightDownLabel.font = [UIFont systemFontOfSize:14];
    rightDownLabel.textColor = COLOR_BLACK;
    rightDownLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:rightDownLabel];
    
    UILabel *rightDownMoneyLabel = [[UILabel alloc] init];
    rightDownMoneyLabel.text = @"3.9元起开抢";
    rightDownMoneyLabel.font = [UIFont systemFontOfSize:12];
    rightDownMoneyLabel.textColor = [UIColor whiteColor];
    rightDownMoneyLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Rectangle 14"]];
    rightDownMoneyLabel.textAlignment = NSTextAlignmentLeft;
    rightDownMoneyLabel.preferredMaxLayoutWidth = (200);
    [rightDownMoneyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                        forAxis:UILayoutConstraintAxisHorizontal];
    [rightDownMoneyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:rightDownMoneyLabel];
    
    UIImageView *rightDownImage = [[UIImageView alloc] init];
    rightDownImage.image = [UIImage imageNamed:@"铲屎官"];
    [self addSubview:rightDownImage];
    
    UIView *rightLine = [[UIView alloc] init];
    rightLine.backgroundColor = COLOR_BACK_GRAY;
    [self addSubview:rightLine];
    
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(bannerImage.mas_top).mas_offset(-10);
    }];
    [bannerImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(140);
        make.bottom.mas_equalTo(midleLine.mas_top).mas_offset(0);
    }];
    [midleLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).mas_offset(kScreen.width/3*1.7);
        make.width.mas_equalTo(1);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(0);
        make.top.mas_equalTo(bannerImage.mas_bottom).mas_offset(0);
    }];
    [leftNameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.top.mas_equalTo(bannerImage.mas_bottom).mas_offset(40);
        make.right.mas_equalTo(leftImage.mas_left).mas_offset(-4);
        make.bottom.mas_equalTo(leftMoneyLabel.mas_top).mas_offset(-5);
    }];
    [leftMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.top.mas_equalTo(leftNameLabel.mas_bottom).mas_offset(5);
    }];
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(0);
        make.right.mas_equalTo(midleLine.mas_left).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(108,190));
    }];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(midleLine.mas_right).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(bannerImage.mas_bottom).mas_offset(114);
    }];
    [rightTopLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.mas_equalTo(leftNameLabel.mas_centerY);
        make.left.mas_equalTo(midleLine.mas_right).mas_offset(10);
        make.right.mas_equalTo(rightTopImage.mas_left).mas_offset(-10);
        make.bottom.mas_equalTo(rightTopMoneyLabel.mas_top).mas_offset(-5);
    }];
    [rightTopMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(midleLine.mas_right).mas_offset(10);
        make.top.mas_equalTo(rightTopLabel.mas_bottom).mas_offset(5);
    }];
    [rightTopImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(71, 70));
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
        make.top.mas_equalTo(bannerImage.mas_bottom).mas_offset(30);
    }];
    [rightDownLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(rightLine.mas_bottom).mas_offset(40);
        make.bottom.mas_equalTo(rightDownMoneyLabel.mas_top).mas_offset(-5);
        make.left.mas_equalTo(midleLine.mas_right).mas_offset(10);
        make.right.mas_equalTo(rightDownImage.mas_left).mas_offset(-10);
    }];
    [rightDownMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(rightDownLabel.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(midleLine.mas_right).mas_offset(10);
    }];
    [rightDownImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
        make.top.mas_equalTo(rightLine.mas_bottom).mas_offset(30);
        make.size.mas_equalTo(CGSizeMake(71, 70));
    }];
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

@end
