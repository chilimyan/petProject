//
//  CLChannelHeadView.m
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLChannelHeadView.h"


@interface CLCollectionChannelCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView *headImage;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *detailLabel;

@end

@implementation CLCollectionChannelCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        self.backgroundColor = [UIColor grayColor];
        [self setUI];
    }
    
    return self;
}

- (void)setUI{
    self.headImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.headImage];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"";
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLabel];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.textAlignment = NSTextAlignmentLeft;
    self.detailLabel.textColor = COLOR_GRAY;
    self.detailLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.detailLabel];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(0);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(0);
        
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.headImage.mas_top).mas_offset(10);
        make.bottom.mas_equalTo(self.detailLabel.mas_top).mas_offset(-10);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_right).mas_offset(10);
        make.bottom.mas_equalTo(self.headImage.mas_bottom).mas_offset(-10);
    }];
    
}

@end


@interface CLChannelHeadView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)NSArray *scrollImages;
@property (nonatomic, strong)UIView *channelBackView;
@property (nonatomic, strong)UILabel *channelLabel;
@property (nonatomic, strong)UIView *tipBackView;
@property (nonatomic, strong)UILabel *tipLabel;
@property (nonatomic, strong) UICollectionView *channelView;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation CLChannelHeadView

- (instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)imagesArray{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.scrollImages = imagesArray;
        [self addScrollView];
        [self addSubview:self.channelBackView];
        [self.channelBackView addSubview:self.channelLabel];
        [self.channelBackView addSubview:self.channelView];
        [self addSubview:self.tipBackView];
        [self.tipBackView addSubview:self.tipLabel];
//        [self addLineView];
        [self setupConstrains];
    }
    return self;
}

- (void)setSd_scrollViewDelegate:(id<SDCycleScrollViewDelegate>)sd_scrollViewDelegate{
    _cycleScrollView.delegate = sd_scrollViewDelegate;
}

- (void)addScrollView{
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen.width, 150) shouldInfiniteLoop:YES imageNamesGroup:self.scrollImages];
    _cycleScrollView.delegate = _sd_scrollViewDelegate;
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _cycleScrollView.pageDotColor = [UIColor colorWithRed:255./255. green:255./255. blue:255./255. alpha:0.3];
    [self addSubview:_cycleScrollView];
    _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

//- (void)addLineView{
//    UIView *lineViewtop = [[UIView alloc] init];
//    lineViewtop.backgroundColor = COLOR_BACK_GRAY;
//
//    UIView *lineViewDown = [[UIView alloc] init];
//    lineViewDown.backgroundColor = COLOR_BACK_GRAY;
//
//    [self addSubview:lineViewtop];
//    [self addSubview:lineViewDown];
//    
//    [lineViewtop mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.mas_equalTo(self.mas_left).mas_offset(0);
//        make.right.mas_equalTo(self.mas_right).mas_offset(0);
//        make.top.mas_equalTo(self.mas_top).mas_offset(150);
//        make.height.mas_equalTo(10);
//    }];
//    [lineViewDown mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.mas_equalTo(self.mas_left).mas_offset(0);
//        make.right.mas_equalTo(self.mas_right).mas_offset(0);
//        make.height.mas_equalTo(10);
//        make.bottom.mas_equalTo(self.tipBackView.mas_top).mas_offset(0);
//    }];
//}

- (void)setupConstrains{
    UIView *lineViewtop = [[UIView alloc] init];
    lineViewtop.backgroundColor = COLOR_BACK_GRAY;
    
    UIView *lineViewDown = [[UIView alloc] init];
    lineViewDown.backgroundColor = COLOR_BACK_GRAY;

    [self addSubview:lineViewDown];
    [self addSubview:lineViewtop];
    WS(weakSelf);
    [lineViewtop mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(0);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(150);
        make.height.mas_equalTo(10);
    }];
    [lineViewDown mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.channelBackView.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(0);
        make.height.mas_equalTo(10);
    }];

    [self.channelBackView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(lineViewtop.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(0);
        make.height.mas_equalTo(90);
    }];
    [self.channelLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.channelBackView.mas_top).mas_offset(5);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(20);
    }];
    [self.channelView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.channelLabel.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(60);
    }];
    
    [self.tipBackView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(lineViewDown.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(0);
    }];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 10, 0, 0));
    }];
}

- (void)setChannelList:(NSMutableArray *)channelList{
    _channelList = channelList;
    [self.channelView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _channelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify = @"ChannelCell";
    CLCollectionChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    CLChannelList *list = _channelList[indexPath.row];
    cell.headImage.image = [UIImage imageNamed:list.headImage];
    cell.titleLabel.text = list.title;
    cell.detailLabel.text = list.content;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}


- (UIView *)channelBackView{
    if (!_channelBackView) {
        _channelBackView = [[UIView alloc] init];
        _channelBackView.backgroundColor = [UIColor whiteColor];
    }
    return _channelBackView;
}

- (UIView *)tipBackView{
    if (!_tipBackView) {
        _tipBackView = [[UIView alloc] init];
        _tipBackView.backgroundColor = [UIColor whiteColor];
    }
    return _tipBackView;
}
- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.text = @"热帖推荐";
        _tipLabel.font = [UIFont systemFontOfSize:12];
        _tipLabel.textColor = COLOR_GRAY;
        _tipLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _tipLabel;
}
- (UILabel *)channelLabel{
    if (!_channelLabel) {
        _channelLabel = [[UILabel alloc] init];
        _channelLabel.text = @"频道";
        _channelLabel.font = [UIFont systemFontOfSize:12];
        _channelLabel.textColor = COLOR_GRAY;
        _channelLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _channelLabel;
}

- (UICollectionView *)channelView{
    if (!_channelView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        CGFloat margin = 4;
        flowLayout.itemSize = CGSizeMake(150, 60);
        flowLayout.minimumInteritemSpacing = margin;
        flowLayout.minimumLineSpacing = margin;
        _channelView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_channelView registerClass:[CLCollectionChannelCell class]forCellWithReuseIdentifier:@"ChannelCell"];
        //设置代理
        _channelView.backgroundColor = [UIColor whiteColor];
        _channelView.delegate = self;
        _channelView.dataSource = self;
        _channelView.scrollEnabled = YES;
        _channelView.showsHorizontalScrollIndicator = NO;
        _channelView.contentInset = UIEdgeInsetsMake(0, 10, 0, 0);
        [self addSubview:_channelView];
    }
    return _channelView;
}

@end
