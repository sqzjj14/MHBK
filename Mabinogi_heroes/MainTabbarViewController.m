//
//  MainTabbarViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "CNPGridMenu.h"

@interface MainTabbarViewController ()<UITabBarControllerDelegate>

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
    
    self.delegate = self;
//    
//    //首页
//    homeItem = [tabBar.items objectAtIndex:0];
//    [homeItem setImage:[[UIImage imageNamed:@"lynn_normol.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [homeItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
//    [homeItem setSelectedImage:[[UIImage imageNamed:@"lynn_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    homeItem.title = nil;
//    
//    //数据
//    dataItem = [tabBar.items objectAtIndex:1];
//    [dataItem setImage:[[UIImage imageNamed:@"维拉非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [dataItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
//    [dataItem setSelectedImage:[[UIImage imageNamed:@"维拉非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    dataItem.title = nil;
//    
//    //社区
//    communityItem = [tabBar.items objectAtIndex:2];
//    [communityItem setImage:[[UIImage imageNamed:@"伊菲非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [communityItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
//    [communityItem setSelectedImage:[[UIImage imageNamed:@"伊菲非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    communityItem.title = nil;
//    
//    //我的
//    mySelfItem = [tabBar.items objectAtIndex:3];
//    [mySelfItem setImage:[[UIImage imageNamed:@"女妖非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [mySelfItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
//    [mySelfItem setSelectedImage:[[UIImage imageNamed:@"女妖非选中.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    mySelfItem.title = nil;
    
    //背景颜色
//    tabBar.backgroundColor = [UIColor redColor];
//    tabBar.alpha = 1;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (viewController == self.viewControllers[0] || viewController == self.viewControllers[2]) {
        [self.viewControllers[1] dismissGridMenuAnimated:YES completion:nil];
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //self.hidesBottomBarWhenPushed =YES;
}

@end
