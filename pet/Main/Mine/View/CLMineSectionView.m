//
//  CLMineSectionView.m
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMineSectionView.h"

@interface CLMineSectionView ()

@property (nonatomic, assign) NSInteger section;

@end

@implementation CLMineSectionView

- (instancetype)initWithFrame:(CGRect)frame section:(NSInteger)section{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = COLOR_BACK_GRAY;
        self.section = section;
        UIView *whiteBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kScreen.width, 49)];
        whiteBackView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteBackView];
        
        UIImageView *flagImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen.width - 10 - 14,49/2 - 14/2,14, 14)];
        flagImage.image = [UIImage imageNamed:@"cell_right_icon"];
        [whiteBackView addSubview:flagImage];
        UILabel *flagLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreen.width - 5 - 10- 14-50,0,50, 49)];
        flagLabel.text = @"更多";
        flagLabel.textColor = COLOR_GRAY;
        flagLabel.font = [UIFont systemFontOfSize:14];
        flagLabel.textAlignment = NSTextAlignmentRight;
        [whiteBackView addSubview:flagLabel];
        
        UIButton *titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0,kScreen.width - 10, 49)];
        [titleBtn setTitleColor:COLOR_LIGHT_BLACK forState:UIControlStateNormal];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleBtn addTarget:self action:@selector(moreClicked) forControlEvents:UIControlEventTouchUpInside];
        [titleBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [whiteBackView addSubview:titleBtn];
        if (section == 1) {
            flagLabel.hidden = YES;
            flagImage.hidden = YES;
            [titleBtn setTitle:@"日常管理" forState:UIControlStateNormal];
        }else if (section == 2){
            flagLabel.hidden = NO;
            flagImage.hidden = NO;
            [titleBtn setTitle:@"商城购物" forState:UIControlStateNormal];
        }else{
            flagLabel.hidden = YES;
            flagImage.hidden = YES;
            [titleBtn setTitle:@"其他" forState:UIControlStateNormal];
        }
    }
    return self;
}

- (void)moreClicked{
    if (self.section == 2) {
        NSLog(@"更多商场购物");
    }
}

@end
