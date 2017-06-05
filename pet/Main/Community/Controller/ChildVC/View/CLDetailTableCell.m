//
//  CLDetailTableCell.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLDetailTableCell.h"
#import <YYText.h>
#import "CLChannelImagesView.h"

@interface CLDetailTableCell ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) YYLabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIButton *focusBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) YYLabel *contentLabel;
@property (nonatomic, strong) CLChannelImagesView *channelImagesView;

@end

@implementation CLDetailTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews{
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.focusBtn];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.channelImagesView];
    [self.contentView addSubview:self.likeBtn];
    [self.contentView addSubview:self.commentBtn];
}

- (void)setupConstraints{
    WS(weakSelf);
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(10);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.headImage.mas_top).mas_offset(4);
        make.left.mas_equalTo(weakSelf.headImage.mas_right).mas_offset(10);
        make.bottom.mas_equalTo(weakSelf.timeLabel.mas_top).mas_offset(-4);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(_nameLabel.mas_left);
        make.bottom.mas_equalTo(weakSelf.headImage.mas_bottom).mas_offset(-2);
        
    }];
    [self.focusBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(62, 31));
        make.centerY.mas_equalTo(weakSelf.headImage.mas_centerY);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(weakSelf.channelImagesView.mas_top).mas_offset(-12);
        make.top.mas_equalTo(weakSelf.headImage.mas_bottom).mas_offset(12);
    }];
    [self.channelImagesView mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(0);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-12);
    }];
//    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make){
//        make.right.mas_equalTo(weakSelf.commentBtn.mas_left).mas_offset(-5);
//        make.height.mas_equalTo(20);
//        make.centerY.mas_equalTo(weakSelf.tipLabel.mas_centerY);
//    }];
//    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make){
//        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
//        make.height.mas_equalTo(20);
//        make.centerY.mas_equalTo(weakSelf.tipLabel.mas_centerY);
//    }];
}

- (void)setSelectModel:(CLSelectModel *)selectModel{
    _selectModel = selectModel;
}

- (void)focusClicked:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (void)likeClcked:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (CLChannelImagesView *)channelImagesView{
    if (!_channelImagesView) {
        _channelImagesView = [[CLChannelImagesView alloc] init];
    }
    return _channelImagesView;
}

- (YYLabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[YYLabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
    }
    return _headImage;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = COLOR_GRAY;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _timeLabel;
}
- (UIButton *)focusBtn{
    if (!_focusBtn) {
        _focusBtn = [[UIButton alloc] init];
        [_focusBtn setImage:[UIImage imageNamed:@"关注"] forState:UIControlStateNormal];
        [_focusBtn setImage:[UIImage imageNamed:@"已关注"] forState:UIControlStateSelected];
        [_focusBtn addTarget:self action:@selector(focusClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _focusBtn;
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

- (UIButton *)likeBtn{
    if (!_likeBtn) {
        _likeBtn = [[UIButton alloc] init];
        [_likeBtn addTarget:self action:@selector(likeClcked:) forControlEvents:UIControlEventTouchUpInside];
        _likeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_likeBtn setImage:[UIImage imageNamed:@"com_desel_like_btn"] forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"com_sel_like_btn"] forState:UIControlStateSelected];
        [_likeBtn setTitleColor:COLOR_GRAY forState:UIControlStateNormal];
    }
    return _likeBtn;
}

- (UIButton *)commentBtn{
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc] init];
        [_commentBtn addTarget:self action:@selector(likeClcked:) forControlEvents:UIControlEventTouchUpInside];
        [_commentBtn setImage:[UIImage imageNamed:@"com_comment_nor_btn"] forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_commentBtn setTitleColor:COLOR_GRAY forState:UIControlStateNormal];
    }
    return _commentBtn;
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