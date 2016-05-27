//
//  DataViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DataViewController.h"
#import "CNPGridMenu.h"
#import "UMCommunity.h"

@interface DataViewController ()<CNPGridMenuDelegate>
@property (nonatomic, strong) CNPGridMenu *gridMenu;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)showMenu:(id)sender {
    
    CNPGridMenuItem *laterToday = [[CNPGridMenuItem alloc] init];
    laterToday.icon = [UIImage imageNamed:@"LaterToday"];
    laterToday.title = @"装备";
    
    CNPGridMenuItem *thisEvening = [[CNPGridMenuItem alloc] init];
    thisEvening.icon = [UIImage imageNamed:@"ThisEvening"];
    thisEvening.title = @"副本";
    
    CNPGridMenuItem *tomorrow = [[CNPGridMenuItem alloc] init];
     tomorrow.icon = [UIImage imageNamed:@"Tomorrow"];
    tomorrow.title = @"头衔";
    
    CNPGridMenuItem *thisWeekend = [[CNPGridMenuItem alloc] init];
    thisWeekend.icon = [UIImage imageNamed:@"ThisWeekend"];
    thisWeekend.title = @"附魔";
    
    CNPGridMenuItem *nextWeek = [[CNPGridMenuItem alloc] init];
    nextWeek.icon = [UIImage imageNamed:@"NextWeek"];
    nextWeek.title = @"社区";
    
    CNPGridMenuItem *inAMonth = [[CNPGridMenuItem alloc] init];
    inAMonth.icon = [UIImage imageNamed:@"InMonth"];
    inAMonth.title = @"模型尺寸";
    
    CNPGridMenuItem *someday = [[CNPGridMenuItem alloc] init];
    someday.icon = [UIImage imageNamed:@"Someday"];
    someday.title = @"角色技能";
    
    CNPGridMenuItem *desktop = [[CNPGridMenuItem alloc] init];
    desktop.icon = [UIImage imageNamed:@"Desktop"];
    desktop.title = @"模拟配装";
    
    CNPGridMenuItem *pickDate = [[CNPGridMenuItem alloc] init];
    pickDate.icon = [UIImage imageNamed:@"PickDate"];
    pickDate.title = @"Pick Date";
    
    CNPGridMenu *gridMenu = [[CNPGridMenu alloc] initWithMenuItems:@[laterToday, thisEvening, tomorrow, thisWeekend,nextWeek,inAMonth]];
    gridMenu.delegate = self;
    [self presentGridMenu:gridMenu animated:YES completion:^{
        NSLog(@"Grid Menu Presented");
    }];
    
}



- (void)gridMenuDidTapOnBackground:(CNPGridMenu *)menu {
    [self dismissGridMenuAnimated:YES completion:^{
    }];
}

- (void)gridMenu:(CNPGridMenu *)menu didTapOnItem:(CNPGridMenuItem *)item {
    if ([item.title isEqualToString:@"装备"]) {
        [self dismissGridMenuAnimated:YES completion:^{
        }];
        UIViewController *vc = [[EquipmentChartViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([item.title isEqualToString:@"副本"]) {
        [self dismissGridMenuAnimated:YES completion:^{
        }];
        UIViewController *vc = [[BOSSViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([item.title isEqualToString:@"头衔"]) {
        [self dismissGridMenuAnimated:YES completion:^{
        }];
        UIViewController *vc = (UIViewController*)[[Title3ViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
       
    }
    if ([item.title isEqualToString:@"附魔"]) {
        [self dismissGridMenuAnimated:YES completion:^{
        }];
        UIViewController *vc = [[EnchantViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([item.title isEqualToString:@"社区"]) {
        [self dismissGridMenuAnimated:YES completion:^{
        }];
        UINavigationController *communityViewController = [UMCommunity getFeedsModalViewController];
        [self presentModalViewController:communityViewController animated:YES];
    }
    if ([item.title isEqualToString:@"模型尺寸"]) {
        [self dismissGridMenuAnimated:YES completion:^{
        }];
        UIViewController *vc = [[SizeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}

@end
