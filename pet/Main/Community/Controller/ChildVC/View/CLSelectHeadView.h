//
//  CLSelectHeadView.h
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>


@interface CLSelectHeadView : UIView<SDCycleScrollViewDelegate>

@property (nonatomic, weak) id <SDCycleScrollViewDelegate> sd_scrollViewDelegate;

- (instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)imagesArray;

@end
