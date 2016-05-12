//
//  Title3ViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/21.
//  Copyright © 2016年 baiyue. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

#import "Title3ViewController.h"
#import "TitleModel.h"
#import "BTSimpleSideMenu.h"

@interface Title3ViewController ()<BTSimpleSideMenuDelegate>
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *allData;
@property(nonatomic)BTSimpleSideMenu *sideMenu;
@end

@implementation Title3ViewController
@synthesize sideMenu;

- (void)viewDidLoad {
    self.rippleImageName = @"background.png";
    [super viewDidLoad];
    self.navigationItem.title = @"头衔";
    self.navigationController.navigationBarHidden = YES;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _allData = [[DatabaseManager mabinogiHelper]CreatAllRoleDataSource];//总数据源
    _dataSource = [[NSMutableArray alloc]init];//collection数据源
    [self initMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
#pragma mark - Menu
- (void)initMenu{
        sideMenu.delegate = self;
    BTSimpleMenuItem *item1 = [[BTSimpleMenuItem alloc]initWithTitle:@"One"
                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 1");
                                                        }];
    
    BTSimpleMenuItem *item2 = [[BTSimpleMenuItem alloc]initWithTitle:@"Two"
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 2");
                                                        }];
    
    BTSimpleMenuItem *item3 = [[BTSimpleMenuItem alloc]initWithTitle:@"Three"
                                                               image:[UIImage imageNamed:@"icon3.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 3");
                                                        }];
    
    BTSimpleMenuItem *item4 = [[BTSimpleMenuItem alloc]initWithTitle:@"Four"
                                                               image:[UIImage imageNamed:@"icon4.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(@"I am Item 4");
                                                        }];
    
    BTSimpleMenuItem *item5 = [[BTSimpleMenuItem alloc]initWithTitle:@"Five"
                                                               image:[UIImage imageNamed:@"icon5.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 5");
                                                        }];
    
    BTSimpleMenuItem *item6 = [[BTSimpleMenuItem alloc]initWithTitle:@"Six"
                                                               image:[UIImage imageNamed:@"icon6.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 6");
                                                        }];
    
    BTSimpleMenuItem *item7 = [[BTSimpleMenuItem alloc]initWithTitle:@"Seven"
                                                               image:[UIImage imageNamed:@"icon7.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 7");
                                                            
                                                        }];
    
    sideMenu = [[BTSimpleSideMenu alloc]initWithItem:@[item1, item2, item3, item4, item5, item6, item7]
                                 addToViewController:self];

}
-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"Item Cliecked : %ld", (long)index);
}

-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu selectedItemTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Menu Clicked"
                                                   message:[NSString stringWithFormat:@"Item Title : %@", title]
                                                  delegate:self
                                         cancelButtonTitle:@"Dismiss"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
-(void)show{
    [sideMenu toggleMenu];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataSource == nil || _dataSource.count == 0) {
        return 0;
    }
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    TitleModel *titlemodel = _dataSource[indexPath.row];
    cell.textLabel.text = titlemodel.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}


@end
