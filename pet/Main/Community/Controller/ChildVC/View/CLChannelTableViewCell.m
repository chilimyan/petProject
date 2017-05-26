//
//  CLChannelTableViewCell.m
//  pet
//
//  Created by chilim on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLChannelTableViewCell.h"
#import "CLChannelImagesView.h"

@interface CLChannelTableViewCell ()

@property (nonatomic, strong) CLChannelImagesView *channelImagesView;

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
    [self.contentView addSubview:self.channelImagesView];
}

- (void)setupConstraints{
    [self.channelImagesView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(12);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-12);
    }];
}

- (void)setChannelModel:(CLChannelModel *)channelModel{
    self.channelImagesView.picPathStringsArray = channelModel.imageUrls;
}

- (CLChannelImagesView *)channelImagesView{
    if (!_channelImagesView) {
        _channelImagesView = [[CLChannelImagesView alloc] init];
    }
    return _channelImagesView;
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
