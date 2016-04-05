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
//魂器
@property(nonatomic,strong)NSArray *arr3;
//魔法书
@property(nonatomic,strong)NSArray *arr4;
//胸针
@property(nonatomic,strong)NSArray *arr5;
//耳环
@property(nonatomic,strong)NSArray *arr6;
//工艺品
@property(nonatomic,strong)NSArray *arr7;
//小盾
@property(nonatomic,strong)NSArray *arr8;

//单例的入口
+ (instancetype)mabinogiHelper;

//装备db源封装
- (NSMutableArray *)CreatWeaponDataSource;
- (NSMutableArray *)CreatArmorDataSource;
- (NSMutableArray *)CreatJewelryDataSource;
- (NSMutableArray *)CreatOtherDataSource;

//封装一种武器的类型：如双剑 parma1:双剑 param2:lv90 lv80 lv70
- (EquipmentModel *)packageOneTypeWithName:(NSString *)weaponName withLevel:(NSArray *)levelArr;
@end


