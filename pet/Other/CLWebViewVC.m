//
//  CLWebViewVC.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLWebViewVC.h"
#import "CLProgressLayer.h"

@interface CLWebViewVC ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) CLProgressLayer *progressLayer;

@end

@implementation CLWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:_urlString];
    
    NSURLRequest *resquest = [[NSURLRequest alloc]initWithURL:url];
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [_webView loadRequest:resquest];
    _webView.scrollView.scrollEnabled = NO;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    _progressLayer = [[CLProgressLayer alloc] init];
    _progressLayer.progressStyle = CLProgressStyleNoraml;
    _progressLayer.frame = CGRectMake(0, 40, kScreen.width, 2);
    [self.navigationController.navigationBar.layer addSublayer:_progressLayer];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadView
{
    [super loadView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma
#pragma mark WebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_progressLayer progressAnimationStart];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [_progressLayer progressAnimationCompletion];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_progressLayer progressAnimationCompletion];
}


@end
