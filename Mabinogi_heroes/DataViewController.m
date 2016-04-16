//
//  DataViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()


@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}

@end
