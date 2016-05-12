//
//  MultLevelMeun.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "MultLevelMeun.h"


#import "RightCellCollectionViewCell.h"
#import "RightHeadView.h"
#import "LeftCell.h"
#import "tapEquipmentView.h"
#import "tapBossView.h"

#import "EquipmentModel.h"
#import "Masonry.h"
#import "UIColor+HexString.h"


#define KleftWidth 80
#define kRightCell @"RightCellCollectionViewCell"

@interface MultLevelMeun()

@property(strong,nonatomic)UITableView *leftTable;
@property(strong,nonatomic)UICollectionView *rightCollection;
@property(strong,nonatomic)tapEquipmentView *popview;
@property(strong,nonatomic)UITapGestureRecognizer* closeTap;

@end
@implementation MultLevelMeun

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame WithLeftData:(NSArray*)allData withType:(NSString *)type withSelecetIndex:(void(^)(NSInteger left,NSInteger right,id info))selectIndexBlock
{
    _type = type;
    
    if (self == [super initWithFrame:frame]) {
        if (allData.count == 0) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            view.backgroundColor = [UIColor grayColor];
            UILabel *tip = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/2-20 , frame.size.height/2 - 20, 150, 100)];
            tip.text = @"请长按屏幕～";
            tip.textColor = [UIColor whiteColor];
            tip.textAlignment = NSTextAlignmentCenter;
            tip.font = [UIFont fontWithName:FONT_DEFAULT_BOLD size:17];
            tip.numberOfLines = 2;
            [view addSubview:tip];
            [self addSubview:view];
            return self;
        }
        _dataSource = allData;
        _block = selectIndexBlock;
 //左边的视图
        self.leftTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KleftWidth, frame.size.height)];
        self.leftTable.delegate = self;
        self.leftTable.dataSource = self;
        self.leftTable.backgroundColor = COLOR_LEFTTABLE_BACKGROUD;
        
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
            self.rightCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(KleftWidth + leftMargin, 0, WIDTH_SCREEN - KleftWidth - leftMargin*2, frame.size.height) collectionViewLayout:flowLayout];
            self.rightCollection.delegate = self;
            self.rightCollection.dataSource = self;
        
            //注册右边的xib
            [self.rightCollection registerNib:[UINib nibWithNibName:kRightCell bundle:nil] forCellWithReuseIdentifier:kRightCell];
            [self.rightCollection registerNib:[UINib nibWithNibName:@"RightHeadView"  bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RightHeadView"];
            
            [self addSubview:self.rightCollection];
            
            self.rightCollection.backgroundColor = [UIColor whiteColor] ;
        
//          UIImageView *bgImage = [[UIImageView alloc]init];
//          bgImage.image = [UIImage imageNamed:@"tier_bg"];
//          bgImage.alpha = 0.2;
//          [self.rightCollection addSubview:bgImage];
//          [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
//              make.top.equalTo(self.rightCollection.mas_top);
//              make.left.equalTo(self.rightCollection.mas_left);
//              make.right.equalTo(self.rightCollection.mas_right);
//              make.bottom.equalTo(self.rightCollection.mas_bottom);
//          }];
        
            //self.backgroundColor = ;
        
 //popview 1
        _popview = [[NSBundle mainBundle]loadNibNamed:@"tapEquipmentView" owner:nil options:nil][0];
        _popview.backgroundColor = [UIColor whiteColor];
        _popview.layer.shadowOffset = CGSizeMake(2, 2);
        _popview.layer.shadowColor = [[UIColor redColor]CGColor];
        _popview.layer.shadowOpacity = 0.5;
        _popview.layer.cornerRadius = 2 ;
        _popview.layer.shadowRadius= 8;
        _closeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closePop:)];
 //popview 2
        _popview = [[NSBundle mainBundle]loadNibNamed:@"tapEquipmentView" owner:nil options:nil][0];
        _popview.backgroundColor = [UIColor whiteColor];
        _popview.layer.shadowOffset = CGSizeMake(2, 2);
        _popview.layer.shadowColor = [[UIColor redColor]CGColor];
        _popview.layer.shadowOpacity = 0.5;
        _popview.layer.cornerRadius = 2 ;
        _popview.layer.shadowRadius= 8;
        _closeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closePop:)];
        
    }
    return self;
}
-(void)setNeedToScorllerIndex:(NSInteger)needToScorllerIndex{
    if (needToScorllerIndex>=0) {
        [self.leftTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:needToScorllerIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        LeftCell * cell=(LeftCell*)[self.leftTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:needToScorllerIndex inSection:0]];
        cell.title.textColor=[UIColor redColor];
        cell.backgroundColor=[UIColor whiteColor];
        _selectIndex=needToScorllerIndex;
        [self.rightCollection reloadData];        
    }
    _needToScorllerIndex=needToScorllerIndex;
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
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCell"];
    cell.selectionStyle = UITableViewCellAccessoryNone;
    cell.title.text = [_dataSource[indexPath.row] meunTitle];
    cell.title.numberOfLines = 2;
    cell.title.textColor=[UIColor blackColor];
    cell.backgroundColor = COLOR_LEFTTABLE_BACKGROUD;
    
    
    return cell;
    
}
//cell的点击，记录selectIndex(indexPath.row)
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftCell *cell = (LeftCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.title.textColor = [UIColor redColor];
    cell.backgroundColor = [UIColor whiteColor];
    
    _selectIndex = indexPath.row;
    
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [self.rightCollection reloadData];
    
}
//切换cell时 颜色回调
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftCell *cell = (LeftCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.title.textColor = [UIColor blackColor];
    cell.backgroundColor = COLOR_LEFTTABLE_BACKGROUD;
    cell.title.textColor=[UIColor blackColor];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
#pragma mark---右边的collection 代理
#pragma mark--deleagte
#pragma mark 二级目录数量设置
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return [[_dataSource[_selectIndex]nextArray]count];
}
#pragma mark 三级目录数量设置
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[_dataSource[_selectIndex]nextArray][section]count];
    
}
//点击方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    id model;//在此封装选中装备的数据模型
    void (^select)(NSInteger left,NSInteger right,id model);
    select = self.block;
    select(self.selectIndex,indexPath.row,model);
    //show popview
