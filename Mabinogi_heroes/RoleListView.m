//
//  RoleListView.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/6/7.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "RoleListView.h"


@interface RoleListView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableW;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
@implementation RoleListView

-(UIView*)initRoleListWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1  alpha:0.5];
        _dataSource = [[NSMutableArray alloc]init];
        _tableW = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _tableW.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1  alpha:0.5];
        [_tableW registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableW.delegate = self;
        _tableW.dataSource = self;
        [self addSubview:_tableW];
        
        [_dataSource addObject:@"物理职业"];
        [_dataSource addObject:@"伊菲"];
        [_dataSource addObject:@"艾莉莎"];
        [_dataSource addObject:@"海基"];
        
    }

    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _dataSource[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Role" object:_dataSource[indexPath.row] userInfo:nil];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30.f;
}
@end
