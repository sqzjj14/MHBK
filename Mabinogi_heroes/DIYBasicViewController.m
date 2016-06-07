//
//  DIYBasicViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/6/7.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DIYBasicViewController.h"
#import "DIYRoleModel.h"
#import "SVProgressHUD.h"
#import "DIYDetailViewController.h"
#import "DressListView.h"
#import "RoleListView.h"

@interface DIYBasicViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *strTF;
@property (weak, nonatomic) IBOutlet UITextField *mintTF;
@property (weak, nonatomic) IBOutlet UITextField *agiTF;
@property (weak, nonatomic) IBOutlet UITextField *wilTF;
@property (weak, nonatomic) IBOutlet UITextField *staTF;
@property (weak, nonatomic) IBOutlet UITextField *shengmingzhiTF;
@property (weak, nonatomic) IBOutlet UIView *dressView;
@property (weak, nonatomic) IBOutlet UIView *roleView;
@property (weak, nonatomic) IBOutlet UILabel *selectDressLab;
@property (weak, nonatomic) IBOutlet UILabel *selectRoleLab;

@property (nonatomic,strong) DressListView *dressTable;
@property (nonatomic,strong) RoleListView *roleTable;

@property (strong,nonatomic) DIYRoleModel *roleModel;

@end

@implementation DIYBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第一步:基本信息填写";
    _roleModel = [[DIYRoleModel alloc]init];
    
    //边框设计
    _dressView.layer.borderWidth = 0.5;
    _dressView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _roleView.layer.borderWidth = 0.5;
    _roleView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    //时装与角色选择通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectRoleCompletion:) name:@"Role" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectDressCompletion:) name:@"Dress"object:nil];
    
    //时装与角色手势
    UITapGestureRecognizer *dressTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showDressList)];
    [_dressView addGestureRecognizer:dressTap];
    UITapGestureRecognizer *roleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showRoleList)];
    [_roleView addGestureRecognizer:roleTap];
    
}
#pragma showList手势
-(void)showDressList{
    _dressTable = [[DressListView alloc]initDressListWithFrame:CGRectMake(_dressView.frame.origin.x, _dressView.frame.origin.y - 150, _dressView.frame.size.width, 150)];
    [self.view addSubview:_dressTable];
    _dressTable.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        _dressTable.alpha = 1;
    }];
}
-(void)showRoleList{
    _roleTable = [[RoleListView alloc]initRoleListWithFrame:CGRectMake(_roleView.frame.origin.x, _roleView.frame.origin.y - 120, _roleView.frame.size.width, 120)];
    [self.view addSubview:_roleTable];
    _roleTable.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        _roleTable.alpha = 1;
    }];
}
#pragma Completion通知
-(void)selectRoleCompletion:(NSNotification*)notification{
    _selectRoleLab.text = notification.object;
    [UIView animateWithDuration:0.5 animations:^{
         _roleTable.alpha = 0;
    } completion:^(BOOL finished) {
        [_roleTable removeFromSuperview];
    }];
    
}
-(void)selectDressCompletion:(NSNotification*)notification{
    _selectDressLab.text = notification.object;
    [UIView animateWithDuration:0.5 animations:^{
        _dressTable.alpha = 0;
    } completion:^(BOOL finished) {
       [_dressTable removeFromSuperview];
    }];
    
}

#pragma mark 提交
- (IBAction)submit:(id)sender {
    if(_strTF.text.length == 0){
        [SVProgressHUD setErrorImage:nil];
        [SVProgressHUD showErrorWithStatus:@"力量不能为空" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    if(_mintTF.text.length == 0){
        [SVProgressHUD setErrorImage:nil];
        [SVProgressHUD showErrorWithStatus:@"智力不能为空！" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    
    if(_agiTF.text.length == 0){
        [SVProgressHUD setErrorImage:nil];
        [SVProgressHUD showErrorWithStatus:@"敏捷不能为空" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    if(_wilTF.text.length == 0){
        [SVProgressHUD setErrorImage:nil];
        [SVProgressHUD showErrorWithStatus:@"意志不能为空" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    if(_staTF.text.length == 0){
        [SVProgressHUD setErrorImage:nil];
        [SVProgressHUD showErrorWithStatus:@"体力不能为空" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    if(_shengmingzhiTF.text.length == 0){
        [SVProgressHUD setErrorImage:nil];
        [SVProgressHUD showErrorWithStatus:@"生命值不能为空" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
  
//传入基础数据到配装界面
  //计算属性
    DIYDetailViewController *vc = [[DIYDetailViewController alloc]init];
    vc.roleModel.str = [_strTF.text integerValue];
    vc.roleModel.mint = [_mintTF.text integerValue];
    vc.roleModel.agi = [_agiTF.text integerValue];
    vc.roleModel.wil = [_wilTF.text integerValue];
    vc.roleModel.sta = [_staTF.text integerValue];
    vc.roleModel.shengmingzhi = [_shengmingzhiTF.text integerValue];
    //面板计算
      //面板攻击力计算公式
    if ([_selectRoleLab.text isEqualToString:@"物理职业"]) {
        vc.roleModel.att = vc.roleModel.str * 1.33 + 486;
    }
    else if ([_selectRoleLab.text isEqualToString:@"伊菲"]){
        vc.roleModel.att = vc.roleModel.mint * 2 + 1400;
    }
    else if ([_selectRoleLab.text isEqualToString:@"海基"]){
        vc.roleModel.att = vc.roleModel.mint * 2 + 1200;
    }
    else if ([_selectRoleLab.text isEqualToString:@"艾莉莎"]){
        vc.roleModel.att = vc.roleModel.mint * 2 + 700;
    }
     //防御计算公式
    vc.roleModel.def = vc.roleModel.agi * 0.5;
     //暴击计算公式  （133的整数倍 再多1 才加一点暴击）
    vc.roleModel.baoji = vc.roleModel.wil/133 + 31;
    if (vc.roleModel.wil >= 133 && vc.roleModel.wil%133 == 0) {
        vc.roleModel.baoji = vc.roleModel.baoji - 1;
    }
     //三维
    vc.roleModel.pingheng = 0;
    vc.roleModel.gongsu = 0;
     //暴抗
    vc.roleModel.baokang = 0;
     
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