#pragma Popview Setting
    if ([_type isEqualToString:@"Equipment"]) {
        EquipmentModel *eqModel = [_dataSource[_selectIndex]nextArray][indexPath.section][indexPath.row];
        _popview.title.text = eqModel.title;
        _popview.level.text = eqModel.level;
        _popview.bal.text = [NSString stringWithFormat:@"平衡:%ld",eqModel.bal];
        _popview.attspd.text = [NSString stringWithFormat:@"攻速:%ld",eqModel.attspd];
        _popview.critical.text = [NSString stringWithFormat:@"暴击:%ld",eqModel.critical];
        _popview.att.text = [NSString stringWithFormat:@"攻击力:%ld",eqModel.att];
        
        _popview.str.text = [NSString stringWithFormat:@"力量:%ld",eqModel.str];
        _popview.mint.text = [NSString stringWithFormat:@"智力:%ld",eqModel.mint];
        _popview.agi.text = [NSString stringWithFormat:@"敏捷:%ld",eqModel.agi];
        _popview.wil.text = [NSString stringWithFormat:@"意志:%ld",eqModel.wil];
        _popview.mint.text = [NSString stringWithFormat:@"智力:%ld",eqModel.mint];
        _popview.critresist.text = [NSString stringWithFormat:@"暴抗:%ld",eqModel.critresist];
        _popview.shengmingzhi.text = [NSString stringWithFormat:@"血量:%ld",eqModel.shengmingzhi];
        _popview.sta.text = [NSString stringWithFormat:@"敏捷:%ld",eqModel.sta];
        _popview.def.text = [NSString stringWithFormat:@"防御:%ld",eqModel.def];
        _popview.role.text = [NSString stringWithFormat:@"%@",eqModel.role];
        
        [self addSubview:_popview];
        [_popview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).with.offset(10);
            make.centerY.equalTo(self.mas_centerY).with.offset(-50);
            make.width.equalTo(@250);
            make.height.equalTo(@400);
        }];
        _popview.alpha = 0;
        [UIView animateWithDuration:0.35 animations:^{
            _popview.alpha = 1;
        }];
        [self addGestureRecognizer:_closeTap];
    }
    else if ([_type isEqualToString:@"Boss"]){
        
    }
   

}
//cell
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RightCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCellCollectionViewCell" forIndexPath:indexPath];
    //根据 selectIndex(tableview.indexpath.row)确认对应的section
    _selectIndex_right = indexPath.section;
    EquipmentModel *someoneThird = [[EquipmentModel alloc]init];
    someoneThird = [_dataSource[_selectIndex]nextArray][indexPath.section][0];
    if ([someoneThird.level isEqualToString:@""]) {
        cell.title.text = [[_dataSource[_selectIndex]nextArray][indexPath.section][indexPath.row]title2];
    }
    else{
        cell.title.text = [[_dataSource[_selectIndex]nextArray][indexPath.section][indexPath.row]title];
    }
    cell.backgroundColor = [UIColor clearColor];
    
    if ([_type isEqualToString:@"Equipment"]) {
        cell.image.backgroundColor= COLOR_LEFTTABLE_CELL_IMAGE_BACKGROUD;
        [cell.image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",cell.title.text]]];
    }
  
    
    return cell;
}
//二级目录headView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"RightHeadView" forIndexPath:indexPath];
    
    UILabel *title = (UILabel*)[view viewWithTag:1];
    EquipmentModel *someoneThird = [[EquipmentModel alloc]init];
    someoneThird = [_dataSource[_selectIndex]nextArray][indexPath.section][0];
    title.text = someoneThird.level;
    if ([someoneThird.level isEqualToString:@""]) {
        title.text = someoneThird.title;
    }
    
    
    return view;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(75, 100);
}
////定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
//头视图参考大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={WIDTH_SCREEN,35};
    return size;
}

#pragma mark 手势
-(void)closePop:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.3 animations:^{
        _popview.alpha = 0;
    } completion:^(BOOL finished) {
        [_popview removeFromSuperview];
        [self removeGestureRecognizer:tap];
    }];
}
@end
