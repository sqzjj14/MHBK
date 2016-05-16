//
//  BOSSViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/6.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "BOSSViewController.h"

#import "DatabaseManager.h"
#import "MultLevelMeun.h"

@interface BOSSViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation BOSSViewController

- (void)viewDidLoad {
    self.title = @"副本";
    [super viewDidLoad];
    [self initMulView];
    
}
- (void)initMulView{
    _dataSource = [[DatabaseManager mabinogiHelper]CreatBossDataSource];
    
    MultLevelMeun *meun = [[MultLevelMeun alloc]initWithFrame:CGRectMake(0, 64, WIDTH_SCREEN, HEIGHT_SCREEN - 40) WithLeftData:_dataSource withType:@"Boss" withSelecetIndex:^(NSInteger left, NSInteger right, id info) {
        
    }];
    meun.needToScorllerIndex = 0;
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self.view addSubview:meun];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
