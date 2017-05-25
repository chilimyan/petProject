//
//  CLServiceChildCell.m
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLServiceChildCell.h"

@interface CLServiceChildCell ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *scoreLabel;

@end

@implementation CLServiceChildCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews{
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.addressBtn];
    [self.contentView addSubview:self.scoreLabel];
    [self.contentView addSubview:self.addressLabel];
}

- (void)setupConstraints{
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(12);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.headImage.mas_top).mas_offset(0);
        make.left.mas_equalTo(self.headImage.mas_left).mas_offset(12);
        make.bottom.mas_equalTo(self.moneyLabel.mas_top).mas_offset(-8);
    }];
    [self.addressBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.top.mas_equalTo(self.headImage.mas_top).mas_offset(2);
        make.height.mas_equalTo(14);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(kScreen.width - 120);
    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_left).mas_offset(12);
        make.bottom.mas_equalTo(self.addressLabel.mas_top).mas_offset(-8);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_left).mas_offset(12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-12);
    }];
    
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
    }
    return _headImage;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithCSS:@"#212121"];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = COLOR_GRAY;
        _addressLabel.font = [UIFont systemFontOfSize:13];
        _addressLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _addressLabel;
}


- (UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = [UIColor colorWithCSS:@"#fc7d7d"];
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _moneyLabel;
}

- (UILabel *)scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc] init];
        _scoreLabel.textColor = [UIColor colorWithCSS:@"#fc7d7d"];
        _scoreLabel.font = [UIFont systemFontOfSize:12];
        _scoreLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _scoreLabel;
}

- (UIButton *)addressBtn{
    if (!_addressBtn) {
        _addressBtn = [[UIButton alloc] init];
        [_addressBtn setTitleColor:[UIColor colorWithCSS:@"#aaaafc"] forState:UIControlStateNormal];
        _addressBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_addressBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
    return _addressBtn;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
