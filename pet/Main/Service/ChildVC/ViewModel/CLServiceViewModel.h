//
//  CLServiceViewModel.h
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLServiceModel.h"

@interface CLServiceViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *serviceList;
@property (nonatomic, strong) NSMutableArray *doctorList;

//医生列表
- (void)getDoctorDataList:(void (^)())finished;
//服务数据
- (void)getServiceDataList:(void (^)())finished;

@end
