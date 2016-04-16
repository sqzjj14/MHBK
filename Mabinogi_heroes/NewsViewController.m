//
//  NewsViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"

@interface NewsViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
- (IBAction)reloadButtonAction:(id)sender;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"资讯";
}

-(void)viewWillAppear:(BOOL)animated {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL_NEWS]];
    [_webview loadRequest:request];
    [request setTimeoutInterval:15];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        NewsDetailViewController *newsDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"NewsDetailVC"];
        newsDetailVC.requestUrl = request.URL;
        [self.navigationController pushViewController:newsDetailVC animated:YES];
        
        return NO;
    }
    
    return YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    _webview.hidden = YES;
}

- (IBAction)reloadButtonAction:(id)sender {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL_NEWS]];
    [_webview loadRequest:request];
    [request setTimeoutInterval:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
