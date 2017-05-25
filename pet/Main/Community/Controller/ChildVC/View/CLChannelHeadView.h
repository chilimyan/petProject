//
//  CLChannelHeadView.h
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>
#import "CLCommunityModel.h"

@interface CLChannelHeadView : UIView<SDCycleScrollViewDelegate>

@property (nonatomic, weak) id <SDCycleScrollViewDelegate> sd_scrollViewDelegate;
@property (nonatomic, strong) NSMutableArray *channelList;

- (instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)imagesArray;

@end
