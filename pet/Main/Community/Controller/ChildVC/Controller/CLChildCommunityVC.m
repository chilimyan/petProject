//
//  CLChildCommunityVC.m
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLChildCommunityVC.h"
#import "CLCommunityViewModel.h"
#import "CLSelectHeadView.h"
#import "CLChildCommunityViewModel.h"
#import "CLSelectSectionView.h"
#import "CLSelectTableViewCell.h"
#import "CLCommentTableCell.h"
#import "CLDynamicTableViewCell.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "CLDynamicHeadView.h"
#import "CLChannelHeadView.h"

static NSString *const selectTableCellIdentify = @"selectTableCellIdentify";
static NSString *const dynamicTableCellIdentify = @"dynamicTableCellIdentify";
static NSString *const selectLikesCellIdentify = @"selectLikesCellIdentify";
static NSString *const selectBtnCellIdentify = @"selectBtnCellIdentify";
static NSString *const selectCommentCellIdentify = @"selectCommentCellIdentify";
static CGFloat const selectSectionHeight = 10;

@interface CLChildCommunityVC ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong)CLChildCommunityViewModel *viewModel;

@end

@implementation CLChildCommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[CLChildCommunityViewModel alloc] init];
    [self initView];
    [self setHeadView];
    [self loadData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    if ([self.title isEqualToString:SELECT_TITLE]) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tableFooterView = [UIView new];
        self.tableView.contentInset =UIEdgeInsetsMake(0,0,-selectSectionHeight,0);
        [self.tableView registerClass:[CLSelectTableViewCell class] forCellReuseIdentifier:selectTableCellIdentify];
        [self.tableView registerClass:[CLCommentTableCell class] forCellReuseIdentifier:selectCommentCellIdentify];
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
         self.tableView.tableFooterView = [UIView new];
        self.tableView.separatorColor = COLOR_SEPLINE_GRAY;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self.tableView registerClass:[CLDynamicTableViewCell class] forCellReuseIdentifier:dynamicTableCellIdentify];
    }else{
         self.tableView.tableFooterView = [UIView new];
        self.tableView.separatorColor = COLOR_SEPLINE_GRAY;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

- (void)setHeadView{
    if ([self.title isEqualToString:SELECT_TITLE]) {
        [_viewModel getSelectVCScrollImages:^{
            CLSelectHeadView *headView = [[CLSelectHeadView alloc]initWithFrame:CGRectMake(0, 0,kScreen.width, 135) withImages:_viewModel.scrollImages];
            headView.sd_scrollViewDelegate = self;
            [self.tableView setTableHeaderView:headView];
        }];
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        CLDynamicHeadView *headView = [[CLDynamicHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, 30)];
        [self.tableView setTableHeaderView:headView];
    }else{
        [_viewModel getSelectVCScrollImages:^{
            CLChannelHeadView *headView = [[CLChannelHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, 270) withImages:_viewModel.scrollImages];
            headView.sd_scrollViewDelegate = self;
            headView.channelList = [_viewModel getChannelHeadList];
            [self.tableView setTableHeaderView:headView];
        }];
    }
}

- (void)loadData{
    if ([self.title isEqualToString:SELECT_TITLE]) {
        [_viewModel getSelectDataList:^{
            [self.tableView reloadData];
        }];
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer resetNoMoreData];
        });
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        [_viewModel getDynamicDataList:^{
            [self.tableView reloadData];
        }];
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer resetNoMoreData];
        });
    }else{
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer resetNoMoreData];
        });
    }
}

#pragma mark -scrollViewDelegate
//禁止footView悬停
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
     CGRect rect = [self.tableView convertRect:rectInTableView toView:self.tableView.superview];
    if (rect.origin.y > -self.tableView.contentSize.height) {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -selectSectionHeight + 49, 0);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.title isEqualToString:SELECT_TITLE]) {
        return _viewModel.selectList.count;
        
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
         return 1;
    }else{
         return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.title isEqualToString:SELECT_TITLE]) {
        CLSelectModel *model = _viewModel.selectList[section];
        return 1 + model.comments.count;
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        return _viewModel.dynamicList.count;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.title isEqualToString:SELECT_TITLE]) {
        if (indexPath.row == 0) {
            CLSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectTableCellIdentify forIndexPath:indexPath];
            CLSelectModel *model = _viewModel.selectList[indexPath.section];
            [cell setSelectModel:model];
            return cell;
        }else{
            CLCommentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:selectCommentCellIdentify forIndexPath:indexPath];
            CLSelectModel *model = _viewModel.selectList[indexPath.section];
            [cell setComment:model.comments[indexPath.row - 1]];
            return cell;
        }
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        CLDynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dynamicTableCellIdentify forIndexPath:indexPath];
        CLDynamicModel *model = _viewModel.dynamicList[indexPath.row];
        cell.model = model;
        return cell;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([self.title isEqualToString:SELECT_TITLE]) {
        return 60;
        
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        return 0.01f;
    }else{
        return 0.01f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if ([self.title isEqualToString:SELECT_TITLE]) {
        return selectSectionHeight;
        
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        return 0.01f;
    }else{
        return 0.01f;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if ([self.title isEqualToString:SELECT_TITLE]) {
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, selectSectionHeight)];
        footView.backgroundColor = COLOR_BACK_GRAY;
        return footView;
        
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        return nil;
    }else{
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.title isEqualToString:SELECT_TITLE]) {
        CLSelectModel *model = _viewModel.selectList[section];
        CLSelectSectionView *selectSection = [[CLSelectSectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, 60) withSelectModel:model];
        return selectSection;
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        return nil;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.title isEqualToString:SELECT_TITLE]) {
        if (indexPath.row == 0) {
            return [tableView fd_heightForCellWithIdentifier:selectTableCellIdentify cacheByIndexPath:indexPath configuration:^(CLSelectTableViewCell *cell) {
                CLSelectModel *model = _viewModel.selectList[indexPath.section];
                [cell setSelectModel:model];
            }];
        }else{
            return [tableView fd_heightForCellWithIdentifier:selectCommentCellIdentify cacheByIndexPath:indexPath configuration:^(CLCommentTableCell *cell) {
                CLSelectModel *model = _viewModel.selectList[indexPath.section];
                [cell setComment:model.comments[indexPath.row - 1]];
            }];
        }
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        return [tableView fd_heightForCellWithIdentifier:dynamicTableCellIdentify cacheByIndexPath:indexPath configuration:^(CLDynamicTableViewCell *cell) {
            CLDynamicModel *model = _viewModel.dynamicList[indexPath.row];
            cell.model = model;
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:selectCommentCellIdentify cacheByIndexPath:indexPath configuration:^(CLCommentTableCell *cell) {
            CLSelectModel *model = _viewModel.selectList[indexPath.section];
            [cell setComment:model.comments[indexPath.row - 1]];
        }];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.title isEqualToString:SELECT_TITLE]) {
        
        
    }else if ([self.title isEqualToString:DYNAMIC_TITLE]){
        
    }else{
        
    }
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

@end
