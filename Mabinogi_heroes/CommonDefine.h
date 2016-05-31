//
//  CommonDefine.h
//  Mabinogi_heroes
//
//  Created by Kuntanury on 16/4/16.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#pragma mark ---------- URL ----------
/******************************* URL */

#define URL_NEWS @"http://mp.weixin.qq.com/mp/homepage?__biz=MzA5ODI2Mjg0MA==&hid=1&sn=a4e81e969787d2d1cfff601c23658594#wechat_redirect"

#pragma mark ---------- COLOR ----------
/******************************* COLOR */

#define RGB(a, b, c, d) [UIColor colorWithRed:(a)/255.f green:(b)/255.f blue:(c)/255.f alpha:(d)]

#define COLOR_BLACK RGB(0x00, 0x00, 0x00, 1) //黑
#define COLOR_WHITE RGB(0xff, 0xff, 0xff, 1) //白

#define COLOR_BATTLENET RGB(0x2c, 0x33, 0x45, 1) //暴雪战网色
#define COLOR_BATTLENET_LOADING RGB(0x2c, 0x33, 0x45, 0.3) //暴雪战网色加载条

#define COLOR_NAVIBAR_BACKGROUD RGB(0xff, 0x63, 0x47, 1) //


#define COLOR_LEFTTABLE_BACKGROUD RGB(0xf3, 0xf4, 0xf6, 1) //leftTable.backgroundColor
#define COLOR_LEFTTABLE_CELL_IMAGE_BACKGROUD RGB(0xe0, 0xff, 0xff, 1) //cell.image.backgroundColor

#pragma mark ---------- SYSTEM ----------
/******************************* SYSTEM */

#define WIDTH_APP [UIScreen mainScreen].applicationFrame.size.width
#define WIDTH_SCREEN [[UIScreen mainScreen] bounds].size.width

#define HEIGHT_APP [UIScreen mainScreen].applicationFrame.size.height
#define HEIGHT_SCREEN [[UIScreen mainScreen] bounds].size.height

#define FONT_DEFAULT @"Helvetica Neue"
#define FONT_DEFAULT_BOLD @"Helvetica Bold"

#pragma mark ---------- KEY ----------
/******************************* KEY */

#define WEAPON @"weapon"
#define ARMOR @"armor"
#define JEWELRY @"jewelry"
#define OTHER @"other"

#pragma mark ---------- WEAPON ----------
/******************************* WEAPON */

#define DOUBLE_SWORD @"双剑"
#define DOUBLE_SPEAR @"双枪"

#define SINGLE_SWORD @"单手剑"
#define SINGLE_HAMMER @"单手锤"

#define SCYTHE @"战镰"
#define STAVE @"法杖"

#define PILLAR @"战柱"
#define CESTUS @"拳炮"

#define ARCH @"弓"
#define GUN @"十字枪"

#define CHAIN @"链刃"
#define PERTUISANE @"枪戟"
#define GREAT_SWORD @"巨剑"
#define MAGIC_SWORD @"魔刃"
#define GHOST_SWORD @"幽灵短剑"
#define CLAYMORE @"大剑"

#pragma mark ---------- EQUIMENT ----------
/******************************* EQUIMENT */

#define THEHEAD @"头部"
#define CHEST @"胸部"
#define LEG @"腿部"
#define HAND @"手部"
#define FOOT @"脚部"

#define BELT @"腰带"
#define BROOCH @"胸针"
#define EARRINGS @"耳环"
#define RING @"戒指"

#define SMALL_SHIELD @"小盾"
#define BIG_SHIELD @"巨盾"
#define MAGIC_BOOK @"魔法书"
#define HORCRUXES @"魂器"
#define CRAFT @"工艺品"

#pragma mark ---------- SOC ----------
/******************************* SOC */

#define BENCHENNER @"梵赛诺"
#define MALINA @"莫勒班"
#define COLHEN @"库汉"
#define ROCHESTE @"罗切斯特"
#define COLHENANDROCHESTE @"库汉&罗切斯特"

#pragma mark ---------- CHARACTER ----------
/******************************* CHARACTER */

#define LANN @"利斯塔"
#define FIONA @"菲欧纳"
#define EVY @"伊菲"
#define KAROK @"卡鲁"
#define KAY @"凯伊"
#define VELLA @"维拉"
#define LYNN @"琳"
#define HURK @"霍克"
#define ARISHA @"艾莉莎"
#define HAGIE @"海基"
#define DELIA @"黛莉娅"


#endif /* CommonDefine_h */
