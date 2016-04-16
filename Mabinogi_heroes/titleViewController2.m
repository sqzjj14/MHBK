//
//  titleViewController2.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/8.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "titleViewController2.h"
#import "TWSpringyFlowLayout.h"
#import "TWMessageViewCell.h"
#import "TitleModel.h"

#import "DatabaseManager.h"

#define kTWMessageViewCell @"TWMessageViewCell"

// Numerics
CGFloat const kTWMessageViewControllerCellPadding = 10;
CGFloat const kTWMessageViewControllerCellHeight = 50;


@interface titleViewController2 ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UIButton *bottomBtn;
@property LIVBubbleMenu* bubbleMenu;
@property NSArray* images;
@property CGFloat radius;
//云collection
@property (nonatomic,strong)UICollectionView *_collectionView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *allData;

@end

@implementation titleViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBottomBtn];
    [self initCollectionView];
    _allData = [[DatabaseManager mabinogiHelper]CreatAllRoleDataSource];//总数据源
    _dataSource = [[NSMutableArray alloc]init];//collection数据源
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initBottomBtn{
    _radius = 30;//半径
    _bottomBtn = [UIButton buttonWithType:0];
    _bottomBtn.frame = CGRectMake(WIDTH_SCREEN/2 - _radius, HEIGHT_SCREEN - 65, 60, 60);
    [_bottomBtn setImage:[UIImage imageNamed:@"女妖"] forState:UIControlStateNormal];
    _bottomBtn.layer.masksToBounds = YES;
    _bottomBtn.layer.cornerRadius = _radius;
    _bottomBtn.layer.borderWidth = 2.f;
    _bottomBtn.layer.borderColor = [[UIColor colorWithWhite:1.0 alpha:0.5]CGColor];
    [_bottomBtn addTarget:self action:@selector(pickRole:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bottomBtn];
    
    
    _images = [NSArray arrayWithObjects:
               [UIImage imageNamed:@"利斯塔"],
               [UIImage imageNamed:@"confused"],
               [UIImage imageNamed:@"cool"],
               [UIImage imageNamed:@"grin"],
               [UIImage imageNamed:@"happy"],
               [UIImage imageNamed:@"neutral"],
               [UIImage imageNamed:@"sad"],
               [UIImage imageNamed:@"shocked"],
               [UIImage imageNamed:@"smile"],
               [UIImage imageNamed:@"tongue"],
               [UIImage imageNamed:@"wink"],
               [UIImage imageNamed:@"wondering"],
               nil];
}

- (void)initCollectionView{
    self.navigationItem.title = @"头衔";
    
    __collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN) collectionViewLayout:[[TWSpringyFlowLayout alloc]init]];
    // Background
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"messages_bg_2.png"]];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view insertSubview:backgroundImageView belowSubview:__collectionView];
    
    // Parallax effect
    UIInterpolatingMotionEffect *interpolationHorizontal = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    interpolationHorizontal.minimumRelativeValue = @-20.0;
    interpolationHorizontal.maximumRelativeValue = @20.0;
    
    UIInterpolatingMotionEffect *interpolationVertical = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    interpolationVertical.minimumRelativeValue = @-20.0;
    interpolationVertical.maximumRelativeValue = @20.0;
    
    [backgroundImageView addMotionEffect:interpolationHorizontal];
    [backgroundImageView addMotionEffect:interpolationVertical];
    
    __collectionView.backgroundColor = [UIColor clearColor];
     [__collectionView registerNib:[UINib nibWithNibName:kTWMessageViewCell bundle:nil] forCellWithReuseIdentifier:kTWMessageViewCell];
    [self.view addSubview:__collectionView];
    [self.view bringSubviewToFront:_bottomBtn];
    __collectionView.delegate = self;
    __collectionView.dataSource = self;
    
}
#pragma mark - UICollectionView DataSource & Delegate methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_dataSource == nil || _dataSource.count == 0) {
        return 0;
    }
    return _dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TWMessageViewCell *cell = (TWMessageViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kTWMessageViewCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    TitleModel *titlemodel = _dataSource[indexPath.row];
    cell.title.text = titlemodel.title;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(WIDTH_SCREEN - (kTWMessageViewControllerCellPadding*2), kTWMessageViewControllerCellHeight);
}

- (void)pickRole:(UIButton *)btn{
    
    [UIView animateWithDuration:0.5 animations:^{
        _bottomBtn.frame = CGRectMake(WIDTH_SCREEN/2 - _radius, HEIGHT_SCREEN/2-_radius, 2*_radius+15, 2*_radius+15);
       // _bottomBtn.layer.cornerRadius = (_radius+15) / 2.f;
    }];
    
    
    NSRange range;
    range.location = 0;
    range.length = 11;
    _bubbleMenu = [[LIVBubbleMenu alloc] initWithPoint:self.bottomBtn.center radius:150 menuItems:[_images subarrayWithRange:range] inView:self.view];
    _bubbleMenu.delegate = self;
    _bubbleMenu.easyButtons = YES;
    _bubbleMenu.bubbleStartAngle = 180.0f;
    _bubbleMenu.bubbleTotalAngle = 360.f;
    [_bubbleMenu show];
}
#pragma mark - Delegates

-(void)livBubbleMenu:(LIVBubbleMenu *)bubbleMenu tappedBubbleWithIndex:(NSUInteger)index {
    
    switch (index) {
        case 0:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 1:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 2:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 3:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 4:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 5:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 6:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 7:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 8:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 9:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
        case 10:
            [_bottomBtn setImage:_images[index] forState:0];
            _dataSource = _allData[index];
            [__collectionView reloadData];
            break;
            
        default:
            break;
    }
}

-(void)livBubbleMenuDidHide:(LIVBubbleMenu *)bubbleMenu {
    
    [UIView animateWithDuration:0.5 animations:^{
        _bottomBtn.frame = CGRectMake(WIDTH_SCREEN/2 - _radius, HEIGHT_SCREEN - 65, 60, 60);
    }];
    
}
@end
