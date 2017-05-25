//
//  CLServiceVC.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLServiceVC.h"
#import "CAPSPageMenu.h"
#import "CLServiceChildVC.h"

@interface CLServiceVC ()<CAPSPageMenuDelegate>

@property (nonatomic) CAPSPageMenu *pagemenu;
@property (nonatomic, strong) NSMutableArray *controllerArray;


@end

@implementation CLServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宠物服务";
    [self initView];
    [self.view addSubview:self.pagemenu.view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"定位"] style:UIBarButtonItemStylePlain target:self action:@selector(scanClicked)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"搜索"] style:UIBarButtonItemStylePlain target:self action:@selector(scanClicked)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)scanClicked{
    
}

- (NSMutableArray *)getControllers{
    [self.controllerArray removeAllObjects];
    NSArray *titleArr = @[@"寄养",@"幼宠",@"洗护",@"造型",@"训练",@"用品"];
    //一定要设置title
    for (int i= 0; i < titleArr.count; i ++) {
        CLServiceChildVC *vc = [[CLServiceChildVC alloc]initWithStyle:UITableViewStyleGrouped];
        vc.title = titleArr[i];
        [self.controllerArray addObject:vc];
    }
    return self.controllerArray;
}


- (NSDictionary *)getProperty{
    return @{
             CAPSPageMenuOptionViewBackgroundColor: [UIColor whiteColor],
             CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor whiteColor],
             CAPSPageMenuOptionUnselectedMenuItemLabelColor: [UIColor colorWithCSS:@"#515151"],
             CAPSPageMenuOptionSelectionIndicatorColor: [UIColor colorWithCSS:@"#4b25d8"],
             CAPSPageMenuOptionSelectedMenuItemLabelColor: [UIColor colorWithCSS:@"#4b25d8"],
             CAPSPageMenuOptionMenuItemFont: [UIFont systemFontOfSize:14.0],
             CAPSPageMenuOptionMenuHeight: @(40.0),
             CAPSPageMenuOptionSelectionIndicatorHeight: @(2.0),
             CAPSPageMenuOptionAddBottomMenuHairline: @(YES),
             CAPSPageMenuOptionUseMenuLikeSegmentedControl: @(YES)
           };

}

- (CAPSPageMenu *)pagemenu{
    if (!_pagemenu) {
        _pagemenu = [[CAPSPageMenu alloc] initWithViewControllers:[self getControllers] frame:CGRectMake(0.0, 64, kScreen.width, kScreen.height) options:[self getProperty]];
        _pagemenu.view.backgroundColor = COLOR_BACK_GRAY;
        _pagemenu.delegate = self;
        
    }
    return _pagemenu;
}

- (NSMutableArray *)controllerArray{
    if (!_controllerArray) {
        _controllerArray = [[NSMutableArray alloc]init];
    }
    
    return _controllerArray;
}



@end
