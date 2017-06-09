//
//  CLMineAlbumTableCell.m
//  pet
//
//  Created by Apple on 2017/6/9.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMineAlbumTableCell.h"
#import <YYText.h>

@interface CLMineAlbumTableCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) YYLabel *dateLabel;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) YYLabel *contentLabel;
@property (nonatomic, strong) UICollectionView *collectionview;

@end

@implementation CLMineAlbumTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews{
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.contentLabel];
//    [self.contentView addSubview:self.collectionview];
}

- (void)configData{
    NSMutableAttributedString *date = [NSMutableAttributedString new];
    NSMutableAttributedString *day = [[NSMutableAttributedString alloc] initWithString:@"12"];
    day.yy_font = [UIFont boldSystemFontOfSize:20];
    day.yy_color = COLOR_BLACK_LIGHT;
    NSMutableAttributedString *month = [[NSMutableAttributedString alloc] initWithString:@"06"];
    month.yy_font = [UIFont systemFontOfSize:14];
    month.yy_color = COLOR_GRAY;
    [date appendAttributedString:day];
    [date appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n"]];
    [date appendAttributedString:month];
    self.dateLabel.attributedText = date;
}

- (void)setupConstraints{
    WS(weakSelf);
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.contentView.mas_left);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(10);
        make.width.mas_equalTo(kScreen.width/4);
    }];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.dateLabel.mas_right).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-10);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.headImage.mas_right).mas_offset(12);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.top.mas_equalTo(weakSelf.headImage.mas_top);
        make.bottom.mas_equalTo(weakSelf.headImage.mas_bottom);
    }];
}

- (YYLabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[YYLabel alloc] init];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLabel;
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
    }
    return _headImage;
}

- (YYLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[YYLabel alloc] init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLabel;
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
