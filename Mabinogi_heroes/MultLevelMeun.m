//
//  MultLevelMeun.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "MultLevelMeun.h"
#import "Header.h"
#import "RightCellCollectionViewCell.h"
#import "RightHeadView.h"
#import "LeftCell.h"

#define KleftWidth 100

@interface MultLevelMeun()

@property(strong,nonatomic)UITableView *leftTable;
@property(strong,nonatomic)UICollectionView *rightCollection;

@end
@implementation MultLevelMeun

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame WithAllData:(NSArray *)alldata withSelecetIndex:(void (^)(NSInteger, NSInteger, id))selectIndexBlock
{
    if (self == [super initWithFrame:frame]) {
        if (alldata.count == 0) {
            return nil;
        }
        
        _block = selectIndexBlock;
 //左边的视图
        self.leftTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KleftWidth, frame.size.height)];
        self.leftTable.delegate = self;
        self.leftTable.dataSource = self;
        
        self.leftTable.tableFooterView = [[UIView alloc]init];
        [self addSubview:self.leftTable];
        
        //self.leftTable.backgroundColor = ;
        // 设置cell底部描线与左侧的间距 （设置为0）
        if ([self.leftTable respondsToSelector:@selector(setLayoutMargins:)]) {
            self.leftTable.layoutMargins=UIEdgeInsetsZero;
        }
        if ([self.leftTable respondsToSelector:@selector(setSeparatorInset:)]) {
            self.leftTable.separatorInset=UIEdgeInsetsZero;
        }
        //注册左xib
        [self.leftTable registerNib:[UINib nibWithNibName:@"LeftCell" bundle:nil] forCellReuseIdentifier:@"LeftCell"];
            
 //右边的视图
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumInteritemSpacing = 0.f; //左右间距
            flowLayout.minimumLineSpacing = 0.f; //行间距
            
            float leftMargin =0; //距离左table的间距
            self.rightCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(KleftWidth + leftMargin, 0, kScreenWidth - KleftWidth - leftMargin*2, frame.size.height) collectionViewLayout:flowLayout];
            self.rightCollection.delegate = self;
            self.rightCollection.dataSource = self;
        
            //注册右边的xib
            [self.rightCollection registerNib:[UINib nibWithNibName:@"RightCell" bundle:nil] forCellWithReuseIdentifier:@"RightCell"];
            [self.rightCollection registerNib:[UINib nibWithNibName:@"RightHeadView"  bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RightHeadView"];
            
            [self addSubview:self.rightCollection];
            
            //self.rightCollection.backgroundColor = ;
            
            //self.backgroundColor = ;
    }
    return self;
}

-(void)reloadData
{
    [self.leftTable reloadData];
    [self.rightCollection reloadData];
}
#pragma mark---左边的tablew 代理
#pragma mark--deleagte
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.allData.count;
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCell"];
    //cell.selectionStyle = UITableViewCellAccessoryNone;
    cell.title.text = @"一级目录";
    cell.title.numberOfLines = 2;
    
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//cell的点击，记录selectIndex(indexPath.row)
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftCell *cell = (LeftCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.title.textColor = [UIColor redColor];
    //cell.backgroundColor = ;
    
    _selectIndex = indexPath.row;
    
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [self.rightCollection reloadData];
    
}
//切换cell时 颜色回调
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftCell *cell = (LeftCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.title.textColor = [UIColor whiteColor];
    //cell.backgroundColor = ;
}

#pragma mark---右边的tablew 代理
#pragma mark--deleagte
#pragma mark 二级目录数量设置
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
#pragma mark 三级目录数量设置
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
//点击方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    id model;//在此封装选中装备的数据模型
    void (^select)(NSInteger left,NSInteger right,id model);
    select = self.block;
    select(self.selectIndex,indexPath.row,model);

}
//cell
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RightCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCellCollectionViewCell" forIndexPath:indexPath];
    //根据 selectIndex(tableview.indexpath.row)确认对应的section
    cell.title.text = @"无尽双剑";
    cell.backgroundColor = [UIColor clearColor];
   // cell.image setImage:[UIImage imageNamed:];
    
    return cell;
}
//二级目录headView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        <#statements#>
    }
}
@end
