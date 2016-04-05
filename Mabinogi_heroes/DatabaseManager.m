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
        
        _dataSource = [[NSMutableArray alloc]init];
        _arr1 =[[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",@"Lv57",nil];
        _arr2 =[[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",nil];
        
    }
    return self;
}

#pragma mark -Eqiupent-

- (NSMutableArray *)CreatWeaponDataSource
{
    [_dataSource removeAllObjects];
    
    EquipmentModel *DoubleSword =
    [self packageOneTypeWithName:DOUBLE_SWORD withLevel:_arr1];
    EquipmentModel *DoubleSpear =
    [self packageOneTypeWithName:DOUBLE_SPEAR withLevel:_arr1];
    EquipmentModel *SingleSword =
    [self packageOneTypeWithName:SINGLE_SWORD withLevel:_arr1];
    EquipmentModel *SingleHammer =
    [self packageOneTypeWithName:SINGLE_HAMMER withLevel:_arr1];
    EquipmentModel *Scythe =
    [self packageOneTypeWithName:SCYTHE withLevel:_arr1];
    EquipmentModel *Stave =
    [self packageOneTypeWithName:STAVE withLevel:_arr1];
    EquipmentModel *Pillar =
    [self packageOneTypeWithName:PILLAR withLevel:_arr2];
    EquipmentModel *Cestus =
    [self packageOneTypeWithName:CESTUS withLevel:_arr1];
    EquipmentModel *Arch =
    [self packageOneTypeWithName:ARCH withLevel:_arr1];
    EquipmentModel *Gun =
    [self packageOneTypeWithName:GUN withLevel:_arr2];
    EquipmentModel *Chain =
    [self packageOneTypeWithName:CHAIN withLevel:_arr2];
    EquipmentModel *Pertuisane =
    [self packageOneTypeWithName:PERTUISANE withLevel:_arr2];
    EquipmentModel *GreatSword =
    [self packageOneTypeWithName:GREAT_SWORD withLevel:_arr1];
    EquipmentModel *MagicSword =
    [self packageOneTypeWithName:MAGIC_SWORD withLevel:_arr2];
    EquipmentModel *GhostSword =
    [self packageOneTypeWithName:GHOST_SWORD withLevel:_arr2];
    EquipmentModel *Claymore =
    [self packageOneTypeWithName:CLAYMORE withLevel:_arr2];
    
    [_dataSource addObject:DoubleSword];
    [_dataSource addObject:DoubleSpear];
    [_dataSource addObject:SingleSword];
    [_dataSource addObject:SingleHammer];
    [_dataSource addObject:Scythe];
    [_dataSource addObject:Stave];
    [_dataSource addObject:Pillar];
    [_dataSource addObject:Cestus];
    [_dataSource addObject:Arch];
    [_dataSource addObject:Gun];
    [_dataSource addObject:Chain];
    [_dataSource addObject:Pertuisane];
    [_dataSource addObject:GreatSword];
    [_dataSource addObject:MagicSword];
    [_dataSource addObject:GhostSword];
    [_dataSource addObject:Claymore];
    
    return _dataSource;
}
- (NSMutableArray *)CreatArmorDataSource{
    
    [_dataSource removeAllObjects];
    
    
    EquipmentModel *Head =
    [self packageOneTypeWithName:HEAD withLevel:_arr2];
    EquipmentModel *Chest =
    [self packageOneTypeWithName:CHEST withLevel:_arr2];
    EquipmentModel *Leg =
    [self packageOneTypeWithName:LEG withLevel:_arr2];
    EquipmentModel *Hand =
    [self packageOneTypeWithName:HAND withLevel:_arr2];
    EquipmentModel *Foot =
    [self packageOneTypeWithName:FOOT withLevel:_arr2];
    
     [_dataSource addObject:Head];
     [_dataSource addObject:Chest];
     [_dataSource addObject:Leg];
     [_dataSource addObject:Hand];
     [_dataSource addObject:Foot];
    
    return _dataSource;
}
- (NSMutableArray *)CreatJewelryDataSource{
    
    [_dataSource removeAllObjects];
    
     _arr5 =[[NSArray alloc]initWithObjects:@"Lv70",@"Lv60",@"Lv44",@"Lv40",nil];
    _arr6 = [[NSArray alloc]initWithObjects:@"Lv85",@"Lv80",@"Lv60",nil];
    
    EquipmentModel *Belt =
    [self packageOneTypeWithName:BELT withLevel:_arr2];
    EquipmentModel *Brooch =
    [self packageOneTypeWithName:BROOCH withLevel:_arr5];
    EquipmentModel *Earrings =
    [self packageOneTypeWithName:EARRINGS withLevel:_arr6];
    EquipmentModel *Ring =
    [self packageOneTypeWithName:RING withLevel:_arr2];
    
    [_dataSource addObject:Belt];
    [_dataSource addObject:Brooch];
    [_dataSource addObject:Earrings];
    [_dataSource addObject:Ring];
    
    return _dataSource;
}
- (NSMutableArray *)CreatOtherDataSource{
    
    [_dataSource removeAllObjects];
    _arr3 =[[NSArray alloc]initWithObjects:@"Lv80",@"Lv60",@"Lv42",nil];
    _arr4 = [[NSArray alloc]initWithObjects:@"Lv60",@"Lv54",@"Lv52",nil];
    _arr7 = [[NSArray alloc]initWithObjects:@"Lv0", nil];
    _arr8 =[ [NSArray alloc]initWithObjects:@"Lv80", nil];
   
    
    EquipmentModel *Horcruxes =
    [self packageOneTypeWithName:HORCRUXES withLevel:_arr3];
    EquipmentModel *smallShield =
    [self packageOneTypeWithName:SMALL_SHIELD withLevel:_arr8];
    EquipmentModel *bigShield =
    [self packageOneTypeWithName:BIG_SHIELD withLevel:_arr2];
    EquipmentModel *magicBook =
    [self packageOneTypeWithName:MAGIC_BOOK withLevel:_arr4];
    EquipmentModel *craft =
    [self packageOneTypeWithName:CRAFT withLevel:_arr7];
    
    [_dataSource addObject:Horcruxes];
    [_dataSource addObject:smallShield];
    [_dataSource addObject:bigShield];
    [_dataSource addObject:magicBook];
    [_dataSource addObject:craft];
    
    return _dataSource;
}


#pragma mark PackageHelper
- (EquipmentModel *)packageOneTypeWithName:(NSString *)weaponName withLevel:(NSArray *)levelArr
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
