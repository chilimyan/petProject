//
//  CLMineOtherCell.m
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMineOtherCell.h"
#import "CLMenuItem.h"

@interface CLMineOtherCell ()<CLMenuItemDelegate>

@property (nonatomic, strong) NSMutableArray *itemArr;

@end

@implementation CLMineOtherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
   
    NSMutableArray *lineArr = [NSMutableArray array];
    for (int i = 0; i < 4; i ++) {
        CLMenuItem *signMenu = [[CLMenuItem alloc] initWithTitle:@"" withImage:nil];
        signMenu.delegate = self;
        [self.contentView addSubview:signMenu];
        [self.itemArr addObject:signMenu];
        if (i < 3) {
            UIView *leftLine = [[UIView alloc] init];
            leftLine.backgroundColor = COLOR_SEPLINE_GRAY;
            [self.contentView addSubview:leftLine];
            [lineArr addObject:leftLine];
        }
    }
    [self.itemArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [self.itemArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(0);
    }];
    CGFloat paddingLine = (kScreen.width - 3)/4;
    [lineArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:paddingLine leadSpacing:paddingLine tailSpacing:paddingLine];
    [lineArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-40);
    }];
}

- (void)setDataSource:(NSArray *)dataSource{
    for (int i = 0; i < dataSource.count; i ++) {
        if (i< self.itemArr.count) {
           CLMenuItem *signMenu = self.itemArr[i];
            signMenu.topImage = [UIImage imageNamed:dataSource[i]];
            signMenu.title = dataSource[i];
        }
    }
}

- (void)menuItemDidClicked:(CLMenuItem *)menuItem{
    
}

- (NSMutableArray *)itemArr{
    if (!_itemArr) {
        _itemArr = [NSMutableArray array];
    }
    return _itemArr;
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
