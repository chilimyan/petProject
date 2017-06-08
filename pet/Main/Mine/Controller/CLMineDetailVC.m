//
//  CLMineDetailVC.m
//  pet
//
//  Created by Apple on 2017/6/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMineDetailVC.h"
#import "CLMinwDetailTableView.h"
#import "CLHeadInfoView.h"
#define HeadImageH kScreen.width/kScreen.height*210

@interface CLMineDetailVC ()<CLMeTableDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) CLMinwDetailTableView *tableView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *detailBtn;
@property (nonatomic, strong) CLHeadInfoView *headInfoView;

@end

@implementation CLMineDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self initView];
    [self actions];
    
    // Do any additional setup after loading the view.
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    [self.view addSubview:self.tableView];
    [self settingHeaderView];
    [self settingHeaderBackgroundView];
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.detailBtn];
}

#pragma mark - 设置backgroundView
//设置背景
-(void)settingHeaderBackgroundView{
    UIView *backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, kScreen.height)];
    backGroundView.backgroundColor = COLOR_BACK_GRAY;
    [backGroundView addSubview:self.headImageView];
    
    self.tableView.backgroundView = backGroundView;
}
//设置headView
-(void)settingHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, HeadImageH + 24)];
    headerView.backgroundColor = [UIColor clearColor];
    
    [headerView addSubview:self.headInfoView];
    [self.headInfoView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(UIEdgeInsetsMake(-60, 0, 0, 0));
    }];
    self.tableView.tableHeaderView = headerView;
    self.tableView.contentInset = UIEdgeInsetsMake(84, 0, 0, 0);
//    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0,HeadImageH,kScreen.width,74)];
//    backView.backgroundColor = [UIColor whiteColor];
//    [headerView addSubview:backView];
    
//    [headerView addSubview:self.headInfoView];
//    self.headInfoView.user = [ShareObject shared].loginUser;
//    WS(weakSelf);
//    self.headInfoView.userHeadImage.userDetail = ^{
//        MeInfoVC *vc = [[MeInfoVC alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [weakSelf.navigationController pushViewController:vc animated:YES];
//    };
}

- (void)actions{
    
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - headImage特效方法
-(void)meTableDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y + 20;
    CGRect tempF = self.headImageView.frame;
    // 如果offsetY大于0，说明是向上滚动，缩小
    if (offsetY > 0) {
        tempF.origin.y = -offsetY;
        self.headImageView.frame = tempF;
    }else{
        // 如果offsetY小于0，让headImageView的Y值等于0，headImageView的高度要放大
        tempF.size.height = HeadImageH - offsetY;
        tempF.origin.y = 0;
        self.headImageView.frame = tempF;
    }
}

- (CLMinwDetailTableView *)tableView{
    if (!_tableView) {
        _tableView = [[CLMinwDetailTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.scrollDelegate = self;
    }
    return _tableView;
}

- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, HeadImageH)];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.image = [UIImage imageNamed:@"我的背景"];
    }
    return _headImageView;
}

- (CLHeadInfoView *)headInfoView{
    if (!_headInfoView) {
        _headInfoView = [[CLHeadInfoView alloc] init];
        _headInfoView.backgroundColor = [UIColor clearColor];
    }
    return _headInfoView;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 50, 60)];
        [_backBtn setImage:[UIImage imageNamed:@"nav_back_icon"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UIButton *)detailBtn{
    if (!_detailBtn) {
        _detailBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen.width - 50, 10, 50, 60)];
        [_detailBtn setTitle:@"资料" forState:UIControlStateNormal];
        [_detailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _detailBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_detailBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailBtn;
}
@end
