//
//  DIYHomeViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/6/7.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DIYHomeViewController.h"
#import "DIYBasicViewController.h"

@interface DIYHomeViewController ()

@end

@implementation DIYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)StartDIY:(id)sender {
    DIYBasicViewController *vc = [[DIYBasicViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)MyDIY:(id)sender {
}
@end
