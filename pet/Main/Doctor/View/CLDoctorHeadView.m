//
//  CLDoctorHeadView.m
//  pet
//
//  Created by Apple on 2017/6/1.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLDoctorHeadView.h"
#import "CLMenuItem.h"
#import "CLServiceModel.h"

@interface CLCollectionDoctorCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *postLabel;

@end

@implementation CLCollectionDoctorCell

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
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"";
    self.nameLabel.textColor = COLOR_BLACK_LIGHT;
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLabel];
    
    self.postLabel = [[UILabel alloc] init];
    self.postLabel.textAlignment = NSTextAlignmentCenter;
    self.postLabel.textColor = COLOR_GRAY;
    self.postLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.postLabel];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 74));
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(0);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(0);
        
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.headImage.mas_right).mas_offset(0);
        make.top.mas_equalTo(self.headImage.mas_bottom).mas_offset(4);
        make.bottom.mas_equalTo(self.postLabel.mas_top).mas_offset(-4);
    }];
    [self.postLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.headImage.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.headImage.mas_right).mas_offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
}

@end

@interface CLDoctorHeadView ()<CLMenuItemDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *doctorListView;

@end

static NSString *const doctorCellIdentify = @"doctorCellIdentify";

@implementation CLDoctorHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    UIView *topBackView = [[UIView alloc] init];
    topBackView.backgroundColor = [UIColor whiteColor];
    [self addSubview:topBackView];
    
    UIButton *searchBtn = [[UIButton alloc] init];
    [searchBtn setImage:[UIImage imageNamed:@"搜索框"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchClicked) forControlEvents:UIControlEventTouchUpInside];
    [topBackView addSubview:searchBtn];
    
    NSArray *searchTitle = @[@"细小",@"感冒",@"拉稀",@"咳嗽",@"脱毛",@"痢疾"];
    NSMutableArray *btnArray = [NSMutableArray array];
    for (int i = 0; i < searchTitle.count; i ++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:searchTitle[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor colorWithCSS:@"#515151"] forState:UIControlStateNormal];
        [topBackView addSubview:button];
        [btnArray addObject:button];
    }
    
    [topBackView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.mas_top).mas_offset(0);
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(72);
    }];
    
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.topMargin.mas_equalTo(10);
        make.centerX.mas_equalTo(topBackView.mas_centerX);
        make.width.mas_equalTo(306);
        make.height.mas_equalTo(30);
    }];
    
    [btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:40 leadSpacing:60 tailSpacing:60];
    [btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(searchBtn.mas_bottom).offset(10);
        make.bottom.mas_equalTo(topBackView.mas_bottom).mas_offset(-10);
    }];
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOR_BACK_GRAY;
    [self addSubview:lineView];
    
    UIView *middleLine = [[UIView alloc] init];
    middleLine.backgroundColor = COLOR_BACK_GRAY;
    [self addSubview:middleLine];
    
    UIView *middleBackView = [[UIView alloc] init];
    middleBackView.backgroundColor = [UIColor whiteColor];
    [self addSubview:middleBackView];
    
    NSArray *downArr = @[@[@"快速咨询",@"快速咨询"],@[@"症状自查",@"症状自检"],@[@"养护手册",@"养护手册"],@[@"宠物学院",@"宠物学院"]];
    NSMutableArray *middleArrItem = [NSMutableArray array];
    for (int i = 0; i < downArr.count; i ++) {
        CLMenuItem *signMenu = [[CLMenuItem alloc] initWithTitle:downArr[i][0] withImage:[UIImage imageNamed:downArr[i][1]]];
        signMenu.delegate = self;
        [middleBackView addSubview:signMenu];
        [middleArrItem addObject:signMenu];
    }
    [lineView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(topBackView.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(10);
    }];
    [middleBackView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(80);
    }];
    [middleArrItem mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [middleArrItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleBackView.mas_top).offset(0);
        make.bottom.mas_equalTo(middleBackView.mas_bottom).mas_offset(0);
    }];
    
    [middleLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(middleBackView.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(10);
    }];
    
    UIView *downBackView = [[UIView alloc] init];
    downBackView.backgroundColor = [UIColor whiteColor];
    [self addSubview:downBackView];
    
    UIView *downLine = [[UIView alloc] init];
    downLine.backgroundColor = COLOR_BACK_GRAY;
    [downBackView addSubview:downLine];
    
    UILabel *doctorTipLabel = [[UILabel alloc] init];
    doctorTipLabel.font = [UIFont systemFontOfSize:14];
    doctorTipLabel.text = @"明星医生";
    doctorTipLabel.textColor = [UIColor colorWithCSS:@"#7b7afe"];
    doctorTipLabel.textAlignment = NSTextAlignmentLeft;
    [downBackView addSubview:doctorTipLabel];
    
    UILabel *hosTipLabel = [[UILabel alloc] init];
    hosTipLabel.font = [UIFont systemFontOfSize:14];
    hosTipLabel.text = @"附近医院";
    hosTipLabel.textColor = [UIColor colorWithCSS:@"#7b7afe"];
    hosTipLabel.textAlignment = NSTextAlignmentLeft;
    [downBackView addSubview:hosTipLabel];

    [downBackView addSubview:self.doctorListView];
    [downBackView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(middleLine.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(188);
    }];
    
    [doctorTipLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.leftMargin.mas_equalTo(10);
        make.top.mas_equalTo(downBackView.mas_top).mas_offset(8);
        make.height.mas_equalTo(14);
    }];
    [self.doctorListView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(downBackView.mas_left).mas_offset(0);
        make.right.mas_equalTo(downBackView.mas_right).mas_offset(0);
        make.top.mas_equalTo(doctorTipLabel.mas_bottom).mas_offset(8);
        make.height.mas_equalTo(118);
    }];
    [downLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.doctorListView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(10);
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(0);
    }];
    [hosTipLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(downLine.mas_bottom).mas_offset(8);
        make.leftMargin.mas_equalTo(10);
        make.bottom.mas_equalTo(downBackView.mas_bottom).mas_offset(-8);
    }];
}

- (UICollectionView *)doctorListView{
    if (!_doctorListView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        CGFloat margin = 25;
        flowLayout.itemSize = CGSizeMake(70, 118);
        flowLayout.minimumInteritemSpacing = margin;
        flowLayout.minimumLineSpacing = margin;
        _doctorListView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_doctorListView registerClass:[CLCollectionDoctorCell class]forCellWithReuseIdentifier:doctorCellIdentify];
        //设置代理
        _doctorListView.backgroundColor = [UIColor whiteColor];
        _doctorListView.delegate = self;
        _doctorListView.dataSource = self;
        _doctorListView.scrollEnabled = YES;
        _doctorListView.showsHorizontalScrollIndicator = NO;
        _doctorListView.contentInset = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return _doctorListView;
}

- (void)setDoctorList:(NSMutableArray *)doctorList{
    _doctorList = doctorList;
    [self.doctorListView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _doctorList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CLCollectionDoctorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:doctorCellIdentify forIndexPath:indexPath];
    CLDoctor *doctor = _doctorList[indexPath.row];
    cell.headImage.image = [UIImage imageNamed:doctor.imageUrl];
    cell.nameLabel.text = doctor.userName;
    cell.postLabel.text = doctor.postName;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}



- (void)searchClicked{
    
}

- (void)menuItemDidClicked:(CLMenuItem *)menuItem{
    
}

@end
