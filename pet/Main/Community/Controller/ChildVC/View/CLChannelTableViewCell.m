//
//  CLChannelTableViewCell.m
//  pet
//
//  Created by chilim on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLChannelTableViewCell.h"
#import "CLChannelImagesView.h"
#import <YYText.h>

@interface CLChannelTableViewCell ()

@property (nonatomic, strong) CLChannelImagesView *channelImagesView;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) YYLabel *contentLabel;
@property (nonatomic, strong) YYLabel *nameLabel;

@end

@implementation CLChannelTableViewCell

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
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.channelImagesView];
}

- (void)setupConstraints{
    WS(weakSelf);
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(10);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.headImage.mas_bottom).mas_offset(12);
        make.bottom.mas_equalTo(weakSelf.channelImagesView.mas_top).mas_offset(-12);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.mas_equalTo(weakSelf.headImage.mas_centerY);
        make.left.mas_equalTo(weakSelf.headImage.mas_right).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
    }];
    [self.channelImagesView mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(0);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-12);
    }];
}

- (void)setChannelModel:(CLChannelModel *)channelModel{
    [self.headImage displayUser:[CLUser userWithName:channelModel.createName userPhoto:channelModel.createPhoto userId:channelModel.createId] withTouchDetail:NO isCircle:YES];
    NSMutableAttributedString *contentlabelStr = [NSMutableAttributedString new];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:channelModel.content];
    content.yy_font = [UIFont systemFontOfSize:14];
    NSMutableAttributedString *flag = [[NSMutableAttributedString alloc] initWithString:channelModel.themeContent];
    [flag setYy_color:COLOR_NAME];
    flag.yy_font = [UIFont systemFontOfSize:14];
    [contentlabelStr appendAttributedString:flag];
    [contentlabelStr appendAttributedString:content];
    [contentlabelStr setYy_lineSpacing:6.0f];
    self.contentLabel.attributedText = contentlabelStr;
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:channelModel.createName];
    nameStr.yy_font = [UIFont systemFontOfSize:14];
    nameStr.yy_color = COLOR_NAME;
    self.nameLabel.attributedText = nameStr;
    
    if (channelModel.imageUrls.count == 1) {
        [self.channelImagesView mas_updateConstraints:^(MASConstraintMaker *make){
            make.height.mas_equalTo(230);
        }];
    }else{
        NSInteger colum = channelModel.imageUrls.count % 3 != 0 ? (channelModel.imageUrls.count /3 + 1) : channelModel.imageUrls.count /3;
        CGFloat height = colum * (kScreen.width - 20 - 20)/3 + (colum -1)*10;
        [self.channelImagesView mas_updateConstraints:^(MASConstraintMaker *make){
            make.height.mas_equalTo(height);
        }];
    }
    self.channelImagesView.picPathStringsArray = channelModel.imageUrls;
}

- (CLChannelImagesView *)channelImagesView{
    if (!_channelImagesView) {
        _channelImagesView = [[CLChannelImagesView alloc] init];
    }
    return _channelImagesView;
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
        _contentLabel.numberOfLines = 0;
        _contentLabel.preferredMaxLayoutWidth = kScreen.width - 20;
    }
    return _contentLabel;
}

- (YYLabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[YYLabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.preferredMaxLayoutWidth = kScreen.width - 20-30;
    }
    return _nameLabel;
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
