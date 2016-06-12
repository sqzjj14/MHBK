//
//  DIYDetailViewController.h
//  Mabinogi_heroes
//
//  Created by gang liu on 16/6/7.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIYRoleModel.h"

@interface DIYDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *attLab;
@property (weak, nonatomic) IBOutlet UILabel *defLab;
@property (weak, nonatomic) IBOutlet UILabel *pinghengLab;
@property (weak, nonatomic) IBOutlet UILabel *gongsuLab;
@property (weak, nonatomic) IBOutlet UILabel *baojiLab;
@property (weak, nonatomic) IBOutlet UILabel *strLab;
@property (weak, nonatomic) IBOutlet UILabel *mintLab;
@property (weak, nonatomic) IBOutlet UILabel *wilLab;
@property (weak, nonatomic) IBOutlet UILabel *shengmingzhiLab;
@property (weak, nonatomic) IBOutlet UILabel *baokangLab;
@property (weak, nonatomic) IBOutlet UILabel *agiLab;
@property (weak, nonatomic) IBOutlet UILabel *staLab;

@property (nonatomic,strong) DIYRoleModel *roleModel;
@property (nonatomic,copy) NSString *type;
@end
