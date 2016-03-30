//
//  NewsViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "NewsViewController.h"
#import "Header.h"
#import "DatabaseManager.h"

@interface NewsViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@property (nonatomic,strong)FMDatabase *database;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview.delegate = self;
    NSURL *newURL = [NSURL URLWithString:NEWS_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:newURL];
    [self.webview loadRequest:request];

    [[DatabaseManager mabinogiHelper]CreatWeaponDataSource];
    
}



-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return  YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
