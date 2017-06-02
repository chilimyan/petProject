//
//  CLLoginVC.m
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLLoginVC.h"
#import "CLLoginFootView.h"
#import "CLLoginTableCell.h"

@interface CLLoginVC ()

@property (nonatomic, strong)CLLoginFootView *loginFootView;

@end

@implementation CLLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self initView];
    [self actionMethods];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    self.tableView.backgroundColor = COLOR_BACK_GRAY;
    self.tableView.separatorColor = COLOR_SEPLINE_GRAY;
    //masonry布局headview
    CGFloat height = [self.loginFootView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = self.loginFootView.frame;
    frame.size.height = height;
    self.loginFootView.frame =frame;
    [self.tableView setTableFooterView:self.loginFootView];
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count <= 1) {
        UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(backClicked)];
        self.navigationItem.leftBarButtonItem = backBtn;
    }
}
- (void)actionMethods{
    WS(weakSelf);
    self.loginFootView.loginBlock = ^{
        if (weakSelf.loginBlock) {
            weakSelf.loginBlock();
        }
        [weakSelf backClicked];
    };
}
//返回按钮
- (void)backClicked{
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count>1) {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *cellIndentifier = @"contrunyCell";
        CLConturyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (!cell) {
            cell = [[CLConturyTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if (indexPath.row == 1){
        static NSString *cellIndentifier = @"phoneCell";
        CLUserNameTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (!cell) {
            cell = [[CLUserNameTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
    }else{
        static NSString *cellIndentifier = @"passwordCell";
        CLPasswordTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (!cell) {
            cell = [[CLPasswordTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CLLoginFootView *)loginFootView{
    if (!_loginFootView) {
        _loginFootView = [[CLLoginFootView alloc] init];
    }
    return _loginFootView;
}

@end
