//
//  SizeViewController.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/5/27.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "SizeViewController.h"

#define kWitdh self.view.frame.size.width
#define kHeight self.view.frame.size.height - 49

@interface SizeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic) UIScrollView *scrollView;
@end

@implementation SizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatScrollView];
}

-(void)creatScrollView{
    UIImage *fristImage = [UIImage imageNamed:@"1.jpg"];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWitdh, kHeight )];
    _scrollView.contentSize = CGSizeMake(9 * kWitdh, fristImage.size.height);
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]]];
        CGFloat imageHeight = imageView.frame.size.height;
        imageView.frame = CGRectMake(i * kWitdh, 0, kWitdh, imageHeight);
        [_scrollView addSubview:imageView];
    }
    
    _scrollView.delegate=self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.maximumZoomScale = 2.0;//允许放大2倍
    _scrollView.minimumZoomScale = 1;
    [self.view addSubview:_scrollView];
    
}
#pragma mark -ScrollView代理方法-

-(void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView{
    NSLog(@"%f",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x == 0) {
        self.title = @"双剑";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[0].size.height);
    }
    if (scrollView.contentOffset.x == kWitdh) {
        self.title = @"双枪";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[1].size.height);
    }
    if (scrollView.contentOffset.x == 2*kWitdh) {
        self.title = @"单手剑";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[2].size.height);
    }
    if (scrollView.contentOffset.x == 3*kWitdh) {
        self.title = @"法杖";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[3].size.height);
    }
    if (scrollView.contentOffset.x == 4*kWitdh) {
        self.title = @"镰刀";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[4].size.height);
    }
    if (scrollView.contentOffset.x == 5*kWitdh) {
        self.title = @"战柱";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[5].size.height);
    }
    if (scrollView.contentOffset.x == 6*kWitdh) {
        self.title = @"巨剑";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[6].size.height);
    }
    if (scrollView.contentOffset.x == 7*kWitdh) {
        self.title = @"枪戟";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[7].size.height);
    }
    if (scrollView.contentOffset.x == 8*kWitdh) {
        self.title = @"魔刃";
        scrollView.contentSize = CGSizeMake(9 *kWitdh, scrollView.subviews[8].size.height);
    }
}

 


@end
