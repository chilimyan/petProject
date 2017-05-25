//
//  CLMenuItem.m
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMenuItem.h"

@interface CLMenuItem ()

@property (nonatomic, strong)UIImageView *topImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *topBtn;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, assign)BOOL isImageAndTitle;

@end

@implementation CLMenuItem

- (instancetype)initWithTitle:(NSString *)title withImage:(UIImage *)image{
    if (self = [super init]) {
        _title = title;
        _topImage = image;
        self.isImageAndTitle = YES;
        [self addSubview:self.topImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.topBtn];
        [self setupConstrains];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title withContent:(NSString *)content{
    if (self = [super init]) {
        _title = title;
        _content = content;
        self.isImageAndTitle = NO;
        [self addSubview:self.contentLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.topBtn];
        [self setupConstrains];
    }
    return self;
}


- (void)setupConstrains{
    if (self.isImageAndTitle) {
        [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self.mas_top).mas_offset(16);
            make.size.mas_equalTo(_topImage.size);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self.topImageView.mas_bottom).mas_offset(8);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-12);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }else{
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self.mas_top).mas_offset(18);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(10);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }
    [self.topBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)setTopImage:(UIImage *)topImage{
    self.topImageView.image = topImage;
    [self.topImageView mas_updateConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(topImage.size);
    }];
}

- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)setContent:(NSString *)content{
    self.contentLabel.text = content;
}

- (UIImageView *)topImageView{
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
        _topImageView.image = _topImage;
    }
    return _topImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithCSS:@"#707070"];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = _title;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor colorWithCSS:@"#707070"];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.text = _content;
    }
    return _contentLabel;
}

- (UIButton *)topBtn{
    if (!_topBtn) {
        _topBtn = [[UIButton alloc] init];
        [_topBtn addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topBtn;
}

- (void)itemClicked:(UIButton *)sender{
    if (self.delegate) {
        [self.delegate menuItemDidClicked:self];
    }
}


@end
