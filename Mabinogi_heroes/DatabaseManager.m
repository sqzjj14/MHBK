//
//  DatabaseManager.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/25.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DatabaseManager.h"

#import "EquipmentModel.h"
#import "TitleModel.h"

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
        
    }
    return self;
}

#pragma mark -Eqiupent-

- (NSMutableArray *)CreatWeaponDataSource
{
    [_dataSource removeAllObjects];
    
    _arr1 =[[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",@"Lv57",nil];
    _arr2 =[[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",nil];
    
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
    
    _arr2 =[[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",nil];
    
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
    
    _arr5 =[[NSArray alloc]initWithObjects:@"Lv70",@"Lv60",@"Lv52",@"Lv50",@"Lv44",@"Lv40",nil];
    
    _arr6 = [[NSArray alloc]initWithObjects:@"Lv85",@"Lv80",@"Lv60",@"Lv54",@"Lv48",nil];
    
    NSArray *beltArr = [[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",@"Lv54",@"Lv52",nil];
    NSArray *ringArr = [[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",@"Lv55",@"Lv52",@"Lv37",nil];
    
    EquipmentModel *Belt =
    [self packageOneTypeWithName:BELT withLevel:beltArr];
    EquipmentModel *Brooch =
    [self packageOneTypeWithName:BROOCH withLevel:_arr5];
    EquipmentModel *Earrings =
    [self packageOneTypeWithName:EARRINGS withLevel:_arr6];
    EquipmentModel *Ring =
    [self packageOneTypeWithName:RING withLevel:ringArr];
    
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
    //_arr8 =[ [NSArray alloc]initWithObjects:@"Lv80", nil];
    
    NSArray *ShieldArr = [[NSArray alloc]initWithObjects:@"Lv80",@"Lv70",@"Lv60",nil];
   
    
    EquipmentModel *Horcruxes =
    [self packageOneTypeWithName:HORCRUXES withLevel:_arr3];
    EquipmentModel *smallShield =
    [self packageOneTypeWithName:SMALL_SHIELD withLevel:ShieldArr];
    EquipmentModel *bigShield =
    [self packageOneTypeWithName:BIG_SHIELD withLevel:ShieldArr];
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
- (NSMutableArray *)Creat90Stone{
    _dataSource = [self package90Stone];
    return _dataSource;
}
#pragma mark -副本、boss-
- (NSMutableArray *)CreatBossDataSource{
    [_dataSource removeAllObjects];
    _arr_area1 = [[NSArray alloc]initWithObjects:@"梵赛诺山顶",@"梵赛诺山腰",@"梵赛诺山脚",@"梵赛诺入口",nil];
    _arr_area2 = [[NSArray alloc]initWithObjects:@"安雯",@"迷雾峰",@"时光的沙漠",@"船之坟墓",nil];
    _arr_area3 = [[NSArray alloc]initWithObjects:@"罗切斯特城主塔",@"奥鲁特城",@"卡塔克",@"魔族根据地",nil];
    _arr_area4 = [[NSArray alloc]initWithObjects:@"艾贝尔",@"尼福尔海姆",nil];
    _arr_area5 = [[NSArray alloc]initWithObjects:@"未知的区域",@"哈伊德",nil];
    
    EquipmentModel *BenChenner = [self packageOneSubAreaWithName:BENCHENNER with:_arr_area1];
    EquipmentModel *Malina = [self packageOneSubAreaWithName:MALINA with:_arr_area2];
    EquipmentModel *Rocheste = [self packageOneSubAreaWithName:ROCHESTE with:_arr_area3];
    EquipmentModel *Colhen = [self packageOneSubAreaWithName:COLHEN with:_arr_area4];
    EquipmentModel *Colhen_Rocheste = [self packageOneSubAreaWithName:COLHENANDROCHESTE with:_arr_area5];
    
    [_dataSource addObject:BenChenner];
    [_dataSource addObject:Malina];
    [_dataSource addObject:Rocheste];
    [_dataSource addObject:Colhen];
    [_dataSource addObject:Colhen_Rocheste];
    
    return _dataSource;
}
#pragma mark -头衔-
- (NSMutableArray *)CreatAllRoleDataSource{
    [_dataSource removeAllObjects];
    _roleTitleArr = [[NSArray alloc]initWithObjects:@"titlelethita",@"titlefiona",
                     @"titleevy",
                     @"titlekarok",@"titlekay",
                     @"titlevella",@"titlelynn",@"titlehurk",
                     @"titlearisha",@"titlehagie",@"titledelia",nil];
    for (NSString *roleStr in _roleTitleArr) {
        NSMutableArray *oneRoleArr = [[NSMutableArray alloc]init];
        oneRoleArr = [self packageOneTitleWithName:roleStr];
        [_dataSource addObject:oneRoleArr];
    }
    return _dataSource;
}
#pragma mark -附魔-
- (NSMutableArray *)CreatEnchantDataSource{
    [_dataSource removeAllObjects];
    _enchantArr = [[NSArray alloc]initWithObjects:@"武器",@"防具",@"首饰",@"副", nil];
    _levelArr = [[NSArray alloc]initWithObjects:@"7级",@"8级",@"9级",@"A级",@"B级",@"C级",@"D级",@"E级",@"F级",nil];
  
       _dataSource = [self packageOneEnchantWithEquipmentName:_enchantArr andLevel:_levelArr];

    return _dataSource;
}


#pragma mark PackageHelper
//装备
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
//90Stione
-(NSMutableArray *)package90Stone{
    [self.database open];
    NSMutableArray *dataSource = [[NSMutableArray alloc]init];
    EquipmentModel *secondOne = [[EquipmentModel alloc]init];
    EquipmentModel *secondTwo = [[EquipmentModel alloc]init];
    secondOne.meunTitle = @"封印";
    secondTwo.meunTitle = @"传承石";

    NSArray *typeArr = [NSArray arrayWithObjects:@"武器封印",@"头手脚封印",@"胸部封印",@"腿部封印",@"巨盾封印",@"小盾封印",nil];
    NSArray *stoneArr = [NSArray arrayWithObjects:@"稳定传承石",@"完美传承石",@"锐利传承石",@"轻盈传承石",@"结实传承石",@"光滑传承石",nil];
    //封印
    for (NSString *typeStr in typeArr) {
        NSString *selecetSQL =
        [NSString stringWithFormat: @"SELECT * FROM equipment where type ='%@'",typeStr];
        FMResultSet *rs = [self.database executeQuery:selecetSQL];
        NSMutableArray *thirdArr = [[NSMutableArray alloc]init];
        while ([rs next]) {
            EquipmentModel *thirdModel = [[EquipmentModel alloc]init];
            thirdModel.title = [rs stringForColumn:@"title"];
            thirdModel.level = [rs stringForColumn:@"type"];  //为了让二级好显示
            thirdModel.role = [rs stringForColumn:@"role"];
            thirdModel.remarks = [rs stringForColumn:@"remarks"];
            [thirdArr addObject:thirdModel];
       }
        [secondOne.nextArray addObject:thirdArr];
    }
    //传承石
    for (NSString *stoneStr in stoneArr) {
        NSString *selecetSQL =
        [NSString stringWithFormat: @"SELECT * FROM equipment where type ='%@'",stoneStr];
        FMResultSet *rs = [self.database executeQuery:selecetSQL];
         NSMutableArray *thirdArr = [[NSMutableArray alloc]init];
        while ([rs next]) {
            EquipmentModel *thirdModel = [[EquipmentModel alloc]init];
            thirdModel.title = [rs stringForColumn:@"title"];
            thirdModel.level = [rs stringForColumn:@"type"];
            thirdModel.role = [rs stringForColumn:@"role"];
            thirdModel.remarks = [rs stringForColumn:@"remarks"];
            [thirdArr addObject:thirdModel];
       }
         [secondTwo.nextArray addObject:thirdArr];
    }
    [dataSource addObject:secondOne];
    [dataSource addObject:secondTwo];
     return dataSource;
}
    
//Boss
- (EquipmentModel *)packageOneSubAreaWithName:(NSString *)areaName with:(NSArray *)SubAreaArr{
    [self.database open];
    
    EquipmentModel *secondModel = [[EquipmentModel alloc]init];
    //tableView的cell.title.text
    secondModel.meunTitle = areaName;
    //每个等级
    for (NSString *SubArea in SubAreaArr) {
        
        NSString *selecetSQL = [NSString stringWithFormat:@"select * from battleslist where area like '%%%@%%'",SubArea];
        FMResultSet *rs =  [self.database executeQuery:selecetSQL];
        
        //每个装备
        NSMutableArray *thirdArray = [[NSMutableArray alloc]init];
        
        while ([rs next]) {
            EquipmentModel *thirdModel = [[EquipmentModel alloc]init];
            thirdModel.titleBossName = [rs stringForColumn:@"title"];
            thirdModel.att = [[rs stringForColumn:@"att"]intValue];
            thirdModel.resist = [rs stringForColumn:@"resist"];
            thirdModel.def = [[rs stringForColumn:@"def"]intValue];
            thirdModel.remarks = [rs stringForColumn:@"remarks"];
            thirdModel.area = [rs stringForColumn:@"area"];
            
            NSArray *array = [thirdModel.area componentsSeparatedByString:@"--"];
            if (array.count == 2) {
                thirdModel.title = array[0];
                thirdModel.title2 = array[1];
            }
            else{
               thirdModel.title = array[1];
               thirdModel.title2 = array[2];
            }
            
            [thirdArray addObject:thirdModel];
        }
        [secondModel.nextArray addObject:thirdArray];
    }
    [self.database close];
    return secondModel;
}

//头衔
- (NSMutableArray *)packageOneTitleWithName:(NSString *)roleName{
    [self.database open];
    NSMutableArray *oneRoleArr = [[NSMutableArray alloc]init];
    NSString *selecetSQL = [NSString stringWithFormat:@"select * from %@ order by _id",roleName];
    FMResultSet *rs = [self.database executeQuery:selecetSQL];
    while ([rs next]) {
        TitleModel *titleMode = [[TitleModel alloc]init];
        titleMode.title = [rs stringForColumn:@"title"];
        titleMode.type = [rs stringForColumn:@"type"];
        titleMode.area = [rs stringForColumn:@"area"];
        titleMode.carbons = [rs stringForColumn:@"carbons"];
        titleMode.carbonf = [rs stringForColumn:@"carbonf"];
        titleMode.channel = [rs stringForColumn:@"channel"];
        titleMode.liliang = [rs stringForColumn:@"liliang"];
        titleMode.minjie = [rs stringForColumn:@"minjie"];
        titleMode.zhili = [rs stringForColumn:@"zhili"];
        titleMode.yizhi = [rs stringForColumn:@"yizhi"];
        titleMode.remark = [rs stringForColumn:@"remarks"];
        
        if (titleMode.liliang == nil) {
            titleMode.liliang = @"";
        }
        if (titleMode.minjie == nil) {
            titleMode.minjie = @"";
        }
        if (titleMode.zhili == nil) {
            titleMode.zhili = @"";
        }
        if (titleMode.yizhi == nil) {
            titleMode.yizhi = @"";
        }
        if (titleMode.shengmingzhi == nil) {
            titleMode.shengmingzhi = @"";
        }
        [oneRoleArr addObject:titleMode];
    }
    [self.database close];
    return oneRoleArr;
}
//附魔
- (NSMutableArray *)packageOneEnchantWithEquipmentName:(NSArray *)equipmentName andLevel:(NSArray *)level{
    [self.database open];
    NSMutableArray *dataSource = [[NSMutableArray alloc]init];
    
    for (NSString *equipmentStr in equipmentName) {
        NSMutableArray *oneEnchantArr = [[NSMutableArray alloc]init];
        NSString *selecetSQL =
        [NSString stringWithFormat:@"select * from enchant where part ='%@'",equipmentStr];
        FMResultSet *rs = [self.database executeQuery:selecetSQL];
        while ([rs next]) {
            
            TitleModel *titleMode = [[TitleModel alloc]init];
            
            titleMode.title = [rs stringForColumn:@"title"];
            titleMode.style = [rs stringForColumn:@"style"];
            titleMode.customattribute = [rs stringForColumn:@"customattribute"];
            titleMode.customprovenance = [rs stringForColumn:@"customprovenance"];
            titleMode.custompart = [rs stringForColumn:@"custompart"];
            titleMode.level_enchant = [rs stringForColumn:@"level"];
            titleMode.part = [rs stringForColumn:@"part"];
            titleMode.att = [rs stringForColumn:@"att"];
            titleMode.mint = [rs stringForColumn:@"mint"];
            titleMode.agi = [rs stringForColumn:@"agi"];
            titleMode.wil = [rs stringForColumn:@"wil"];
            titleMode.critresist = [rs stringForColumn:@"part"];
            titleMode.del = [rs stringForColumn:@"att"];
            titleMode.mint = [rs stringForColumn:@"mint"];
            titleMode.sta = [rs stringForColumn:@"agi"];
            titleMode.simulation = [rs stringForColumn:@"simulation"];
            
            [oneEnchantArr addObject:titleMode];
        }
        [dataSource addObject:oneEnchantArr];
    }
    
    for (NSString *levelStr in level) {
        NSMutableArray *oneEnchantArr = [[NSMutableArray alloc]init];
        NSString *selecetSQL =
        [NSString stringWithFormat:@"select * from enchant where level ='%@'",levelStr];
        FMResultSet *rs = [self.database executeQuery:selecetSQL];
        while ([rs next]) {
            
            TitleModel *titleMode = [[TitleModel alloc]init];
            
            titleMode.title = [rs stringForColumn:@"title"];
            titleMode.style = [rs stringForColumn:@"style"];
            titleMode.customattribute = [rs stringForColumn:@"customattribute"];
            titleMode.customprovenance = [rs stringForColumn:@"customprovenance"];
            titleMode.custompart = [rs stringForColumn:@"custompart"];
            titleMode.level_enchant = [rs stringForColumn:@"level"];
            titleMode.part = [rs stringForColumn:@"part"];
            titleMode.att = [rs stringForColumn:@"att"];
            titleMode.mint = [rs stringForColumn:@"mint"];
            titleMode.agi = [rs stringForColumn:@"agi"];
            titleMode.wil = [rs stringForColumn:@"wil"];
            titleMode.critresist = [rs stringForColumn:@"part"];
            titleMode.del = [rs stringForColumn:@"att"];
            titleMode.mint = [rs stringForColumn:@"mint"];
            titleMode.sta = [rs stringForColumn:@"agi"];
            titleMode.simulation = [rs stringForColumn:@"simulation"];
            
            [oneEnchantArr addObject:titleMode];
        }
        [dataSource addObject:oneEnchantArr];
    }
    [self.database close];
    return dataSource;
}






@end
