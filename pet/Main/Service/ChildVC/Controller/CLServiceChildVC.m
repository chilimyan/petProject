//
//  CLServiceChildVC.m
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLServiceChildVC.h"
#import "CLServiceViewModel.h"
#import "CLServiceChildCell.h"

@interface CLServiceChildVC ()

@property (nonatomic, strong) CLServiceViewModel *viewModel;

@end

@implementation CLServiceChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[CLServiceViewModel alloc] init];
    [self loadData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadData];
    }];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 80, 0, 0);
    self.tableView.separatorColor = COLOR_SEPLINE_GRAY;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0,64 + 49, 0);
}

- (void)loadData{
    [_viewModel getServiceDataList:^{
        [self.tableView reloadData];
    }];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    });}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.serviceList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
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
    }
     FosterCareModel *model = _viewModel.serviceList[indexPath.row];
    cell.fosterCareModel = model;
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
