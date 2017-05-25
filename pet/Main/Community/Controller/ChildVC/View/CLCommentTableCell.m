//
//  CLCommentTableCell.m
//  pet
//
//  Created by chilim on 2017/5/21.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLCommentTableCell.h"
#import <YYText.h>

@interface CLCommentTableCell ()

@property (nonatomic, strong) YYLabel *commentLabel;

@end

@implementation CLCommentTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews{
    _commentLabel = [[YYLabel alloc] init];
    _commentLabel.font = [UIFont systemFontOfSize:14];
    _commentLabel.numberOfLines = 0;
    [self.contentView addSubview:_commentLabel];
}

- (void)setupConstraints{
    WS(weakSelf);
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(0);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-6);
    }];
}

- (void)setComment:(CLComment *)comment{
    NSMutableAttributedString *commentStr = [NSMutableAttributedString new];
    NSMutableAttributedString *userName = [[NSMutableAttributedString alloc] initWithString:comment.createName];
    userName.yy_font = [UIFont systemFontOfSize:14];
    userName.yy_color = COLOR_NAME;
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:comment.content];
    content.yy_font = [UIFont systemFontOfSize:14];
    content.yy_color = [UIColor blackColor];
    [commentStr appendAttributedString:userName];
    [commentStr appendAttributedString:[self padding]];
    [commentStr appendAttributedString:content];
    _commentLabel.attributedText = commentStr;
}

- (NSAttributedString *)padding {
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"："];
    return pad;
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
