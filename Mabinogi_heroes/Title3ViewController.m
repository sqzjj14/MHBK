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
#import "CommonDefine.h"
#import "TitilePopView.h"

@interface Title3ViewController ()<BTSimpleSideMenuDelegate>
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *allData;
@property(nonatomic)BTSimpleSideMenu *sideMenu;
@property(nonatomic,strong)TitilePopView* titlePopView;
@property(nonatomic,strong)UITapGestureRecognizer *popTap;
@end

@implementation Title3ViewController
@synthesize sideMenu;

- (void)viewDidLoad {
    self.rippleImageName = @"background.png";
    [super viewDidLoad];
    self.title = @"向右滑动选择角色";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _titlePopView = [[NSBundle mainBundle]loadNibNamed:@"TitlePopView" owner:nil options:nil][0];
    _titlePopView.backgroundColor = [UIColor whiteColor];
    _titlePopView.layer.shadowOffset = CGSizeMake(2, 2);
    _titlePopView.layer.shadowColor = [[UIColor redColor]CGColor];
    _titlePopView.layer.shadowOpacity = 0.5;
    _titlePopView.layer.cornerRadius = 2 ;
    _titlePopView.layer.shadowRadius= 8;
    
    _allData = [[DatabaseManager mabinogiHelper]CreatAllRoleDataSource];//总数据源
    _dataSource = [[NSMutableArray alloc]init];//collection数据源
    
    _popTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closePop:)];
    [self initMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
#pragma mark - Menu
- (void)initMenu{
        sideMenu.delegate = self;
    BTSimpleMenuItem *item1 = [[BTSimpleMenuItem alloc]initWithTitle:LANN                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(LANN);
                                                            _dataSource = _allData[0];
                                                            [self.tableView reloadData];
                                                            self.title = LANN;
                                                        }];
    
    BTSimpleMenuItem *item2 = [[BTSimpleMenuItem alloc]initWithTitle:FIONA
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(FIONA);
                                                            _dataSource = _allData[1];
                                                            [self.tableView reloadData];
                                                            self.title = FIONA;
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
    //return [_allData[0]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    TitleModel *titlemodel = _dataSource[indexPath.row];
   // TitleModel *titlemodel = _allData[0][indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.          %@",indexPath.row+1,titlemodel.title];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    TitleModel *titleModel = _dataSource[indexPath.row];
    //名字
    _titlePopView.title.text = titleModel.title;
    //类型
    if (titleModel.remark == nil) {
        titleModel.remark = @"";
    }
    _titlePopView.typeRemark.text = [NSString stringWithFormat:@"%@ %@",titleModel.type,titleModel.remark];
    //地区
    if (titleModel.area == nil) {
        titleModel.area = @"";
    }
    if (titleModel.carbons == nil) {
        titleModel.carbons = @"";
    }
    if (titleModel.carbonf == nil) {
        titleModel.carbonf = @"";
    }
    _titlePopView.area.text = [NSString stringWithFormat:@"%@-%@-%@",titleModel.area,titleModel.carbonf,titleModel.carbons];
    //获取方式
    _titlePopView.channal.text = titleModel.channel;
    //属性
    if ([titleModel.liliang  isEqual: @""] && [titleModel.minjie  isEqual: @""] && [titleModel.zhili  isEqual: @""] && [titleModel.yizhi  isEqual: @""] && [titleModel.shengmingzhi  isEqual: @""]) {
        _titlePopView.liliang.text = @"";
        _titlePopView.minjie.text =  @"";
        _titlePopView.zhili.text = @"";
        _titlePopView.yizhi.text = @"";
        _titlePopView.shengmingzhi.text =  @"";
    }
    else{

        _titlePopView.liliang.text = [NSString stringWithFormat:@"力量:%@",titleModel.liliang];
        _titlePopView.minjie.text = [NSString stringWithFormat:@"敏捷:%@",titleModel.minjie];
        
        _titlePopView.zhili.text = [NSString stringWithFormat:@"智力:%@",titleModel.zhili];
        
        _titlePopView.yizhi.text = [NSString stringWithFormat:@"意志:%@",titleModel.yizhi];
        
        _titlePopView.shengmingzhi.text = [NSString stringWithFormat:@"生命值:%@",titleModel.shengmingzhi];
    }

    [self.tableView addSubview:_titlePopView];
    [_titlePopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).with.offset(10);
        make.centerY.equalTo(self.view.mas_centerY).with.offset(-50);
        make.width.equalTo(@250);
        make.height.equalTo(@400);
    }];
    _titlePopView.alpha = 0;
    [UIView animateWithDuration:0.35 animations:^{
        _titlePopView.alpha = 1;
    }];
    [self.view addGestureRecognizer:_popTap];
    
    
}
#pragma mark Popview
- (void)closePop:(UITapGestureRecognizer*)tap{
    [UIView animateWithDuration:0.3 animations:^{
        _titlePopView.alpha = 0;
    } completion:^(BOOL finished) {
        [_titlePopView removeFromSuperview];
        [self.view removeGestureRecognizer:tap];
    }];
}
@end
