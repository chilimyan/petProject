//
//  CLCommunityDetailVC.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLCommunityDetailVC.h"
#import "CLCommunityDetailTableView.h"

@interface CLCommunityDetailVC ()

@property (nonatomic, strong) CLCommunityDetailTableView *tableView;

@end

@implementation CLCommunityDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadData];
    }];

    // Do any additional setup after loading the view.
}
- (void)loadView
{
    [super loadView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData{
    if (self.selectModel) {
        self.tableView.selectModel = self.selectModel;
        [self.tableView reloadData];
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        });
    }
}

- (void)initView{
    self.title = @"动态详情";
    [self.view addSubview:self.tableView];
}

- (CLCommunityDetailTableView *)tableView{
    if (!_tableView) {
        _tableView = [[CLCommunityDetailTableView alloc] initWithFrame:CGRectMake(0,0,kScreen.width,kScreen.height) style:UITableViewStyleGrouped];
    }
    return _tableView;
}


@end
