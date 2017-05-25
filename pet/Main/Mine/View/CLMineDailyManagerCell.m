//
//  CLMineDailyManagerCell.m
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMineDailyManagerCell.h"
#import "CLMenuItem.h"

@interface CLMineDailyManagerCell ()<CLMenuItemDelegate>


@end

@implementation CLMineDailyManagerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    NSArray *array = @[@"签到",@"遛宠",@"消息"];
    NSMutableArray *upArrItem = [NSMutableArray array];
    for (int i = 0; i < array.count; i ++) {
        CLMenuItem *signMenu = [[CLMenuItem alloc] initWithTitle:array[i] withImage:[UIImage imageNamed:array[i]]];
        signMenu.delegate = self;
        [self.contentView addSubview:signMenu];
        [upArrItem addObject:signMenu];
    }
    NSArray *downArr = @[@[@"宠钻",@"3"],@[@"宠币",@"4"],@[@"优惠券",@"8"],@[@"礼物",@"2"]];
    NSMutableArray *downArrItem = [NSMutableArray array];
    for (int i = 0; i < downArr.count; i ++) {
        CLMenuItem *signMenu = [[CLMenuItem alloc] initWithTitle:downArr[i][0] withContent:downArr[i][1]];
        signMenu.delegate = self;
        [self.contentView addSubview:signMenu];
        [downArrItem addObject:signMenu];
    }
    UIView *leftLine = [[UIView alloc] init];
    leftLine.backgroundColor = COLOR_SEPLINE_GRAY;
    [self.contentView addSubview:leftLine];
    
    UIView *rightLine = [[UIView alloc] init];
    rightLine.backgroundColor = COLOR_SEPLINE_GRAY;
    [self.contentView addSubview:rightLine];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOR_SEPLINE_GRAY;
    [self.contentView addSubview:lineView];
    
    CGFloat paddingLine = (kScreen.width - 2)/3;
    [@[leftLine, rightLine] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:paddingLine leadSpacing:paddingLine tailSpacing:paddingLine];
    [@[leftLine, rightLine] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.mas_equalTo(lineView.mas_top).mas_offset(-40);
    }];
    
    [upArrItem mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [upArrItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.mas_equalTo(lineView.mas_top).mas_offset(0);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(0);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(79);
    }];
    [downArrItem mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [downArrItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_top).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
    
}

- (void)menuItemDidClicked:(CLMenuItem *)menuItem{
    
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
