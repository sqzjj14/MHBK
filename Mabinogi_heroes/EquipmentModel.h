//
//  EquipmentModel.h
//  Mabinogi_heroes
//
//  Created by 嬳 on 16/3/26.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquipmentModel : NSObject

//-----------------------------------------
//名字
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *title2;//三级地区表示
//等级
@property(nonatomic,copy)NSString *level;
//细类型 （如：双剑）
@property(nonatomic,copy)NSString *part;
//粗类型 （如：武器）
@property(nonatomic,copy)NSString *type;
//适用角色(如：利斯塔)
@property(nonatomic,copy)NSString *role;

//-----------------------------------------
//攻击
@property(nonatomic,assign)NSInteger att;
//平衡
@property(nonatomic,assign)NSInteger bal;
//攻速
@property(nonatomic,assign)NSInteger attspd;
//暴击
@property(nonatomic,assign)NSInteger critical;

//------------------------------------------
//力量
@property(nonatomic,assign)NSInteger str;
//智力
@property(nonatomic,assign)NSInteger mint;
//敏捷
@property(nonatomic,assign)NSInteger agi;
//意志
@property(nonatomic,assign)NSInteger wil;

//-----------------------------------------
//暴抗
@property(nonatomic,assign)NSInteger critresist;
//防御
@property(nonatomic,assign)NSInteger def;
//生命值
@property(nonatomic,assign)NSInteger shengmingzhi;
//体力
@property(nonatomic,assign)NSInteger sta;

//----------装备备注信息----------------------
@property(nonatomic,copy)NSString *remarks;

@property(nonatomic,copy)NSString *meunTitle;
@property(nonatomic,strong)NSMutableArray *nextArray;

//---副本额外信息-----
//暴抗
@property(nonatomic,copy)NSString *resist;
@property(nonatomic,copy)NSString *area;
@property(nonatomic,copy)NSString *titleBossName;


@end
