//
//  CLMinePersonCenterCell.m
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMinePersonCenterCell.h"

@interface CLMinePersonCenterCell ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *nickLabel;

@end

@implementation CLMinePersonCenterCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.nickLabel];
}

- (void)setupConstraints{
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(12);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.headImage.mas_top).mas_offset(10);
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(10);
        make.bottom.mas_equalTo(self.nickLabel.mas_top).mas_offset(-10);
    }];
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(10);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        [_headImage displayUser:[CLShareObject shared].loginUser withTouchDetail:NO isCircle:YES];
    }
    return _headImage;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = COLOR_BLACK;
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.text = [CLShareObject shared].loginUser.userName;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UILabel *)nickLabel{
    if (!_nickLabel) {
        _nickLabel = [[UILabel alloc] init];
        _nickLabel.font = [UIFont systemFontOfSize:14];
        _nickLabel.text = [NSString stringWithFormat:@"账号：%@",[CLShareObject shared].loginUser.nickName];
        _nickLabel.textColor = COLOR_GRAY;
        _nickLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nickLabel;
}

@end
