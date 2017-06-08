//
//  CLHeadInfoView.m
//  pet
//
//  Created by Apple on 2017/6/8.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLHeadInfoView.h"
#import "UIView+Extension.h"
#import <YYText.h>

@interface CLHeadInfoView ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) YYLabel *nameLabel;
@property (nonatomic, strong) UIView *itemBackView;

@end

@implementation CLHeadInfoView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubViews];
        [self setupConstraints];
        [self loadData];
    }
    return self;
}

- (void)addSubViews{
    [self addSubview:self.headImage];
    [self addSubview:self.nameLabel];
    [self addSubview:self.itemBackView];
}

- (void)setupConstraints{
     WS(weakSelf);
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(0);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.headImage.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.height.mas_equalTo(20);
    }];
    [self.itemBackView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).mas_offset(-10);
        make.height.mas_equalTo(60);
    }];
    NSArray *title = @[@[@"9.8万",@"赞"],@[@"8322",@"魅力值"],@[@"560",@"关注"],@[@"746",@"粉丝"]];
    for (int i = 0; i < title.count; i ++) {
        [self.itemBackView addSubview:[self getItemView:title[i][0] downLabel:title[i][1]]];
    }
    [self.itemBackView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:4 leadSpacing:4 tailSpacing:4];
    [self.itemBackView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.itemBackView.mas_top).offset(4);
        make.bottom.mas_equalTo(weakSelf.itemBackView.mas_bottom).mas_offset(-4);
    }];
}

- (void)loadData{
    [self.headImage displayUser:[CLShareObject shared].loginUser withTouchDetail:NO isCircle:YES];
    NSMutableAttributedString *name = [[NSMutableAttributedString alloc] initWithString:[CLShareObject shared].loginUser.userName];
    name.yy_font = [UIFont systemFontOfSize:16];
    name.yy_color = [UIColor whiteColor];
    self.nameLabel.attributedText = name;
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
//        _headImage.layer.borderColor = [UIColor whiteColor].CGColor;
//        _headImage.layer.borderWidth = 1;
    }
    return _headImage;
}

- (YYLabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[YYLabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UIView *)itemBackView{
    if (!_itemBackView) {
        _itemBackView = [[UIView alloc] init];
        _itemBackView.backgroundColor = [UIColor whiteColor];
        _itemBackView.layer.cornerRadius = 7;
        _itemBackView.layer.masksToBounds = YES;
    }
    return _itemBackView;
}

- (UIView *)getItemView:(NSString *)upText downLabel:(NSString *)downText{
    UIView *itemView = [[UIView alloc] init];
//    itemView.backgroundColor = [UIColor redColor];
    UILabel *upLabel = [[UILabel alloc] init];
    upLabel.textAlignment = NSTextAlignmentCenter;
    upLabel.textColor = [UIColor colorWithCSS:@"#7c8084"];
    upLabel.font = [UIFont systemFontOfSize:14];
    upLabel.text = upText;
    [itemView addSubview:upLabel];
    
    UILabel *downLabel = [[UILabel alloc] init];
    downLabel.textAlignment = NSTextAlignmentCenter;
    downLabel.textColor = [UIColor colorWithCSS:@"#7c8084"];
    downLabel.font = [UIFont systemFontOfSize:14];
    downLabel.text = downText;
    [itemView addSubview:downLabel];
    
    [upLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(itemView.mas_top).mas_offset(8);
        make.centerX.mas_equalTo(itemView.mas_centerX);
    }];
    [downLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(upLabel.mas_bottom).mas_offset(4);
        make.bottom.mas_equalTo(itemView.mas_bottom).mas_offset(-8);
        make.centerX.mas_equalTo(itemView.mas_centerX);
    }];
    return itemView;
}

@end
