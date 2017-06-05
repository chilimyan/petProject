//
//  CLBaiduOCRVC.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLBaiduOCRVC.h"
#import "AipOcrService.h"
#import "AipCaptureCardVC.h"

@interface CLBaiduOCRVC ()<AipOcrDelegate>

@property (nonatomic, strong)NSMutableArray *actionList;

@end

@implementation CLBaiduOCRVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    #error 授权
    ////     授权方法1：请在 http://ai.baidu.com中 新建App, 绑定BundleId后，在此处填写App的Api Key/Secret Key
    //    [[AipOcrService shardService] authWithAK:@"TiEizyvLgnG4alemV9QX6QKv" andSK:@"A5tzR2LwblVlkmlH8uU1Lazo8anmkwg3"];
    
    
    // 授权方法2： 下载授权文件，添加至资源
    NSString *licenseFile = [[NSBundle mainBundle] pathForResource:@"aip" ofType:@"license"];
    NSData *licenseFileData = [NSData dataWithContentsOfFile:licenseFile];
    if(!licenseFileData) {
        [[[UIAlertView alloc] initWithTitle:@"授权失败" message:@"授权文件不存在" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
    }
    [[AipOcrService shardService] authWithLicenseFileData:licenseFileData];
    
    // 授权方法3： 自行搭建服务器，分配token
    //    [[AipOcrService shardService] authWithToken:@"Token here"];

    [self configureData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)configureData {
    self.title = @"百度OCRDemo";
    self.actionList = [NSMutableArray array];
    
    [self.actionList addObject:@[@"身份证正面拍照识别", @"idcardOCROnline"]];
    [self.actionList addObject:@[@"身份证反面拍照识别", @"idcardOCROnlineScan"]];
     [self.actionList addObject:@[@"银行卡正面拍照识别", @"bankCardOCROnline"]];
    [self.actionList addObject:@[@"通用识别", @"bankCardOCROnlineScan"]];}

#pragma mark - Action

- (void)idcardOCROnline {
    
    UIViewController * vc = [AipCaptureCardVC ViewControllerWithCardType:CardTypeIdCardFont andDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)bankCardOCROnline{
    
    UIViewController * vc = [AipCaptureCardVC ViewControllerWithCardType:CardTypeBankCard andDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)idcardOCROnlineScan{
    
    UIViewController * vc = [AipCaptureCardVC ViewControllerWithCardType:CardTypeIdCardBack andDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)bankCardOCROnlineScan{
    
//    UIViewController * vc = [AipGeneralVC ViewControllerWithDelegate:self];
//    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.actionList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"CLMinePersonCenterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.actionList[indexPath.row][0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    SEL funSel = NSSelectorFromString(self.actionList[indexPath.row][1]);
//    if (funSel) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//        [self performSelector:funSel];
//#pragma clang diagnostic pop
//    }
    switch (indexPath.row) {
        case 0:
            [self idcardOCROnline];
            break;
        case 1:
            [self idcardOCROnlineScan];
            break;
        case 2:
            [self bankCardOCROnline];
            break;
        case 3:
            [self bankCardOCROnlineScan];
            break;
            
        default:
            break;
    }
}

@end
