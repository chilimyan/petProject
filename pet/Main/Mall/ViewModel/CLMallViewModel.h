//
//  CLMallViewModel.h
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLMallViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *bannerList;

- (void)getBannerListData:(void (^)())finished;

@end
