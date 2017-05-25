//
//  CLSelectTableViewCell.m
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLSelectTableViewCell.h"
#import <YYText.h>

@interface CLCollectionImageCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView *headImage;

@end

@implementation CLCollectionImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUI];
    }
    
    return self;
}

- (void)setUI{
    self.headImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.headImage];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
}

@end

@interface CLSelectTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) YYLabel *contentLabel;
@property (nonatomic, strong) UICollectionView *likeView;
@property (nonatomic, strong) NSArray *likes;
@property (nonatomic, strong) UIView *tagView;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIButton *takeBtn;
@property (nonatomic, strong) UIButton *shareBtn;

@end

@implementation CLSelectTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews {
    _iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconView];
    
    _contentLabel = [[YYLabel alloc] init];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    _contentLabel.numberOfLines = 0;
    _contentLabel.preferredMaxLayoutWidth = kScreen.width - 20;
    [self.contentView addSubview:_contentLabel];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    CGFloat margin = 4;
    CGFloat width = 28;
    flowLayout.itemSize = CGSizeMake(width, width);
    flowLayout.minimumInteritemSpacing = margin;
    flowLayout.minimumLineSpacing = margin;
    _likeView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [_likeView registerClass:[CLCollectionImageCell class]forCellWithReuseIdentifier:@"FileCell"];
    //设置代理
    _likeView.backgroundColor = [UIColor whiteColor];
    _likeView.delegate = self;
    _likeView.dataSource = self;
    _likeView.scrollEnabled = NO;
    _likeView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    [self.contentView addSubview:_likeView];
    
    _tagView = [[UIView alloc] init];
    _tagView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_tagView];
    
    _likeBtn = [[UIButton alloc] init];
    _likeBtn.backgroundColor = COLOR_GRAY;
    _likeBtn.layer.cornerRadius = 3;
    _likeBtn.layer.masksToBounds = YES;
    _likeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_likeBtn setTitle:@"赞" forState:UIControlStateNormal];
    [_tagView addSubview:_likeBtn];
    
    _commentBtn = [[UIButton alloc] init];
    _commentBtn.backgroundColor = COLOR_GRAY;
    _commentBtn.layer.cornerRadius = 3;
    _commentBtn.layer.masksToBounds = YES;
     _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_commentBtn setTitle:@"评论" forState:UIControlStateNormal];
    [_tagView addSubview:_commentBtn];
    _takeBtn = [[UIButton alloc] init];
    _takeBtn.backgroundColor = COLOR_GRAY;
    _takeBtn.layer.cornerRadius = 3;
    _takeBtn.layer.masksToBounds = YES;
    _takeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_takeBtn setTitle:@"送礼" forState:UIControlStateNormal];
    [_tagView addSubview:_takeBtn];
    _shareBtn = [[UIButton alloc] init];
    _shareBtn.backgroundColor = COLOR_GRAY;
    _shareBtn.layer.cornerRadius = 3;
    _shareBtn.layer.masksToBounds = YES;
    _shareBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [_tagView addSubview:_shareBtn];
    
    
}

- (void)setupConstraints {
    WS(weakSelf);
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(0);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(0);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(0);
        make.bottom.mas_equalTo(weakSelf.contentLabel.mas_top).mas_offset(-10);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(weakSelf.likeView.mas_top).mas_equalTo(-10);
    }];
    [_likeView mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.mas_equalTo(kScreen.width);
        make.height.mas_equalTo(28);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_equalTo(0);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.tagView.mas_top).mas_offset(-6);
    }];
    [_tagView mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(kScreen.width);
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(0);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).mas_offset(0);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-10);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(48, 20));
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(10);
        make.topMargin.mas_equalTo(10);
    }];
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(48, 20));
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(68);
        make.topMargin.mas_equalTo(10);
    }];
    [_takeBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(48, 20));
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(126);
        make.topMargin.mas_equalTo(10);
    }];
    [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(48, 20));
        make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(184);
        make.topMargin.mas_equalTo(10);
    }];
}

- (void)setSelectModel:(CLSelectModel *)selectModel{
    _iconView.image = [UIImage imageNamed:selectModel.imageUrls[0]];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:selectModel.content];
    content.yy_font = [UIFont systemFontOfSize:14];
    content.yy_color = [UIColor blackColor];
    self.contentLabel.attributedText = content;
    _likes = selectModel.comments;
    [_likeView reloadData];
    [self updateConstraints11];
}

- (void)updateConstraints11{
    CGFloat imageHeight = _iconView.image.size.height/_iconView.image.size.width*kScreen.width;
    [_iconView mas_updateConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(imageHeight);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _likes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CLComment *attachment = indexPath.row < _likes.count ? _likes[indexPath.row] : nil;
    static NSString *identify = @"FileCell";
    CLCollectionImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell.headImage displayUser:[CLUser userWithName:attachment.createName userPhoto:attachment.createPhoto userId:attachment.createId] withTouchDetail:NO isCircle:YES];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
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
