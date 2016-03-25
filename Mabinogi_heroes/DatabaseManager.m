//
//  DatabaseManager.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/25.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DatabaseManager.h"

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

@end
