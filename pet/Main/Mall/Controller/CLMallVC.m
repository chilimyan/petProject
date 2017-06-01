//
//  CLMallVC.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMallVC.h"
#import "CLMailSearchVC.h"

@interface CLMallVC ()<UISearchResultsUpdating, UISearchControllerDelegate>

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation CLMallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    //固定搜索框
    self.definesPresentationContext = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"分类"] style:UIBarButtonItemStylePlain target:self action:@selector(typeClicked)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.navigationItem.titleView = self.searchController.searchBar;
}

- (void)typeClicked{
    
}

/**
 *  UISearchResultsUpdating Delegate
 **/
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchResultsController) {
        CLMailSearchVC *vc = (CLMailSearchVC*)searchController.searchResultsController;
    }
}


/**
 搜索条
 
 @return <#return value description#>
 */
- (UISearchController *)searchController{
    if (!_searchController) {
        CLMailSearchVC *vc = [[CLMailSearchVC alloc] init];
        _searchController = [[UISearchController alloc]initWithSearchResultsController:vc];
        _searchController.searchBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-12, 44);
        _searchController.searchBar.placeholder = @"多尼斯牵引器";
        _searchController.delegate = self;
        _searchController.searchBar.barStyle = UIBarStyleBlack;
        _searchController.searchResultsUpdater = self;
        [_searchController.searchBar setContentMode:UIViewContentModeLeft];
        [_searchController.searchBar setImage:[UIImage imageNamed:@"搜索"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchController.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"Rectangle 16"] forState:UIControlStateNormal];
        UITextField *searchField=[self.searchController.searchBar valueForKey:@"_searchField"];
        [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        _searchController.searchBar.backgroundColor = [UIColor clearColor];
    }
    return _searchController;
}



@end
