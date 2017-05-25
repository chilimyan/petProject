//
//  CLChildCommunityViewModel.h
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLChildCommunityViewModel : NSObject

@property (nonatomic, strong)NSMutableArray *scrollImages;
@property (nonatomic, strong)NSMutableArray *communityList;
@property (nonatomic, strong)NSMutableArray *selectList;
@property (nonatomic, strong)NSMutableArray *dynamicList;
@property (nonatomic, strong)NSMutableArray *channelList;
//精选轮播图
- (void)getSelectVCScrollImages:(void (^)())finished;
//精选数据
- (void)getSelectDataList:(void (^)())finished;
//动态数据
- (void)getDynamicDataList:(void (^)())finished;
//频道数据
- (void)getChannelDataList:(void (^)())finished;
- (NSMutableArray *)getChannelHeadList;

@end
