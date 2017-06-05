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
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

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
    _cycleScrollView.delegate = sd_scrollViewDelegate;
}

- (void)addScrollView{
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds shouldInfiniteLoop:YES imageNamesGroup:self.scrollImages];
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _cycleScrollView.pageDotColor = [UIColor colorWithRed:255./255. green:255./255. blue:255./255. alpha:0.3];
    [self addSubview:_cycleScrollView];
    _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
