//
//  CLMailSearchVC.m
//  pet
//
//  Created by Apple on 2017/6/1.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMailSearchVC.h"

@interface CLMailSearchVC ()

@property (nonatomic, strong) NSMutableArray *searchKeyList;

@end

@implementation CLMailSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadKeyList:(NSString *)searchkey{
    [self.searchKeyList removeAllObjects];
    [self.searchKeyList addObject:searchkey];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchKeyList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"CLMinePersonCenterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = self.searchKeyList[indexPath.row];
    cell.textLabel.textColor = COLOR_BLACK_LIGHT;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (NSMutableArray *)searchKeyList{
    if (!_searchKeyList) {
        _searchKeyList = [[NSMutableArray alloc] init];
    }
    return _searchKeyList;
}


@end
