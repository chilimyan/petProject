//
//  CLMallViewModel.m
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMallViewModel.h"

@implementation CLMallViewModel

- (void)getBannerListData:(void (^)())finished{
    self.bannerList = [NSMutableArray arrayWithArray:@[@"Banner03",@"Banner04"]];
    if (finished) {
        finished();
    }
}

@end
