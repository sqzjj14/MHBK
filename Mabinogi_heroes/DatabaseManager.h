//
//  DatabaseManager.h
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/25.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DatabaseManager : NSObject

@property(nonatomic,strong)FMDatabase *database;

+ (instancetype)mabinogiHelper;

@end


