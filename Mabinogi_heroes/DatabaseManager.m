//
//  DatabaseManager.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/25.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DatabaseManager.h"
#import "EquipmentModel.h"

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

#pragma mark -双剑-
- (void)initDoubleSword
{
    [self.database open];
    
    NSString *selecetSQL = @"SELECET * FROM equipment where part='双剑'";
    FMResultSet *rs =  [self.database executeQuery:selecetSQL];
    
    while ([rs next]) {
        EquipmentModel *doubleSword = [[EquipmentModel alloc]init];
        doubleSword.title = [rs stringForColumn:@"title"];
        doubleSword.level = [rs stringForColumn:@"level"];
        doubleSword.part = [rs stringForColumn:@"part"];
        doubleSword.type = [rs stringForColumn:@"type"];
        doubleSword.role = [rs stringForColumn:@"role"];
        
        doubleSword.att = [rs intForColumn:@"att"];
        doubleSword.bal = [rs intForColumn:@"bal"];
        doubleSword.attspd = [rs intForColumn:@"attspd"];
        doubleSword.critical = [rs intForColumn:@"critical"];
        
        doubleSword.str = [rs intForColumn:@"str"];
        doubleSword.mint = [rs intForColumn:@"mint"];
        doubleSword.agi = [rs intForColumn:@"agi"];
        doubleSword.wil = [rs intForColumn:@"wil"];
        
        doubleSword.critresist = [rs intForColumn:@"critresist"];
        doubleSword.shengmingzhi = [rs intForColumn:@"shengmingzhi"];
        doubleSword.def = [rs intForColumn:@"def"];
        doubleSword.sta = [rs intForColumn:@"sta"];
        
        doubleSword.remarks = [rs stringForColumn:@"remarks"];
        
        
        
    }
    
}
#pragma mark -双枪-
- (void)initDoubleSpear
{
    
}
#pragma mark -单手剑-
- (void)initSword
{
    
}
#pragma mark -单手锤-
#pragma mark -法杖-
#pragma mark -镰刀-

@end
