//
//  EquipmentModel.m
//  Mabinogi_heroes
//
//  Created by 嬳 on 16/3/26.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "EquipmentModel.h"

@implementation EquipmentModel

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.title = @"";
        self.title2 = @"";
        self.level = @"";
        self.role = @"";
        self.remarks = @"";
        
        self.att = 0;
        self.bal = 0;
        self.attspd = 0;
        self.critical = 0;
        
        self.str = 0;
        self.mint = 0;
        self.agi = 0;
        self.wil = 0;
        
        self.part = @"";
        self.type = @"";
        
        self.critresist = 0;
        self.def = 0;
        self.shengmingzhi = 0;
        self.sta = 0;
        
        self.nextArray = [[NSMutableArray alloc]init];
        self.meunTitle = @"";
        
        //--副本
        self.resist = @"";
        self.area = @"";
        self.titleBossName = @"";
    }
    return self;
}

@end
