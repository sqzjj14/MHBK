//
//  EquipmentViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/28.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "EquipmentViewController.h"
#import "Header.h"

@interface EquipmentViewController ()

@end

@implementation EquipmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:WEAPON]) {
        [segue.destinationViewController setValue:WEAPON forKey:@"type"];
    }
    else if ([segue.identifier isEqualToString:ARMOR]){
        [segue.destinationViewController setValue:ARMOR forKey:@"type"];
    }
    else if ([segue.identifier isEqualToString:JEWELRY]){
        [segue.destinationViewController setValue:JEWELRY forKey:@"type"];
    }
    else if ([segue.identifier isEqualToString:OTHER]){
        [segue.destinationViewController setValue:OTHER forKey:@"type"];
    }
}


@end
