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

+ (instancetype)mabinogiHelper;

//创建武器总数据源
- (NSMutableArray *)CreatWeaponDataSource;

//封装一种武器的类型：如双剑 parma1:双剑 param2:lv90 lv80 lv70
- (EquipmentModel *)packageOneTypeWeaponWithWeaponName:(NSString *)weaponName withLevel:(NSArray *)levelArr;
@end


