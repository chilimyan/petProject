//
//  CLServiceViewModel.m
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLServiceViewModel.h"

@implementation CLServiceViewModel

- (void)getServiceDataList:(void (^)())finished{
    self.serviceList = [self getServiceDataList];
    if (finished) {
        finished();
    }
}

- (void)getDoctorDataList:(void (^)())finished{
    self.doctorList = [self getdoctorDataList];
    if (finished) {
        finished();
    }
}

- (NSMutableArray *)getdoctorDataList{
    NSMutableArray *tempArr = [NSMutableArray array];
    CLDoctor *doctor = [[CLDoctor alloc] init];
    doctor.imageUrl = @"医生01";
    doctor.userName = @"朱天鹏";
    doctor.postName = @"主治医生";
    CLDoctor *doctor1 = [[CLDoctor alloc] init];
    doctor1.imageUrl = @"医生02";
    doctor1.userName = @"吴晓";
    doctor1.postName = @"主治医生";
    CLDoctor *doctor2 = [[CLDoctor alloc] init];
    doctor2.imageUrl = @"医生03";
    doctor2.userName = @"Andy";
    doctor2.postName = @"主治医生";
    CLDoctor *doctor3 = [[CLDoctor alloc] init];
    doctor3.imageUrl = @"医生04";
    doctor3.userName = @"刘慧";
    doctor3.postName = @"主治医生";
    
    [tempArr addObject:doctor];
    [tempArr addObject:doctor1];
    [tempArr addObject:doctor2];
    [tempArr addObject:doctor3];
    
    return tempArr;
}

- (NSMutableArray *)getServiceDataList{
    NSMutableArray *tempArr = [NSMutableArray array];
    FosterCareModel *model = [[FosterCareModel alloc] init];
    model.title = @"雅琪养护乐园";
    model.distance = @"700m";
    model.money = @"95";
    model.scoreCount = @"5";
    model.score = @"5.0";
    model.address = @"广州市天河区天河东路165号";
    model.imageUrl = @"图片0";
    
    FosterCareModel *model1 = [[FosterCareModel alloc] init];
    model1.title = @"莫奈动物驿站";
    model1.distance = @"1.5km";
    model1.money = @"100";
    model1.scoreCount = @"4";
    model1.score = @"4.9";
    model1.address = @"东莞庄路126-7";
    model1.imageUrl = @"图片1";
    
    FosterCareModel *model2 = [[FosterCareModel alloc] init];
    model2.title = @"天天宠物乐园";
    model2.distance = @"1.8km";
    model2.money = @"90";
    model2.scoreCount = @"4";
    model2.score = @"4.8";
    model2.address = @"东兴南路3号";
    model2.imageUrl = @"图片2";
    
    FosterCareModel *model3 = [[FosterCareModel alloc] init];
    model3.title = @"金宝贝爱宠园";
    model3.distance = @"2.6km";
    model3.money = @"80";
    model3.scoreCount = @"4";
    model3.score = @"4.9";
    model3.address = @"龙口东路356号";
    model3.imageUrl = @"图片3";
    
    FosterCareModel *model4 = [[FosterCareModel alloc] init];
    model4.title = @"爱萌宠墅";
    model4.distance = @"3.1km";
    model4.money = @"85";
    model4.scoreCount = @"5";
    model4.score = @"5.0";
    model4.address = @"越秀区先烈中路";
    model4.imageUrl = @"图片4";
    
    FosterCareModel *model5 = [[FosterCareModel alloc] init];
    model5.title = @"瑞鹏养护乐园";
    model5.distance = @"3.5km";
    model5.money = @"90";
    model5.scoreCount = @"4";
    model5.score = @"4.7";
    model5.address = @"广州市越秀区水萌南路62号102";
    model5.imageUrl = @"图片5";
    
    FosterCareModel *model6 = [[FosterCareModel alloc] init];
    model6.title = @"艾喵天地";
    model6.distance = @"5.5km";
    model6.money = @"100";
    model6.scoreCount = @"5";
    model6.score = @"5.0";
    model6.address = @"广州市天河区体育西路61号";
    model6.imageUrl = @"图片6";
    
    [tempArr addObject:model];
    [tempArr addObject:model1];
    [tempArr addObject:model2];
    [tempArr addObject:model3];
    [tempArr addObject:model4];
    [tempArr addObject:model5];
    [tempArr addObject:model6];
    return tempArr;
}

- (NSMutableArray *)serviceList{
    if (!_serviceList) {
        _serviceList = [NSMutableArray array];
    }
    return _serviceList;
}

@end
