//
//  DatabaseManager.h
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/25.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Header.h"


@interface DatabaseManager : NSObject

@property(nonatomic,strong)FMDatabase *database;
@property(nonatomic,strong)NSMutableArray *dataSource;
//level筛选数列
@property(nonatomic,strong)NSArray *arr1;
@property(nonatomic,strong)NSArray *arr2;
@property(nonatomic,strong)NSArray *arr3;//魂器
@property(nonatomic,strong)NSArray *arr4;//魔法书
@property(nonatomic,strong)NSArray *arr5;//胸针
@property(nonatomic,strong)NSArray *arr6;//耳环
@property(nonatomic,strong)NSArray *arr7;//工艺品
@property(nonatomic,strong)NSArray *arr8;//小盾

//area筛选数列
@property(nonatomic,strong)NSArray *arr_area1;
@property(nonatomic,strong)NSArray *arr_area2;
@property(nonatomic,strong)NSArray *arr_area3;
@property(nonatomic,strong)NSArray *arr_area4;
@property(nonatomic,strong)NSArray *arr_area5;
@property(nonatomic,strong)NSArray *arr_area6;
@property(nonatomic,strong)NSArray *arr_area7;

//头衔的表名数列
@property(nonatomic,strong)NSArray *roleTitleArr;
//附魔部位筛选数列
@property(nonatomic,strong)NSArray *enchantArr;


//单例的入口
+ (instancetype)mabinogiHelper;

//装备db源封装
- (NSMutableArray *)CreatWeaponDataSource;
- (NSMutableArray *)CreatArmorDataSource;
- (NSMutableArray *)CreatJewelryDataSource;
- (NSMutableArray *)CreatOtherDataSource;
//BOSSdb源封装、
- (NSMutableArray *)CreatBossDataSource;
//头衔db源封装
- (NSMutableArray *)CreatAllRoleDataSource;
//附魔db源封装
- (NSMutableArray *)CreatEnchantDataSource;



//封装一种武器的类型：如双剑 parma1:双剑 param2:lv90 lv80 lv70
- (EquipmentModel *)packageOneTypeWithName:(NSString *)weaponName withLevel:(NSArray *)levelArr;
//封装副本Boss
- (EquipmentModel *)packageOneSubAreaWithName:(NSString *)areaName with:(NSArray *)SubAreaArr;
//封装头衔
- (NSMutableArray *)packageOneTitleWithName:(NSString *)roleName;
//封装附魔
- (NSMutableArray *)packageOneEnchantWithEquipmentName:(NSString *)equipmentName;
@end


