//
//  CLCommunityDetailTableView.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLCommunityDetailTableView.h"
#import "CLDetailTableCell.h"
#import "CLCommentTableCell.h"

static NSString *const detailTableCellIdentify = @"detailTableCellIdentify";
static NSString *const selectCommentCellIdentify = @"selectCommentCellIdentify";

@interface CLCommunityDetailTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CLCommunityDetailTableView

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
    [self registerClass:[CLDetailTableCell class] forCellReuseIdentifier:detailTableCellIdentify];
    [self registerClass:[CLCommentTableCell class] forCellReuseIdentifier:selectCommentCellIdentify];
}

- (void)setSelectModel:(CLSelectModel *)selectModel{
    _selectModel = selectModel;
    [self reloadData];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, 10)];
        sectionView.backgroundColor = COLOR_BACK_GRAY;
        return sectionView;
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return _selectModel.comments.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:detailTableCellIdentify cacheByIndexPath:indexPath configuration:^(CLDetailTableCell *cell) {
            [cell setSelectModel:_selectModel];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:selectCommentCellIdentify cacheByIndexPath:indexPath configuration:^(CLCommentTableCell *cell) {
            [cell setComment:_selectModel.comments[indexPath.row]];
        }];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CLDetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:detailTableCellIdentify forIndexPath:indexPath];
//        CLSelectModel *model = _viewModel.selectList[indexPath.section];
//        [cell setSelectModel:model];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        CLCommentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:selectCommentCellIdentify forIndexPath:indexPath];
//        CLSelectModel *model = _viewModel.selectList[indexPath.section];
//        [cell setComment:model.comments[indexPath.row - 1]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
