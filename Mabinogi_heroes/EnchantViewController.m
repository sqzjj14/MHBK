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
#import "EnchantPopView.h"

@interface EnchantViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *allData;
@property(nonatomic)BTSimpleSideMenu *sideMenu;
@property(nonatomic,strong)EnchantPopView* enchantPopView;
@property(nonatomic,strong)UITapGestureRecognizer *popTap;

@end

@implementation EnchantViewController
@synthesize sideMenu;

- (void)viewDidLoad {
    
    self.rippleImageName = @"tier_bg.png";
    [super viewDidLoad];
    self.title = @"右滑选择附魔类型";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _enchantPopView = [[NSBundle mainBundle]loadNibNamed:@"EnchantPopView" owner:nil options:nil][0];
    _enchantPopView.backgroundColor = [UIColor whiteColor];
    _enchantPopView.layer.shadowOffset = CGSizeMake(2, 2);
    _enchantPopView.layer.shadowColor = [[UIColor redColor]CGColor];
    _enchantPopView.layer.shadowOpacity = 0.5;
    _enchantPopView.layer.cornerRadius = 2 ;
    _enchantPopView.layer.shadowRadius= 8;
    
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
    
    BTSimpleMenuItem *item3 = [[BTSimpleMenuItem alloc]initWithTitle:@"首饰"
                                                               image:[UIImage imageNamed:@"icon3.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 3");
                                                            _dataSource = _allData[2];
                                                            [self.tableView reloadData];
                                                            self.title = @"首饰";
                                                        }];
    
    BTSimpleMenuItem *item4 = [[BTSimpleMenuItem alloc]initWithTitle:@"副手"
                                                               image:[UIImage imageNamed:@"icon4.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(@"I am Item 4");
                                                            _dataSource = _allData[3];
                                                            [self.tableView reloadData];
                                                            self.title = @"副手";
                                                        }];
    
    BTSimpleMenuItem *item5 = [[BTSimpleMenuItem alloc]initWithTitle:@"7级"
                                                               image:[UIImage imageNamed:@"icon5.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"7级");
                                                            _dataSource = _allData[4];
                                                            [self.tableView reloadData];
                                                            self.title = KAY;
                                                        }];
    
    BTSimpleMenuItem *item6 = [[BTSimpleMenuItem alloc]initWithTitle:@"8级"
                                                               image:[UIImage imageNamed:@"icon6.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"8级");
                                                            _dataSource = _allData[5];
                                                            [self.tableView reloadData];
                                                            self.title = @"8级";
                                                        }];
    
    BTSimpleMenuItem *item7 = [[BTSimpleMenuItem alloc]initWithTitle:@"9级"
                                                               image:[UIImage imageNamed:@"icon7.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"9级");
                                                            _dataSource = _allData[6];
                                                            [self.tableView reloadData];
                                                            self.title = @"9级";
                                                            
                                                        }];
    BTSimpleMenuItem *item8 = [[BTSimpleMenuItem alloc]initWithTitle:@"A级"
                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"A级");
                                                            _dataSource = _allData[7];
                                                            [self.tableView reloadData];
                                                            self.title = @"A级";
                                                            
                                                        }];
    BTSimpleMenuItem *item9 = [[BTSimpleMenuItem alloc]initWithTitle:@"B级"
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"B级");
                                                            _dataSource = _allData[8];
                                                            [self.tableView reloadData];
                                                            self.title = @"B级";
                                                            
                                                        }];
    BTSimpleMenuItem *item10 = [[BTSimpleMenuItem alloc]initWithTitle:@"C级"
                                                                image:[UIImage imageNamed:@"icon3.png"]
                                                         onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                             
                                                             NSLog(@"C级");
                                                             _dataSource = _allData[9];
                                                             [self.tableView reloadData];
                                                             self.title = @"C级";
                                                             
                                                         }];
    BTSimpleMenuItem *item11 = [[BTSimpleMenuItem alloc]initWithTitle:@"D级"
                                                                image:[UIImage imageNamed:@"icon4.png"]
                                                         onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                             
                                                             NSLog(@"D级");
                                                             _dataSource = _allData[10];
                                                             [self.tableView reloadData];
                                                             self.title = @"D级";
                                                             
                                                         }];
    BTSimpleMenuItem *item12 = [[BTSimpleMenuItem alloc]initWithTitle:@"E级"
                                                                image:[UIImage imageNamed:@"icon4.png"]
                                                         onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                             
                                                             NSLog(@"E级");
                                                             _dataSource = _allData[11];
                                                             [self.tableView reloadData];
                                                             self.title = @"E级";
                                                             
                                                         }];
    BTSimpleMenuItem *item13 = [[BTSimpleMenuItem alloc]initWithTitle:@"F级"
                                                                image:[UIImage imageNamed:@"icon4.png"]
                                                         onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                             
                                                             NSLog(@"F级");
                                                             _dataSource = _allData[12];
                                                             [self.tableView reloadData];
                                                             self.title = @"F级";
                                                             
                                                         }];
    
    sideMenu = [[BTSimpleSideMenu alloc]initWithItem:@[item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11,item12,item13]
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
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.                            %@",indexPath.row+1,titlemodel.title];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    TitleModel *titleModel = _dataSource[indexPath.row];
    _enchantPopView.title.text = titleModel.title;
    _enchantPopView.basic.text = [NSString stringWithFormat:@"%@   %@",titleModel.level_enchant,titleModel.style];
    _enchantPopView.property.text = titleModel.customattribute;
    _enchantPopView.howToGet.text = titleModel.customprovenance;
    _enchantPopView.howEquipment.text = titleModel.custompart;
    [self.view addSubview:_enchantPopView];
    [_enchantPopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).with.offset(10);
        make.centerY.equalTo(self.view.mas_centerY).with.offset(-50);
        make.width.equalTo(@250);
        make.height.equalTo(@400);
    }];
    _enchantPopView.alpha = 0;
    [UIView animateWithDuration:0.35 animations:^{
        _enchantPopView.alpha = 1;
    }];
    [_enchantPopView addGestureRecognizer:_popTap];

}
#pragma mark Popview
- (void)closePop:(UITapGestureRecognizer*)tap{
    [UIView animateWithDuration:0.3 animations:^{
        _enchantPopView.alpha = 0;
    } completion:^(BOOL finished) {
        [_enchantPopView removeFromSuperview];
        [self.view removeGestureRecognizer:tap];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
