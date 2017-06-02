//
//  CLLoginTableCell.m
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLLoginTableCell.h"

@interface CLLoginTableCell ()

@property (nonatomic, strong) UIImageView *tipImage;

@end

@implementation CLLoginTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupViews];
        [self setupConstraints];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupViews{
    [self.contentView addSubview:self.tipImage];
}

- (void)setupConstraints{
    [self.tipImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(14, 14));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}


- (UIImageView *)tipImage{
    if (!_tipImage) {
        _tipImage = [[UIImageView alloc] init];
    }
    return _tipImage;
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

@interface CLConturyTableCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numLabel;

@end

@implementation CLConturyTableCell

- (void)setupViews{
    [super setupViews];
    self.tipImage.image = [UIImage imageNamed:@"中国"];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numLabel];
}

- (void)setupConstraints{
    [super setupConstraints];
    WS(weakSelf);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.tipImage.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
        make.width.mas_equalTo(120);
    }];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
        make.width.mas_equalTo(120);
    }];
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = COLOR_BLACK_LIGHT;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"中国";
    }
    return _nameLabel;
}

- (UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.textColor = COLOR_BLACK_LIGHT;
        _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.font = [UIFont systemFontOfSize:14];
        _numLabel.text = @"+86";
    }
    return _numLabel;
}

@end

@interface CLUserNameTableCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation CLUserNameTableCell

- (void)setupViews{
    [super setupViews];
    self.tipImage.image = [UIImage imageNamed:@"输入手机号"];
    [self.contentView addSubview:self.textField];
}

- (void)setupConstraints{
    [super setupConstraints];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.tipImage.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.placeholder = @"请输入手机号码";
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = COLOR_BLACK_LIGHT;
        _textField.tintColor = COLOR_BLACK_LIGHT;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}

@end

@interface CLPasswordTableCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation CLPasswordTableCell

- (void)setupViews{
    [super setupViews];
    self.tipImage.image = [UIImage imageNamed:@"输入密码"];
    [self.contentView addSubview:self.textField];
}

- (void)setupConstraints{
    [super setupConstraints];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.tipImage.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.placeholder = @"请输入密码";
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = COLOR_BLACK_LIGHT;
        _textField.secureTextEntry = YES;
        _textField.tintColor = COLOR_BLACK_LIGHT;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}


@end
