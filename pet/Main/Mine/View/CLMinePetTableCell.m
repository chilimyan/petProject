//
//  CLMinePetTableCell.m
//  pet
//
//  Created by Apple on 2017/6/8.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMinePetTableCell.h"

@interface CLMinePetTableCell ()

@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIView *petBackView;
@property (nonatomic, strong) UIView *addPetBackView;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) NSMutableArray *petItemArray;

@end

@implementation CLMinePetTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews{
    UIView *petItemView = [self petItemView];
    UIView *petAddItemView = [self addPetItemView];
    self.petItemArray = [NSMutableArray array];
    [self.petItemArray addObject:petItemView];
    [self.petItemArray addObject:petAddItemView];
    [self.contentView addSubview:petItemView];
    [self.contentView addSubview:petAddItemView];
    
    [self.contentView addSubview:self.tipLabel];
}

- (void)setupConstraints{
    WS(weakSelf);
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(8);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
    }];
    [self.petItemArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [self.petItemArray mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.tipLabel.mas_bottom).mas_offset(10);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-10);
    }];
}

- (UIView *)addPetItemView{
    WS(weakSelf);
    UIImageView *headImage = [[UIImageView alloc] init];
    headImage.image = [UIImage imageNamed:@"我的关注"];
    [self.addPetBackView addSubview:headImage];
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = COLOR_BLACK_LIGHT;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.text = @"添加宠物";
    [self.addPetBackView addSubview:nameLabel];
    
    UIImageView *flagImage = [[UIImageView alloc] init];
    flagImage.image = [UIImage imageNamed:@"cell_right_icon"];
    [self.addPetBackView addSubview:flagImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.mas_equalTo(weakSelf.addPetBackView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(16, 16));
        make.left.mas_equalTo(weakSelf.addPetBackView.mas_left).mas_offset(10);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.mas_equalTo(weakSelf.addPetBackView.mas_centerY);
        make.left.mas_equalTo(headImage.mas_right).mas_offset(10);
        make.bottom.mas_equalTo(weakSelf.addPetBackView.mas_bottom).mas_offset(-12);
    }];
    [flagImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.mas_equalTo(weakSelf.addPetBackView.mas_centerY);
        make.right.mas_equalTo(weakSelf.addPetBackView.mas_right).mas_offset(-10);
    }];
    return self.addPetBackView;
}

- (void)configData{
    self.tipLabel.text = @"宠物";
}

- (UIView *)petItemView{
    WS(weakSelf);
    UIImageView *headImage = [[UIImageView alloc] init];
    [headImage displayUser:[CLUser userWithName:@"" userPhoto:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496988878693&di=a242fd04b7a361824f54a8803e03b5c8&imgtype=0&src=http%3A%2F%2Fmvimg2.meitudata.com%2F555c5629dde532592.jpg" userId:@""] withTouchDetail:NO isCircle:YES];
    [self.petBackView addSubview:headImage];
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = COLOR_BLACK_LIGHT;
    nameLabel.text = @"小白";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self.petBackView addSubview:nameLabel];
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.textColor = COLOR_GRAY;
    typeLabel.textAlignment = NSTextAlignmentLeft;
    typeLabel.font = [UIFont systemFontOfSize:12];
    typeLabel.text = @"萨摩耶犬";
    [self.petBackView addSubview:typeLabel];
    UIImageView *flagImage = [[UIImageView alloc] init];
    flagImage.image = [UIImage imageNamed:@"cell_right_icon"];
    [self.petBackView addSubview:flagImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.petBackView.mas_left).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.top.mas_equalTo(weakSelf.petBackView.mas_top).mas_offset(10);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(headImage.mas_top).mas_offset(2);
        make.left.mas_equalTo(headImage.mas_right).mas_offset(10);
        make.height.mas_equalTo(16);
    }];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(headImage.mas_right).mas_offset(10);
        make.top.mas_equalTo(nameLabel.mas_bottom).mas_offset(8);
        make.bottom.mas_equalTo(weakSelf.petBackView.mas_bottom).mas_offset(-10);
    }];
    [flagImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.mas_equalTo(weakSelf.petBackView.mas_centerY);
        make.right.mas_equalTo(weakSelf.petBackView.mas_right).mas_offset(-10);
    }];
    return self.petBackView;
}

- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.text = @"宠物";
        _tipLabel.textColor = COLOR_BLACK_LIGHT;
        _tipLabel.textAlignment = NSTextAlignmentLeft;
        _tipLabel.font = [UIFont systemFontOfSize:14];
    }
    return _tipLabel;
}

- (UIView *)petBackView{
    if (!_petBackView) {
        _petBackView = [[UIView alloc] init];
        _petBackView.layer.borderColor = COLOR_SEPLINE_GRAY.CGColor;
        _petBackView.layer.borderWidth = 1;
    }
    return _petBackView;
}
- (UIView *)addPetBackView{
    if (!_addPetBackView) {
        _addPetBackView = [[UIView alloc] init];
        _addPetBackView.layer.borderColor = COLOR_SEPLINE_GRAY.CGColor;
        _addPetBackView.layer.borderWidth = 1;
    }
    return _addPetBackView;
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
