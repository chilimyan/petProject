//
//  CLMineVC.m
//  pet
//
//  Created by Apple on 2017/5/23.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMineVC.h"
#import "CLMineOtherCell.h"
#import "CLMineShopingCell.h"
#import "CLMineDailyManagerCell.h"
#import "CLMinePersonCenterCell.h"
#import "CLMineSectionView.h"

@interface CLMineVC ()

@end

@implementation CLMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"二维码"] style:UIBarButtonItemStylePlain target:self action:@selector(scanClicked)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"添加好友"] style:UIBarButtonItemStylePlain target:self action:@selector(scanClicked)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.separatorColor = COLOR_SEPLINE_GRAY;
}

#pragma mark -action Methods

- (void)scanClicked{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01f;
    }
    return 59;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 84;
        }else{
            return 79*2;
        }
    }else{
        return 79;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    CLMineSectionView *backView = [[CLMineSectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, 59) section:section];
    return backView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *cellIndentifier = @"CLMinePersonCenterCell";
            CLMinePersonCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (!cell) {
                cell = [[CLMinePersonCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            }
            cell.separatorInset = UIEdgeInsetsMake(0, kScreen.width, 0, 0);
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }else{
            static NSString *cellIndentifier = @"CLMineDailyManagerCell";
            CLMineDailyManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (!cell) {
                cell = [[CLMineDailyManagerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            }
            return cell;
        }
    }else{
        static NSString *cellIndentifier = @"CLMineOtherCell";
        CLMineOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (!cell) {
            cell = [[CLMineOtherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        if (indexPath.section == 1) {
            cell.dataSource = @[@"宠物",@"好友",@"社区",@"收藏"];
        }else if (indexPath.section == 2){
            cell.dataSource = @[@"购物车",@"购物订单",@"我的售后",@"收货地址"];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
