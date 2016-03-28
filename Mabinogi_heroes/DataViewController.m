//
//  DataViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "DataViewController.h"
#import "Header.h"

@interface DataViewController ()

@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *searchView;


@end

@implementation DataViewController
@synthesize headView,searchView;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
    [self initsearchView];

    
    

    
}

#pragma mark 设置搜索栏样式
-(void)initsearchView
{
    searchView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0]);
    searchView.layer.borderWidth = 1.0;
    searchView.layer.masksToBounds = YES;
    searchView.layer.cornerRadius = 3.0;
    searchView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchEvent:)];
    [searchView addGestureRecognizer:tapGesture];
}


#pragma mark 搜索方法
-(void)searchEvent:(UITapGestureRecognizer *)gesture{
    
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
