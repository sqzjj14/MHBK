//
//  EquipmentChartViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/5.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "EquipmentChartViewController.h"

#import "MultLevelMeun.h"
#import "DatabaseManager.h"
#import "VLDContextSheet.h"
#import "VLDContextSheetItem.h"

@interface EquipmentChartViewController ()<VLDContextSheetDelegate>

@property (nonatomic,strong) NSMutableArray *dataSource;
@property (strong, nonatomic) VLDContextSheet *contextSheet;
@property (copy,nonatomic) NSString *selectType;
@end

@implementation EquipmentChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createContextSheet];
    [self initTipView];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"装备";
    
    UIGestureRecognizer *gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget: self
        action: @selector(longPressed:)];
    [self.view addGestureRecognizer: gestureRecognizer];
}

#pragma mark 创建三级视图
-(void)initTipView
{
    
    MultLevelMeun *multView = [[MultLevelMeun alloc]initWithFrame:CGRectMake(0, 64, WIDTH_SCREEN, HEIGHT_SCREEN - 64) WithLeftData:_dataSource withType:@"" withSelecetIndex:^(NSInteger left, NSInteger right, id info) {
        
    }];
    [self.view addSubview:multView];
}
-(void)createContextSheet {
    VLDContextSheetItem *item1 =
    [[VLDContextSheetItem alloc] initWithTitle: @"武器"
    image: [UIImage imageNamed: @"gift_button"]
    highlightedImage: [UIImage imageNamed: @"gift_button2"]];
    
    
    VLDContextSheetItem *item2 =
    [[VLDContextSheetItem alloc] initWithTitle: @"防具"
    image: [UIImage imageNamed: @"add_to_collection_button"]
    highlightedImage: [UIImage imageNamed: @"add_to_collection_button2"]];
    
    VLDContextSheetItem *item3 =
    [[VLDContextSheetItem alloc] initWithTitle: @"首饰"
    image: [UIImage imageNamed: @"share_button"]
    highlightedImage: [UIImage imageNamed: @"share_button2"]];
    
    VLDContextSheetItem *item4 =
    [[VLDContextSheetItem alloc] initWithTitle: @"其他"
    image: [UIImage imageNamed: @"gift_button"]
                              highlightedImage: [UIImage imageNamed: @"gift_button2"]];
    
    VLDContextSheetItem *item5 =
    [[VLDContextSheetItem alloc] initWithTitle: @"90材料"
                                         image: [UIImage imageNamed: @"gift_button"]
                              highlightedImage: [UIImage imageNamed: @"gift_button2"]];
    
    
    self.contextSheet = [[VLDContextSheet alloc] initWithItems: @[item1, item2, item3, item4,item5 ]];
    self.contextSheet.delegate = self;
    
}
- (void) contextSheet: (VLDContextSheet *) contextSheet didSelectItem: (VLDContextSheetItem *) item {
    
    if ([item.title isEqualToString:@"武器"]) {
        _dataSource = [[DatabaseManager mabinogiHelper]CreatWeaponDataSource];
        self.title = @"武器(长按屏幕切换)";
        _selectType = @"Equipment";
    }
    else if ([item.title isEqualToString:@"防具"]){
        _dataSource = [[DatabaseManager mabinogiHelper]CreatArmorDataSource];
        self.title = @"防具(长按屏幕切换)";
        _selectType = @"Equipment";
    }
    else if ([item.title isEqualToString:@"首饰"]){
        _dataSource = [[DatabaseManager mabinogiHelper]CreatJewelryDataSource];
        self.title = @"首饰(长按屏幕切换)";
        _selectType = @"Equipment";
    }
    else if ([item.title isEqualToString:@"其他"]){
        _dataSource = [[DatabaseManager mabinogiHelper]CreatOtherDataSource];
        self.title = @"其他(长按屏幕切换)";
        _selectType = @"Equipment";
    }
    else if ([item.title isEqualToString:@"90材料"]){
        _dataSource = [[DatabaseManager mabinogiHelper]Creat90Stone];
        self.title = @"90材料(长按屏幕切换)";
        _selectType = @"90";
    }
    
    MultLevelMeun *multView = [[MultLevelMeun alloc]initWithFrame:CGRectMake(0, 64, WIDTH_SCREEN, HEIGHT_SCREEN - 64 - 49) WithLeftData:_dataSource withType:_selectType  withSelecetIndex:^(NSInteger left, NSInteger right, id info) {
        
    }];
    multView.needToScorllerIndex = 0;

    
    
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.view addSubview:multView];

}

- (void) longPressed: (UIGestureRecognizer *) gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        [self.contextSheet startWithGestureRecognizer: gestureRecognizer
                                               inView: self.view];
    }
}

- (void) willRotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
                                 duration: (NSTimeInterval) duration {
    
    [super willRotateToInterfaceOrientation: toInterfaceOrientation duration: duration];
    
    [self.contextSheet end];
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
