//
//  CLSelectHeadView.m
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLSelectHeadView.h"

@interface CLSelectHeadView ()

@property (nonatomic, strong)NSArray *scrollImages;

@end

@implementation CLSelectHeadView

- (instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)imagesArray{
    if (self = [super initWithFrame:frame]) {
        self.scrollImages = imagesArray;
        [self addScrollView];
    }
    return self;
}

- (void)setSd_scrollViewDelegate:(id<SDCycleScrollViewDelegate>)sd_scrollViewDelegate{
    _sd_scrollViewDelegate = sd_scrollViewDelegate;
}

- (void)addScrollView{
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds shouldInfiniteLoop:YES imageNamesGroup:self.scrollImages];
    cycleScrollView.delegate = self.sd_scrollViewDelegate;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScrollView.pageDotColor = [UIColor colorWithRed:255./255. green:255./255. blue:255./255. alpha:0.3];
    [self addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
