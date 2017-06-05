//
//  CLDoctorVC.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLDoctorVC.h"
#import "CLDoctorTableView.h"
#import "CLDoctorHeadView.h"
#import "CLServiceViewModel.h"

@interface CLDoctorVC ()

@property (nonatomic, strong) CLDoctorTableView *tableView;
@property (nonatomic, strong) CLServiceViewModel *viewModel;
@property (nonatomic, strong) CLDoctorHeadView *headView;

@end

@implementation CLDoctorVC

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
    [_viewModel getDoctorDataList:^{
        _headView.doctorList = _viewModel.doctorList;
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    UIButton *location = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, kScreen.width - 60,40)];
    location.titleLabel.font = [UIFont systemFontOfSize:16];
    [location setTitle:@"越秀区水荫南路" forState:UIControlStateNormal];
    [location setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [location setImage:[UIImage imageNamed:@"定位"] forState:UIControlStateNormal];
    [location setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [location setTitleEdgeInsets:UIEdgeInsetsMake(0, 4, 0, 0)];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:location];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"晴天"] style:UIBarButtonItemStylePlain target:self action:@selector(scanClicked)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    [self.view addSubview:self.tableView];
    _headView = [[CLDoctorHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, 360)];
    [self.tableView setTableHeaderView:_headView];
}

- (void)scanClicked{
    
}

- (void)loadData{
    [_viewModel getServiceDataList:^{
        self.tableView.dataArr = _viewModel.serviceList;
        [self.tableView reloadData];
    }];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    });
}

- (CLDoctorTableView *)tableView{
    if (!_tableView) {
        _tableView = [[CLDoctorTableView alloc] initWithFrame:CGRectMake(0,0,kScreen.width,kScreen.height) style:UITableViewStyleGrouped];
    }
    return _tableView;
}

@end
