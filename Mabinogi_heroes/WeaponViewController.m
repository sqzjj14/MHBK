//
//  WeaponViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/28.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "WeaponViewController.h"
#import "Header.h"


@interface WeaponViewController ()

@end

@implementation WeaponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initMultView];
}

#pragma mark 创建三级视图
-(void)initMultView
{
    MultLevelMeun *multView =[[MultLevelMeun alloc]initWithFrame:CGRectMake(0, 63, kScreenWidth, kScreenHeight) WithAllData:nil withSelecetIndex:^(NSInteger left, NSInteger right, id info) {
        
    }];
    
    [self.view addSubview:multView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
