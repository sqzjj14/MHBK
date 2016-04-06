//
//  BOSSViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/6.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "BOSSViewController.h"
#import "Header.h"

@interface BOSSViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation BOSSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMulView];
    
}
- (void)initMulView{
    _dataSource = [[DatabaseManager mabinogiHelper]CreatBossDataSource];
    
    MultLevelMeun *meun = [[MultLevelMeun alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight) WithLeftData:_dataSource withSelecetIndex:^(NSInteger left, NSInteger right, id info) {
        
    }];
    
    [self.view addSubview:meun];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
