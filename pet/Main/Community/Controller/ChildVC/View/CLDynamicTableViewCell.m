//
//  CLDynamicTableViewCell.m
//  pet
//
//  Created by Apple on 2017/5/22.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLDynamicTableViewCell.h"
#import <YYText.h>

@interface CLDynamicTableViewCell ()

@property (nonatomic, strong)YYLabel *nameLabel;
@property (nonatomic, strong)UIImageView *headImage;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIButton *focusBtn;
@property (nonatomic, strong)YYLabel *contentLabel;
@property (nonatomic, strong)UIImageView *topImage;
@property (nonatomic, strong)UILabel *tipLabel;
@property (nonatomic, strong)UIButton *likeBtn;
@property (nonatomic, strong)UIButton *commentBtn;

@end

@implementation CLDynamicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews{
    _nameLabel = [[YYLabel alloc] init];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_nameLabel];
    
    _headImage = [[UIImageView alloc] init];
    [self.contentView addSubview:_headImage];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.textColor = COLOR_GRAY;
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    _timeLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_timeLabel];
    
    _focusBtn = [[UIButton alloc] init];
    [_focusBtn setImage:[UIImage imageNamed:@"关注"] forState:UIControlStateNormal];
    [_focusBtn setImage:[UIImage imageNamed:@"已关注"] forState:UIControlStateSelected];
    [_focusBtn addTarget:self action:@selector(focusClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_focusBtn];
    
    _contentLabel = [[YYLabel alloc] init];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    _contentLabel.numberOfLines = 0;
    _contentLabel.preferredMaxLayoutWidth = kScreen.width - 20;
    [self.contentView addSubview:_contentLabel];
    
    _topImage = [[UIImageView alloc] init];
    _topImage.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_topImage];
    
    _tipLabel = [[UILabel alloc] init];
    _tipLabel.textColor = COLOR_GRAY;
    _tipLabel.font = [UIFont systemFontOfSize:12];
    _tipLabel.text = @"";
    _tipLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_tipLabel];
    
    _likeBtn = [[UIButton alloc] init];
    [_likeBtn addTarget:self action:@selector(likeClcked:) forControlEvents:UIControlEventTouchUpInside];
    _likeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_likeBtn setImage:[UIImage imageNamed:@"com_desel_like_btn"] forState:UIControlStateNormal];
    [_likeBtn setImage:[UIImage imageNamed:@"com_sel_like_btn"] forState:UIControlStateSelected];
    [_likeBtn setTitleColor:COLOR_GRAY forState:UIControlStateNormal];
    [self.contentView addSubview:_likeBtn];
    
    _commentBtn = [[UIButton alloc] init];
    [_commentBtn addTarget:self action:@selector(likeClcked:) forControlEvents:UIControlEventTouchUpInside];
    [_commentBtn setImage:[UIImage imageNamed:@"com_comment_nor_btn"] forState:UIControlStateNormal];
    _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_commentBtn setTitleColor:COLOR_GRAY forState:UIControlStateNormal];
    [self.contentView addSubview:_commentBtn];
}

- (void)setupConstraints{
    WS(weakSelf);
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(10);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.headImage.mas_top).mas_offset(4);
        make.left.mas_equalTo(weakSelf.headImage.mas_right).mas_offset(10);
        make.bottom.mas_equalTo(weakSelf.timeLabel.mas_top).mas_offset(-4);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(_nameLabel.mas_left);
        make.bottom.mas_equalTo(weakSelf.headImage.mas_bottom).mas_offset(-2);
       
    }];
    [_focusBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.size.mas_equalTo(CGSizeMake(62, 31));
        make.centerY.mas_equalTo(weakSelf.headImage.mas_centerY);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(weakSelf.topImage.mas_top).mas_offset(-12);
        make.top.mas_equalTo(weakSelf.headImage.mas_bottom).mas_offset(12);
    }];
    [_topImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(195, 214));
        make.bottom.mas_equalTo(weakSelf.tipLabel.mas_top).mas_offset(-12);
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-10);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
    }];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(weakSelf.commentBtn.mas_left).mas_offset(-5);
        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(weakSelf.tipLabel.mas_centerY);
    }];
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(weakSelf.tipLabel.mas_centerY);
    }];
}

- (void)focusClicked:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (void)likeClcked:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (void)setModel:(CLDynamicModel *)model{
    [_headImage displayUser:[CLUser userWithName:model.createName userPhoto:model.createPhoto userId:model.createId] withTouchDetail:NO isCircle:YES];
    NSMutableAttributedString *userName = [[NSMutableAttributedString alloc] initWithString:model.createName];
    userName.yy_font = [UIFont systemFontOfSize:14];
    userName.yy_color = COLOR_NAME;
    _nameLabel.attributedText = userName;
    _timeLabel.text = model.createTime;
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:model.content];
    [content setYy_lineSpacing:6.0f];
    content.yy_font = [UIFont systemFontOfSize:14];
    _contentLabel.attributedText = content;
    
    _topImage.image = [UIImage imageNamed:model.imageUrls[0]];
    _tipLabel.text = @"热赞宠友";
    [_likeBtn setTitle:model.likesNum forState:UIControlStateNormal];
    [_commentBtn setTitle:model.commentNum forState:UIControlStateNormal];
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
