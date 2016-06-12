//
//  DIYDetailViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/6/7.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DIYDetailViewController.h"

@interface DIYDetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *RoleInfoView;
@property (weak, nonatomic) IBOutlet UIButton *showBtn;
@property (weak, nonatomic) IBOutlet UIButton *missBtn;

@property (weak, nonatomic) IBOutlet UIImageView *earringBtn;
@property (weak, nonatomic) IBOutlet UIImageView *beltBtn;
@property (weak, nonatomic) IBOutlet UIImageView *ringBtn1;
@property (weak, nonatomic) IBOutlet UIImageView *ringBtn2;
@property (weak, nonatomic) IBOutlet UIImageView *jewelryBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headBtn;
@property (weak, nonatomic) IBOutlet UIImageView *clothBtn;
@property (weak, nonatomic) IBOutlet UIImageView *pantBtn;
@property (weak, nonatomic) IBOutlet UIImageView *shoesBtn;
@property (weak, nonatomic) IBOutlet UIImageView *handBtn;
@property (weak, nonatomic) IBOutlet UIImageView *weaponBtn;
@property (weak, nonatomic) IBOutlet UIImageView *shieldBtn;
@property (weak, nonatomic) IBOutlet UIImageView *wingBtn;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *RoleInfoViewBottomConstraint;
@end

@implementation DIYDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor darkGrayColor];
    _RoleInfoViewBottomConstraint.constant = -200.f;

    if ([_type isEqualToString:@"start"]) {
        [self initRoleInfo];
    }
    
    [_showBtn addTarget:self action:@selector(showRoleInfo) forControlEvents:UIControlEventTouchUpInside];
    [_missBtn addTarget:self action:@selector(missRoleInfo) forControlEvents:UIControlEventTouchUpInside];
    [self initImageBtn];
}
#pragma mark 填入初始化人物数据
-(void)initRoleInfo{
    _attLab.text = [DIYHelper ChangeInt:_roleModel.att];
    _defLab.text = [DIYHelper ChangeInt:_roleModel.def];
    
    _strLab.text = [DIYHelper ChangeInt:_roleModel.str];
    _mintLab.text = [DIYHelper ChangeInt:_roleModel.mint];
    _agiLab.text = [DIYHelper ChangeInt:_roleModel.agi];
    _wilLab.text = [DIYHelper ChangeInt:_roleModel.wil];
    
    _pinghengLab.text = [DIYHelper ChangeInt:_roleModel.pingheng];
    _gongsuLab.text = [DIYHelper ChangeInt:_roleModel.gongsu];
    _baojiLab.text = [DIYHelper ChangeInt:_roleModel.baoji];
    _baokangLab.text = [DIYHelper ChangeInt:_roleModel.baokang];
    
    _staLab.text = [DIYHelper ChangeInt:_roleModel.sta];
    
}
#pragma mark 设置装备图标
-(void)initImageBtn {
    //设置阴影 添加手势
}
#pragma mark 选择装备点击事情

#pragma mark 人物信息菜单缩放
-(void)showRoleInfo{
    _RoleInfoViewBottomConstraint.constant = 0.f;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}
-(void)missRoleInfo{
     _RoleInfoViewBottomConstraint.constant = -200.f;
    [UIView animateWithDuration:0.5 animations:^{
       [self.view layoutIfNeeded];
    }];
}
#pragma mark 填写手镯信息
- (IBAction)writeBraceletInfo:(id)sender {
}


@end
