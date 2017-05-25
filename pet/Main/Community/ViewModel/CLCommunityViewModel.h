//
//  CLCommunityViewModel.h
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString *const SELECT_TITLE = @"精选";
static NSString *const DYNAMIC_TITLE = @"动态";
static NSString *const CHANNEL_TITLE = @"频道";

@interface CLCommunityViewModel : NSObject

@property (nonatomic, copy) NSString *vc_title;

@end
