//
//  CLMallVC.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLMallVC.h"
#import "CLMailSearchVC.h"
#import <SDCycleScrollView.h>
#import "CLMallViewModel.h"
#import "CLMallTopItemView.h"
#import "CLMallHotView.h"

@interface CLMallVC ()<UISearchResultsUpdating, UISearchControllerDelegate,SDCycleScrollViewDelegate,CLMallTopItemDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) CLMallViewModel *viewModel;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) CLMallTopItemView *topItemView;
@property (nonatomic, strong) CLMallHotView *mallHotView;
@property (nonatomic, strong) UIButton *shoppingBtn;

@end

@implementation CLMallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[CLMallViewModel alloc] init];
    [self initView];
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    WS(weakSelf);
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"分类"] style:UIBarButtonItemStylePlain target:self action:@selector(typeClicked)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.navigationItem.titleView = self.searchController.searchBar;
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.topItemView];
    [self.scrollView addSubview:self.mallHotView];
    [self.view addSubview:self.shoppingBtn];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(weakSelf.view);
    }];
    [self.topItemView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.scrollView).mas_offset(140);
        make.width.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(148);
    }];
    [self.mallHotView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(weakSelf.topItemView.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(400);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.mas_equalTo(self.mallHotView.mas_bottom).mas_offset(0);
    }];
    
}

- (void)loadData{
    [_viewModel getBannerListData:^{
         [self.scrollView addSubview:self.cycleScrollView];
    }];
}

- (void)typeClicked{
    
}

- (void)shoppingClicked{
    
}

/**
 TopItemDelegate

 @param index <#index description#>
 */
- (void)mallTopItemDidSelect:(NSInteger)index{
    
}
/**
 *  UISearchResultsUpdating Delegate
 **/
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchResultsController) {
        CLMailSearchVC *vc = (CLMailSearchVC*)searchController.searchResultsController;
        [vc reloadKeyList:searchController.searchBar.text];
    }
}

-(void)willDismissSearchController:(UISearchController *)searchController {
    self.tabBarController.tabBar.hidden = NO;
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    self.tabBarController.tabBar.hidden = YES;
}


- (SDCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen.width, 140) shouldInfiniteLoop:YES imageNamesGroup:_viewModel.bannerList];
        _cycleScrollView.delegate = self;
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _cycleScrollView.pageDotColor = [UIColor colorWithRed:255./255. green:255./255. blue:255./255. alpha:0.3];
        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _cycleScrollView;
}

- (CLMallTopItemView *)topItemView{
    if (!_topItemView) {
        _topItemView = [[CLMallTopItemView alloc] init];
        _topItemView.delegate = self;
    }
    return _topItemView;
}

- (CLMallHotView *)mallHotView{
    if (!_mallHotView) {
        _mallHotView = [[CLMallHotView alloc] init];
    }
    return _mallHotView;
}

/**
 搜索条
 
 @return <#return value description#>
 */
- (UISearchController *)searchController{
    if (!_searchController) {
        CLMailSearchVC *vc = [[CLMailSearchVC alloc] initWithStyle:UITableViewStyleGrouped];
        _searchController = [[UISearchController alloc]initWithSearchResultsController:vc];
        _searchController.searchBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-12, 44);
        _searchController.searchBar.placeholder = @"多尼斯牵引器";
        _searchController.delegate = self;
        _searchController.searchResultsUpdater = self;
        [_searchController.searchBar setImage:[UIImage imageNamed:@"搜索"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchController.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"Rectangle 16"] forState:UIControlStateNormal];
        UITextField *searchField=[self.searchController.searchBar valueForKey:@"_searchField"];
        [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        searchField.textColor = [UIColor whiteColor];
        _searchController.searchBar.backgroundColor = [UIColor clearColor];
        //固定搜索框
        self.definesPresentationContext = YES;
        _searchController.hidesNavigationBarDuringPresentation = NO;
    }
    return _searchController;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = COLOR_BACK_GRAY;
    }
    return _scrollView;
}

- (UIButton *)shoppingBtn{
    if (!_shoppingBtn) {
        _shoppingBtn = [[UIButton alloc] init];
        [_shoppingBtn addTarget:self action:@selector(shoppingClicked) forControlEvents:UIControlEventTouchUpInside];
        [_shoppingBtn setImage:[UIImage imageNamed:@"Group"] forState:UIControlStateNormal];
    }
    return _shoppingBtn;
}

@end
