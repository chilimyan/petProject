//
//  CLDoctorTableView.m
//  pet
//
//  Created by Apple on 2017/6/1.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLDoctorTableView.h"
#import "CLServiceChildCell.h"

@interface CLDoctorTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CLDoctorTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.dataSource = self;
    self.delegate = self;
    self.backgroundColor = COLOR_BACK_GRAY;
    self.separatorColor = COLOR_SEPLINE_GRAY;
    self.separatorInset = UIEdgeInsetsMake(0, 80, 0, 0);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"CLMinePersonCenterCell";
    CLServiceChildCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[CLServiceChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    FosterCareModel *model = self.dataArr[indexPath.row];
    [cell configDoctorData:model];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
