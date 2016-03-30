//
//  DatabaseManager.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/25.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DatabaseManager.h"
#import "EquipmentModel.h"
#import "Header.h"
@implementation DatabaseManager

//单例的入口
+ (instancetype)mabinogiHelper
{
    static DatabaseManager *manager;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        manager = [[DatabaseManager alloc]init];
    });
    return manager;
}

//重写初始化方法
- (instancetype)init
{
    if (self = [super init]) {
        
        NSString *locationPath = [[NSBundle mainBundle]pathForResource:@"vindicyusdb" ofType:@"db"];
        self.database = [FMDatabase databaseWithPath:locationPath];
        
        if (self.database != nil) {
            NSLog(@"Mabinogi.db Load successfully!");
        }
        else {
            NSLog(@"Mabinogi.db Load Fail");
        }
    }
    return self;
}

#pragma mark -武器-

- (NSMutableArray *)CreatWeaponDataSource
{
    NSMutableArray *AllDataSource = [[NSMutableArray alloc]init];
    
    NSArray *arr1 =
    [[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",@"Lv57",nil];
    NSArray *arr2 =
    [[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",nil];
    
    
    EquipmentModel *DoubleSword =
    [self packageOneTypeWeaponWithWeaponName:DOUBLE_SWORD withLevel:arr1];
    EquipmentModel *DoubleSpear =
    [self packageOneTypeWeaponWithWeaponName:DOUBLE_SPEAR withLevel:arr1];
    EquipmentModel *SingleSword =
    [self packageOneTypeWeaponWithWeaponName:SINGLE_SWORD withLevel:arr1];
    EquipmentModel *SingleHammer =
    [self packageOneTypeWeaponWithWeaponName:SINGLE_HAMMER withLevel:arr1];
    EquipmentModel *Scythe =
    [self packageOneTypeWeaponWithWeaponName:SCYTHE withLevel:arr1];
    EquipmentModel *Stave =
    [self packageOneTypeWeaponWithWeaponName:STAVE withLevel:arr1];
    EquipmentModel *Pillar =
    [self packageOneTypeWeaponWithWeaponName:PILLAR withLevel:arr2];
    EquipmentModel *Cestus =
    [self packageOneTypeWeaponWithWeaponName:CESTUS withLevel:arr1];
    EquipmentModel *Arch =
    [self packageOneTypeWeaponWithWeaponName:ARCH withLevel:arr1];
    EquipmentModel *Gun =
    [self packageOneTypeWeaponWithWeaponName:GUN withLevel:arr2];
    EquipmentModel *Chain =
    [self packageOneTypeWeaponWithWeaponName:CHAIN withLevel:arr2];
    EquipmentModel *Pertuisane =
    [self packageOneTypeWeaponWithWeaponName:PERTUISANE withLevel:arr2];
    EquipmentModel *GreatSword =
    [self packageOneTypeWeaponWithWeaponName:GREAT_SWORD withLevel:arr1];
    EquipmentModel *MagicSword =
    [self packageOneTypeWeaponWithWeaponName:MAGIC_SWORD withLevel:arr2];
    EquipmentModel *GhostSword =
    [self packageOneTypeWeaponWithWeaponName:GHOST_SWORD withLevel:arr2];
    EquipmentModel *Claymore =
    [self packageOneTypeWeaponWithWeaponName:CLAYMORE withLevel:arr2];
    
    [AllDataSource addObject:DoubleSword];
    [AllDataSource addObject:DoubleSpear];
    [AllDataSource addObject:SingleSword];
    [AllDataSource addObject:SingleHammer];
    [AllDataSource addObject:Scythe];
    [AllDataSource addObject:Stave];
    [AllDataSource addObject:Pillar];
    [AllDataSource addObject:Cestus];
    [AllDataSource addObject:Arch];
    [AllDataSource addObject:Gun];
    [AllDataSource addObject:Chain];
    [AllDataSource addObject:Pertuisane];
    [AllDataSource addObject:GreatSword];
    [AllDataSource addObject:MagicSword];
    [AllDataSource addObject:GhostSword];
    [AllDataSource addObject:Claymore];
    
    return AllDataSource;
}

#pragma mark WeaponPackageHelper
- (EquipmentModel *)packageOneTypeWeaponWithWeaponName:(NSString *)weaponName withLevel:(NSArray *)levelArr
{
    [self.database open];
    
    EquipmentModel *secondModel = [[EquipmentModel alloc]init];
    //tableView的cell.title.text
    secondModel.meunTitle = weaponName;
    
    //每个等级
    for (NSString *level in levelArr) {
        
        NSString *selecetSQL = [NSString stringWithFormat:@"SELECT * FROM equipment where part='%@' and level='%@'",weaponName,level];
        FMResultSet *rs =  [self.database executeQuery:selecetSQL];
      
    //每个装备
        NSMutableArray *thirdArray = [[NSMutableArray alloc]init];
        while ([rs next]) {
            EquipmentModel *thirdModel = [[EquipmentModel alloc]init];
            thirdModel.title = [rs stringForColumn:@"title"];
            thirdModel.level = [rs stringForColumn:@"level"];
            thirdModel.part = [rs stringForColumn:@"part"];
            thirdModel.type = [rs stringForColumn:@"type"];
            thirdModel.role = [rs stringForColumn:@"role"];
            
            thirdModel.att = [rs intForColumn:@"att"];
            thirdModel.bal = [rs intForColumn:@"bal"];
            thirdModel.attspd = [rs intForColumn:@"attspd"];
            thirdModel.critical = [rs intForColumn:@"critical"];
            
            thirdModel.str = [rs intForColumn:@"str"];
            thirdModel.mint = [rs intForColumn:@"mint"];
            thirdModel.agi = [rs intForColumn:@"agi"];
            thirdModel.wil = [rs intForColumn:@"wil"];
            
            thirdModel.critresist = [rs intForColumn:@"critresist"];
            thirdModel.shengmingzhi = [rs intForColumn:@"shengmingzhi"];
            thirdModel.def = [rs intForColumn:@"def"];
            thirdModel.sta = [rs intForColumn:@"sta"];
            
            thirdModel.remarks = [rs stringForColumn:@"remarks"];
            
                   if (thirdModel.remarks == nil) {
                       thirdModel.remarks = @"无";
                     }
            [thirdArray addObject:thirdModel];
        }
        [secondModel.nextArray addObject:thirdArray];
     }
      [self.database close];
      return secondModel;
}

@end
