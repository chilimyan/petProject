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
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *typeLabel;

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
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.petBackView];
    [self.contentView addSubview:self.tipLabel];
    [self.contentView addSubview:self.typeLabel];
}

- (void)setupConstraints{
    WS(weakSelf);
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
