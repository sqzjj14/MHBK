//
//  EnchantViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/5/16.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "EnchantViewController.h"
#import "TitleModel.h"
#import "TitilePopView.h"
#import "BTSimpleSideMenu.h"

@interface EnchantViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *allData;
@property(nonatomic)BTSimpleSideMenu *sideMenu;
//@property(nonatomic,strong)TitilePopView* titlePopView;
@property(nonatomic,strong)UITapGestureRecognizer *popTap;

@end

@implementation EnchantViewController
@synthesize sideMenu;

- (void)viewDidLoad {
    
    self.rippleImageName = @"background.png";
    [super viewDidLoad];
    self.title = @"右滑选择附魔类型";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    _titlePopView = [[NSBundle mainBundle]loadNibNamed:@"TitlePopView" owner:nil options:nil][0];
//    _titlePopView.backgroundColor = [UIColor whiteColor];
//    _titlePopView.layer.shadowOffset = CGSizeMake(2, 2);
//    _titlePopView.layer.shadowColor = [[UIColor redColor]CGColor];
//    _titlePopView.layer.shadowOpacity = 0.5;
//    _titlePopView.layer.cornerRadius = 2 ;
//    _titlePopView.layer.shadowRadius= 8;
    
    _allData = [[DatabaseManager mabinogiHelper]CreatEnchantDataSource];//总数据源
    _dataSource = [[NSMutableArray alloc]init];//collection数据源
    
    _popTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closePop:)];
    [self initMenu];
}
#pragma mark - Menu
- (void)initMenu{
    //sideMenu.delegate = self;
    BTSimpleMenuItem *item1 = [[BTSimpleMenuItem alloc]initWithTitle:@"武器"                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(@"武器");
                                                            _dataSource = _allData[0];
                                                            [self.tableView reloadData];
                                                            self.title = @"武器";
                                                        }];
    
    BTSimpleMenuItem *item2 = [[BTSimpleMenuItem alloc]initWithTitle:@"防具"
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(@"防具");
                                                            _dataSource = _allData[1];
                                                            [self.tableView reloadData];
                                                            self.title = @"防具";
                                                        }];
    
    BTSimpleMenuItem *item3 = [[BTSimpleMenuItem alloc]initWithTitle:EVY
                                                               image:[UIImage imageNamed:@"icon3.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 3");
                                                            _dataSource = _allData[2];
                                                            [self.tableView reloadData];
                                                            self.title = EVY;
                                                        }];
    
    BTSimpleMenuItem *item4 = [[BTSimpleMenuItem alloc]initWithTitle:KAROK
                                                               image:[UIImage imageNamed:@"icon4.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(@"I am Item 4");
                                                            _dataSource = _allData[3];
                                                            [self.tableView reloadData];
                                                            self.title = KAROK;
                                                        }];
    
    BTSimpleMenuItem *item5 = [[BTSimpleMenuItem alloc]initWithTitle:KAY
                                                               image:[UIImage imageNamed:@"icon5.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 5");
                                                            _dataSource = _allData[4];
                                                            [self.tableView reloadData];
                                                            self.title = KAY;
                                                        }];
    
    BTSimpleMenuItem *item6 = [[BTSimpleMenuItem alloc]initWithTitle:VELLA
                                                               image:[UIImage imageNamed:@"icon6.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 6");
                                                            _dataSource = _allData[5];
                                                            [self.tableView reloadData];
                                                            self.title = VELLA;
                                                        }];
    
    BTSimpleMenuItem *item7 = [[BTSimpleMenuItem alloc]initWithTitle:LYNN
                                                               image:[UIImage imageNamed:@"icon7.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 7");
                                                            _dataSource = _allData[6];
                                                            [self.tableView reloadData];
                                                            self.title = LYNN;
                                                            
                                                        }];
    BTSimpleMenuItem *item8 = [[BTSimpleMenuItem alloc]initWithTitle:HURK
                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(HURK);
                                                            _dataSource = _allData[7];
                                                            [self.tableView reloadData];
                                                            self.title = HURK;
                                                            
                                                        }];
    BTSimpleMenuItem *item9 = [[BTSimpleMenuItem alloc]initWithTitle:ARISHA
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(ARISHA);
                                                            _dataSource = _allData[8];
                                                            [self.tableView reloadData];
                                                            self.title = LYNN;
                                                            
                                                        }];
    BTSimpleMenuItem *item10 = [[BTSimpleMenuItem alloc]initWithTitle:HAGIE
                                                                image:[UIImage imageNamed:@"icon3.png"]
                                                         onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                             
                                                             NSLog(HAGIE);
                                                             _dataSource = _allData[9];
                                                             [self.tableView reloadData];
                                                             self.title = HAGIE;
                                                             
                                                         }];
    BTSimpleMenuItem *item11 = [[BTSimpleMenuItem alloc]initWithTitle:DELIA
                                                                image:[UIImage imageNamed:@"icon4.png"]
                                                         onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                             
                                                             NSLog(DELIA);
                                                             _dataSource = _allData[10];
                                                             [self.tableView reloadData];
                                                             self.title = DELIA;
                                                             
                                                         }];
    
    sideMenu = [[BTSimpleSideMenu alloc]initWithItem:@[item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11]
                                 addToViewController:self];
    
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
    //return [_allData[0]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    TitleModel *titlemodel = _dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.          %@",indexPath.row+1,titlemodel.title];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
