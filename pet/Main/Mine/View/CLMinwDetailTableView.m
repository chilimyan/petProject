//
//  CLMinwDetailTableView.m
//  pet
//
//  Created by Apple on 2017/6/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMinwDetailTableView.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "CLMinePetTableCell.h"
#import "CLMineAlbumTableCell.h"

@interface CLMinwDetailTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UIButton *mainBtn;
@property (nonatomic, strong)UIButton *albumBtn;

@end

static NSString *const petTableCellIdentify = @"petTableCellIdentify";
static NSString *const albumTableCellIdentify = @"albumTableCellIdentify";

@implementation CLMinwDetailTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self initView];
    }
    return self;
}

- (void)initView{
     [self registerClass:[CLMinePetTableCell class] forCellReuseIdentifier:petTableCellIdentify];
    [self registerClass:[CLMineAlbumTableCell class] forCellReuseIdentifier:albumTableCellIdentify];
    self.dataSource = self;
    self.delegate = self;
    self.backgroundColor = COLOR_BACK_GRAY;
    self.separatorColor = COLOR_SEPLINE_GRAY;
    self.tableFooterView = [UIView new];
}

- (void)mainCLicked:(UIButton *)sender{
    sender.selected = YES;
    self.albumBtn.selected = NO;
}

- (void)albumCLicked:(UIButton *)sender{
    sender.selected = YES;
    self.mainBtn.selected = NO;
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
    if (self.mainBtn.selected) {
        return 1;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 50;
    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen.width, 50)];
        sectionView.backgroundColor = COLOR_BACK_GRAY;
        
        UIView *itemBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kScreen.width, 40)];
        itemBackView.backgroundColor = [UIColor whiteColor];
        [sectionView addSubview:itemBackView];
        [itemBackView addSubview:self.mainBtn];
        [itemBackView addSubview:self.albumBtn];
        
        return sectionView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:petTableCellIdentify cacheByIndexPath:indexPath configuration:^(CLMinePetTableCell *cell) {
        }];
    }
    return 84;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CLMinePetTableCell *cell = [tableView dequeueReusableCellWithIdentifier:petTableCellIdentify forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        CLMineAlbumTableCell *cell = [tableView dequeueReusableCellWithIdentifier:albumTableCellIdentify forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0,kScreen.width);
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIButton *)mainBtn{
    if (!_mainBtn) {
        _mainBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, kScreen.width/2 - 15,40)];
        [_mainBtn setTitle:@"主页" forState:UIControlStateNormal];
        [_mainBtn setTitleColor:COLOR_TAB_SEL forState:UIControlStateSelected];
        [_mainBtn setTitleColor:COLOR_BLACK_LIGHT forState:UIControlStateNormal];
        _mainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _mainBtn.selected = YES;
        [_mainBtn addTarget:self action:@selector(mainCLicked:) forControlEvents:UIControlEventTouchUpInside];
        [_mainBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
    return _mainBtn;
}

- (UIButton *)albumBtn{
    if (!_albumBtn) {
        _albumBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen.width/2 + 15,0, kScreen.width/2 - 15,40)];
        [_albumBtn setTitle:@"相册" forState:UIControlStateNormal];
        [_albumBtn setTitleColor:COLOR_TAB_SEL forState:UIControlStateSelected];
        [_albumBtn setTitleColor:COLOR_BLACK_LIGHT forState:UIControlStateNormal];
        _albumBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_albumBtn addTarget:self action:@selector(albumCLicked:) forControlEvents:UIControlEventTouchUpInside];
        [_albumBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    return _albumBtn;
}


@end
