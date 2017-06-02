//
//  CLMallTopItemView.m
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMallTopItemView.h"
#import "CLMenuItem.h"
#import "NSArray+Sudoku.h"

@interface CLMallTopItemView ()<CLMenuItemDelegate>

@property (nonatomic, strong) UIView *backView;

@end

@implementation CLMallTopItemView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.backView];
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    WS(weakSelf);
    NSArray *topArr = @[@[@"主粮",@"主粮"],@[@"玩具",@"玩具"],@[@"日用品",@"日用品"],@[@"保健",@"保健"],@[@"医疗",@"医疗"],@[@"零食",@"零食"],@[@"兑换专区",@"兑换专区"],@[@"领券中心",@"领券中心"]];
    NSMutableArray *topArrItem = [NSMutableArray array];
    for (int i = 0; i < topArr.count; i ++) {
        CLMenuItem *signMenu = [[CLMenuItem alloc] initWithTitle:topArr[i][0] withImage:[UIImage imageNamed:topArr[i][1]]];
        signMenu.delegate = self;
        [self addSubview:signMenu];
        [topArrItem addObject:signMenu];
    }
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(weakSelf);
    }];
    [topArrItem mas_distributeSudokuViewsWithFixedLineSpacing:0 fixedInteritemSpacing:0 warpCount:4 topSpacing:0 bottomSpacing:0 leadSpacing:0 tailSpacing:0];
}

- (void)menuItemDidClicked:(CLMenuItem *)menuItem{
    
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

@end
