//
//  TitleViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/7.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "TitleViewController.h"
#import "LLSlideMenu.h"

@interface TitleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LLSlideMenu *slideMenu;

// 全屏侧滑手势
@property (nonatomic, strong) UIPanGestureRecognizer *leftSwipe;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percent;
@property (nonatomic,strong)UIImageView *userIconImageV;
@property (nonatomic,strong) NSArray *roleArr; //角色名字数列

@property (weak, nonatomic) IBOutlet UIButton *bitchBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *navigiBar;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initLLSlideView];
    self.navigationController.navigationBarHidden = YES;
    self.navigiBar.backgroundColor = COLOR_NAVIBAR_BACKGROUD;
    
}
-(void)initLLSlideView{
    // 初始化
    _slideMenu = [[LLSlideMenu alloc] init];
    [self.view addSubview:_slideMenu];
    // 设置菜单宽度
    _slideMenu.ll_menuWidth = 2*WIDTH_SCREEN/3;
    // 设置菜单背景色
    _slideMenu.ll_menuBackgroundColor = COLOR_NAVIBAR_BACKGROUD;
    // 设置弹力和速度，  默认的是20,15,60
    _slideMenu.ll_springDamping = 20;       // 阻力
    _slideMenu.ll_springVelocity = 15;      // 速度
    _slideMenu.ll_springFramesNum = 60;     // 关键帧数量
    
    CGFloat imageMagin = 50.f; //左边距
    _userIconImageV=[[UIImageView alloc]initWithFrame:CGRectMake(imageMagin, 25, (2*WIDTH_SCREEN/3)-2*imageMagin, (2*WIDTH_SCREEN/3)-2*imageMagin)];
    [self.view addSubview:_userIconImageV];
    
    _userIconImageV.layer.masksToBounds=YES;
    _userIconImageV.layer.cornerRadius=((2*WIDTH_SCREEN/3)-2*imageMagin)/2.0f; //设置为图片宽度的一半出来为圆形
    _userIconImageV.layer.borderWidth=3.0f; //边框宽度
    _userIconImageV.layer.borderColor=[[UIColor whiteColor] CGColor];//边框颜色
    _userIconImageV.backgroundColor = [UIColor whiteColor];
    
    _userIconImageV.image=[UIImage imageNamed:@"女妖"];
    [_slideMenu addSubview:_userIconImageV];
    
    _roleArr =
    [[NSArray alloc]initWithObjects:LANN,FIONA,EVY,KAROK,KAY,VELLA,LYNN,HURK,ARISHA,HAGIE,DELIA, nil];
    
    for (NSInteger i = 0; i<11; i++) {
        
        UIButton *role = [UIButton buttonWithType:0];
        role.frame = CGRectMake(imageMagin, i*30 + 35 + (2*WIDTH_SCREEN/3)-2*imageMagin, (2*WIDTH_SCREEN/3)-2*imageMagin, 20);
        [role setTitle:_roleArr[i] forState:UIControlStateNormal];
        role.titleLabel.font = [UIFont fontWithName:FONT_DEFAULT size:16];
        [role addTarget:self action:@selector(pickRole:) forControlEvents:UIControlEventTouchUpInside];
        role.tag = i+100;
        [_slideMenu addSubview:role];
        
    }
}

-(void)pickRole:(UIButton *)sender
{
    switch (sender.tag) {
        case 100:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[0]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 101:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[1]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 102:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[2]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 103:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[3]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 104:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[4]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 105:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[5]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 106:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[6]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 107:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[7]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 108:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[8]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 109:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[9]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 110:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[10]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        case 111:
            _userIconImageV.image=[UIImage imageNamed:_roleArr[11]];
            //_userIconImageV.backgroundColor = [UIColor whiteColor];
            //createDataSource;
            //initTableView;
            break;
            
        default:
            break;
    }
}

- (IBAction)openLLSlideMenuAction:(id)sender {
    if (_slideMenu.ll_isOpen) {
        [_slideMenu ll_closeSlideMenu];
    } else {
        [_slideMenu ll_openSlideMenu];
    }
}

#pragma mark tableViewDelegate
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
