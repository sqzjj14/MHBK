//
//  titleViewController2.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/4/8.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "titleViewController2.h"
#import "Header.h"


@interface titleViewController2 ()

@property (nonatomic,strong) UIButton *bottomBtn;
@property LIVBubbleMenu* bubbleMenu;
@property NSArray* images;
@property CGFloat radius;

@end

@implementation titleViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBottomBtn];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initBottomBtn{
    _radius = 30;//半径
    _bottomBtn = [UIButton buttonWithType:0];
    _bottomBtn.frame = CGRectMake(kScreenWidth/2 - _radius, kScreenHeight - 70, 60, 60);
    [_bottomBtn setImage:[UIImage imageNamed:@"女妖"] forState:UIControlStateNormal];
    _bottomBtn.layer.masksToBounds = YES;
    _bottomBtn.layer.cornerRadius = _radius;
    _bottomBtn.layer.borderWidth = 2.f;
    _bottomBtn.layer.borderColor = [[UIColor blackColor]CGColor];
    [_bottomBtn addTarget:self action:@selector(pickRole:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bottomBtn];
    [self.view bringSubviewToFront:_bottomBtn];
    
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

- (void)pickRole:(UIButton *)btn{
    
    [UIView animateWithDuration:0.5 animations:^{
        _bottomBtn.frame = CGRectMake(kScreenWidth/2 - _radius, kScreenHeight/2-_radius, 2*_radius+15, 2*_radius+15);
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
            break;
        case 1:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 2:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 3:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 4:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 5:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 6:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 7:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 8:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 9:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
        case 10:
            [_bottomBtn setImage:_images[index] forState:0];
            break;
            
        default:
            break;
    }
}

-(void)livBubbleMenuDidHide:(LIVBubbleMenu *)bubbleMenu {
    
    [UIView animateWithDuration:0.5 animations:^{
        _bottomBtn.frame = CGRectMake(kScreenWidth/2 - _radius, kScreenHeight - 70, 60, 60);
    }];
    
}
@end
