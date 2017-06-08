//
//  CLMinwDetailTableView.m
//  pet
//
//  Created by Apple on 2017/6/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMinwDetailTableView.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface CLMinwDetailTableView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation CLMinwDetailTableView

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
    self.tableFooterView = [UIView new];
}

#pragma mark - Table view data source

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(meTableDidScroll:)]) {
        [self.scrollDelegate meTableDidScroll:scrollView];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    FosterCareModel *model = self.dataArr[indexPath.row];
//    [cell configDoctorData:model];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
