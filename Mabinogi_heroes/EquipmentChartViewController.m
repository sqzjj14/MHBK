//
//  EquipmentChartViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/5.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "EquipmentChartViewController.h"
#import "Header.h"

@interface EquipmentChartViewController ()

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation EquipmentChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMultView];
   // self.tabBarController.hidesBottomBarWhenPushed = YES;
}

#pragma mark 创建三级视图
-(void)initMultView
{
    if ([_type isEqualToString:WEAPON]) {
        _dataSource = [[DatabaseManager mabinogiHelper]CreatWeaponDataSource];
    }
    else if ([_type isEqualToString:ARMOR]){
        _dataSource = [[DatabaseManager mabinogiHelper]CreatArmorDataSource];
    }
    else if ([_type isEqualToString:JEWELRY]){
        _dataSource = [[DatabaseManager mabinogiHelper]CreatJewelryDataSource];
    }
    else if ([_type isEqualToString:OTHER]){
        _dataSource = [[DatabaseManager mabinogiHelper]CreatOtherDataSource];
    }
    
    MultLevelMeun *multView = [[MultLevelMeun alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) WithLeftData:_dataSource withSelecetIndex:^(NSInteger left, NSInteger right, id info) {
        
    }];
    
    [self.view addSubview:multView];
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
