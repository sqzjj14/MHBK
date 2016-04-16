//
//  NewsDetailViewController.m
//  Mabinogi_heroes
//
//  Created by Kuntanury on 16/4/16.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webViewDetail;

@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
- (IBAction)reloadButtonAction:(id)sender;

@property (nonatomic, strong)UIView *progressLineView;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"详情";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:_requestUrl];
    [_webViewDetail loadRequest:request];
    [request setTimeoutInterval:15];
    
    UIView *lineImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, 0, 4)];
    _progressLineView = lineImageView;
    lineImageView.backgroundColor = COLOR_BATTLENET_LOADING;
    [self.navigationController.view addSubview:lineImageView];
    
    [UIView animateWithDuration:2 animations:^{
        lineImageView.width = WIDTH_SCREEN/2;
    }];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [UIView animateWithDuration:1 animations:^{
        _progressLineView.width = WIDTH_SCREEN;
    } completion:^(BOOL finished) {
        if (_progressLineView != nil) {
            [_progressLineView removeFromSuperview];
            _progressLineView = nil;
        }
    }];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_progressLineView != nil) {
        [_progressLineView removeFromSuperview];
        _progressLineView = nil;
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    _webViewDetail.hidden = YES;
}

- (IBAction)reloadButtonAction:(id)sender {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:_requestUrl];
    [_webViewDetail loadRequest:request];
    [request setTimeoutInterval:15];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
