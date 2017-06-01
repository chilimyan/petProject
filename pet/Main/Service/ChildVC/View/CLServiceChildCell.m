//
//  CLServiceChildCell.m
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLServiceChildCell.h"
#import "UIView+Extension.h"

@interface CLServiceChildCell ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UIView *imageScoreView;
@property (nonatomic, strong) UIButton *callBtn;

@property (nonatomic, strong) NSMutableArray *starArray;

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
    [self.contentView addSubview:self.callBtn];
    [self.contentView addSubview:self.imageScoreView];
}

- (void)setupConstraints{
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(12);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.headImage.mas_top).mas_offset(0);
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(12);
        make.bottom.mas_equalTo(self.moneyLabel.mas_top).mas_offset(-8);
    }];
    [self.callBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.headImage.mas_top).mas_offset(0);
        make.height.mas_equalTo(26);
        make.width.mas_equalTo(26);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-16);
    }];
    [self.addressBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.top.mas_equalTo(self.headImage.mas_top).mas_offset(2);
        make.height.mas_equalTo(14);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(kScreen.width - 120);
    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(12);
        make.bottom.mas_equalTo(self.addressLabel.mas_top).mas_offset(-8);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-12);
    }];
    [self.imageScoreView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.moneyLabel.mas_right).mas_offset(8);
        make.width.mas_equalTo(84);
        make.centerY.mas_equalTo(self.moneyLabel.mas_centerY);
    }];
    [self.starArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:3 leadSpacing:3 tailSpacing:3];
    [self.starArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageScoreView.mas_top).offset(0);
        make.bottom.mas_equalTo(self.imageScoreView.mas_bottom).mas_offset(0);
    }];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.mas_equalTo(self.moneyLabel.mas_centerY);
        make.left.mas_equalTo(self.imageScoreView.mas_right).mas_offset(8);
    }];
}

- (void)setFosterCareModel:(FosterCareModel *)fosterCareModel{
    _fosterCareModel = fosterCareModel;
    self.callBtn.hidden = YES;
    self.headImage.image = [UIImage imageNamed:_fosterCareModel.imageUrl];
    self.titleLabel.text = _fosterCareModel.title;
    self.moneyLabel.text = [NSString stringWithFormat:@"平均%@元/天",_fosterCareModel.money];
    self.addressLabel.text = _fosterCareModel.address;
    [self.addressBtn setTitle:_fosterCareModel.distance forState:UIControlStateNormal];
    self.scoreLabel.text = _fosterCareModel.score;
    for (int i = 0; i < [_fosterCareModel.scoreCount integerValue]; i ++) {
        UIImageView *starImage = self.starArray[i];
        starImage.image = [UIImage imageNamed:@"Star Copy 3"];
    }
}

- (void)configDoctorData:(FosterCareModel *)model{
    _fosterCareModel = model;
    self.headImage.image = [UIImage imageNamed:_fosterCareModel.imageUrl];
    self.titleLabel.text = _fosterCareModel.title;
    self.moneyLabel.text = [NSString stringWithFormat:@"平均%@元/天",_fosterCareModel.money];
    self.addressLabel.text = _fosterCareModel.address;
    [self.addressBtn setTitle:_fosterCareModel.distance forState:UIControlStateNormal];
    self.scoreLabel.text = _fosterCareModel.score;
    for (int i = 0; i < [_fosterCareModel.scoreCount integerValue]; i ++) {
        UIImageView *starImage = self.starArray[i];
        starImage.image = [UIImage imageNamed:@"Star Copy 3"];
    }
    [self layoutIfNeeded];
    [self.addressBtn mas_updateConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(26 + 10+10);
    }];
    [self.callBtn setCornerRadius:13];
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
    }
    return _headImage;
}

- (UIView *)imageScoreView{
    if (!_imageScoreView) {
        self.starArray = [NSMutableArray array];
        _imageScoreView = [[UIView alloc] init];
        _imageScoreView.backgroundColor = [UIColor clearColor];
        for (int i = 0; i < 5; i ++) {
            UIImageView *starImage = [[UIImageView alloc] init];
            starImage.image = [UIImage imageNamed:@"Star Copy 4"];
            [_imageScoreView addSubview:starImage];
            [self.starArray addObject:starImage];
        }
    }
    return _imageScoreView;
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
        [_addressBtn setImage:[UIImage imageNamed:@"定位距离"] forState:UIControlStateNormal];
        _addressBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 3);
    }
    return _addressBtn;
}

- (UIButton *)callBtn{
    if (!_callBtn) {
        _callBtn = [[UIButton alloc] init];
        [_callBtn setImage:[UIImage imageNamed:@"电话"] forState:UIControlStateNormal];
        _callBtn.backgroundColor = [UIColor colorWithCSS:@"#7b7afe"];
    }
    return _callBtn;
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
