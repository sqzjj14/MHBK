//
//  MainTabbarViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "MainTabbarViewController.h"

@interface MainTabbarViewController ()

@end

@implementation MainTabbarViewController
{
    UITabBarItem *homeItem;
    UITabBarItem *dataItem;
    UITabBarItem *communityItem;
    UITabBarItem *mySelfItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBar *tabBar = self.tabBar;
    
    //首页
    homeItem = [tabBar.items objectAtIndex:0];
    [homeItem setImage:[[UIImage imageNamed:@"lynn_normol.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [homeItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
    [homeItem setSelectedImage:[[UIImage imageNamed:@"lynn_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeItem.title = nil;
    
    //数据
    dataItem = [tabBar.items objectAtIndex:1];
    [dataItem setImage:[[UIImage imageNamed:@"维拉非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [dataItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
    [dataItem setSelectedImage:[[UIImage imageNamed:@"维拉非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    dataItem.title = nil;
    
    //社区
    communityItem = [tabBar.items objectAtIndex:2];
    [communityItem setImage:[[UIImage imageNamed:@"伊菲非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [communityItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
    [communityItem setSelectedImage:[[UIImage imageNamed:@"伊菲非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    communityItem.title = nil;
    
    //我的
    mySelfItem = [tabBar.items objectAtIndex:3];
    [mySelfItem setImage:[[UIImage imageNamed:@"女妖非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [mySelfItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
    [mySelfItem setSelectedImage:[[UIImage imageNamed:@"女妖非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mySelfItem.title = nil;
    
    //背景颜色
    tabBar.backgroundColor = [UIColor redColor];
    tabBar.alpha = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
