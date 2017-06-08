//
//  CLCommunityDetailVC.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLCommunityDetailVC.h"
#import "CLCommunityDetailTableView.h"
#import "MTInputToolbar.h"
#import <IQKeyboardManager.h>

@interface CLCommunityDetailVC ()<MTInputToolbarDelegate>

@property (nonatomic, strong) CLCommunityDetailTableView *tableView;

@end

@implementation CLCommunityDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self loadData];
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
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    MTInputToolbar *inputToolbar = [[MTInputToolbar alloc] initWithFrame:CGRectMake(0,kScreen.height - 50 , kScreen.width, 50)];
    inputToolbar.delegate = self;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i<12; i ++ ) {
        NSDictionary *dict = @{@"image":@"img_defaulthead_nor",
                               @"label":[NSString stringWithFormat:@"%d",i],
                               };
        [arr addObject:dict];
    }
    inputToolbar.typeDatas = [arr copy];
    inputToolbar.textPlaceHold = @"添加评论";
    //文本输入框最大行数
    inputToolbar.textViewMaxLine = 4;
    [self.view addSubview:inputToolbar];
    NSMutableSet *set = [NSMutableSet setWithCapacity:1];
    [set addObject:[CLCommunityDetailVC class]];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    
    UIBarButtonItem *moreBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"更多"] style:UIBarButtonItemStylePlain target:self action:@selector(moreClicked)];
    self.navigationItem.rightBarButtonItem = moreBtn;
}

- (void)moreClicked{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"分享" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma MTInputToolbarDelegate

- (void)inputToolbar:(MTInputToolbar *)inputToolbar sendContent:(NSAttributedString *)sendContent
{
    NSLog(@"%@",sendContent);
}

- (void)inputToolbar:(MTInputToolbar *)inputToolbar sendRecordData:(NSData *)Data
{
    NSLog(@"%@",Data);
}

- (void)inputToolbar:(MTInputToolbar *)inputToolbar indexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    
}


- (CLCommunityDetailTableView *)tableView{
    if (!_tableView) {
        _tableView = [[CLCommunityDetailTableView alloc] initWithFrame:CGRectMake(0,0,kScreen.width,kScreen.height) style:UITableViewStyleGrouped];
    }
    return _tableView;
}


@end
