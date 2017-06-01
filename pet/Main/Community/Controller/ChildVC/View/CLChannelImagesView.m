//
//  CLChannelImagesView.m
//  pet
//
//  Created by Apple on 2017/5/26.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLChannelImagesView.h"
#import "NSArray+Sudoku.h"

@interface CLChannelImagesView ()

@property (nonatomic, strong) NSArray *imageViewsArray;
@property (nonatomic, strong) UIImageView *imageOne;

@end

@implementation CLChannelImagesView

- (instancetype)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    
    self.imageOne = [[UIImageView alloc] init];
    self.imageOne.userInteractionEnabled = YES;
    [self addSubview:self.imageOne];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    [self.imageOne addGestureRecognizer:tap];
    [self.imageOne mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.mas_top).mas_offset(0);
        make.width.mas_equalTo(230);
        make.left.mas_equalTo(self.mas_left).mas_offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(0);
    }];
    
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [imageView addGestureRecognizer:tap];
        [temp addObject:imageView];
    }
    self.imageViewsArray = [temp copy];
    [self.imageViewsArray mas_distributeSudokuViewsWithFixedItemWidth:(kScreen.width - 20 - 20)/3 fixedItemHeight:(kScreen.width - 20 - 20)/3 warpCount:3 topSpacing:0 bottomSpacing:0 leadSpacing:0 tailSpacing:0];
}

- (void)setPicPathStringsArray:(NSArray *)picPathStringsArray{
    _picPathStringsArray = picPathStringsArray;
    if (_picPathStringsArray.count == 1) {
        for (UIImageView *image in self.subviews) {
            image.hidden = YES;
        }
        self.imageOne.hidden = NO;
        self.imageOne.image = [UIImage imageNamed:_picPathStringsArray[0]];
    }else{
        for (UIImageView *image in self.subviews) {
            image.hidden = NO;
        }
        self.imageOne.hidden = YES;
        for (long i = _picPathStringsArray.count; i < self.imageViewsArray.count; i ++) {
            UIImageView *imageView = self.imageViewsArray[i];
            imageView.hidden = YES;
        }
        for (int i = 0; i < _picPathStringsArray.count; i ++) {
            UIImageView *imageView = self.imageViewsArray[i];
            imageView.image = [UIImage imageNamed:_picPathStringsArray[i]];
            if (i == _picPathStringsArray.count - 1) {
                [imageView mas_updateConstraints:^(MASConstraintMaker *make){
                    make.bottom.mas_equalTo(self.mas_bottom).mas_offset(0);
                }];
            }
        }
    }
}

- (void)tapImageView:(UITapGestureRecognizer *)tap{
    
}

@end
