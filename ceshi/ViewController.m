//
//  ViewController.m
//  ceshi
//
//  Created by tareba on 15/12/31.
//  Copyright © 2015年 tanada. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+LBBlurredImage.h"
//布局Masonry,最常用的布局框架
#import "Masonry.h"
#import "Manager.h"
@interface ViewController ()

@property (strong, nonatomic)   UIView *subView2;
@property (strong, nonatomic)   UIView *subView;
- (IBAction)gotoSubView2:(id)sender;
- (IBAction)backSubView:(id)sender;
 

@property (nonatomic,assign) int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.subView = [[UIView alloc] init];
    [self.view addSubview:self.subView];
    self.subView.backgroundColor = [UIColor  yellowColor];
    [self.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
        
    }];
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"弹出text" forState:UIControlStateNormal];
    [self.subView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.height.mas_equalTo(30);
    }];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(gotoSubView2:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)gotoSubView2:(id)sender {
    if (!self.subView2) {
        self.subView2 = [[UIView alloc] init];
        self.subView2.backgroundColor= [UIColor lightGrayColor];
        [self.view addSubview:self.subView2];
        [self.view insertSubview:self.subView2 atIndex:0];
        [self.subView2 mas_makeConstraints:^(MASConstraintMaker *make) {
         //   make.centerX.centerY.mas_equalTo(0);
          //  make.height.width.mas_equalTo(200);
            make.edges.mas_equalTo(UIEdgeInsetsMake(20, 20, 20, 20) );
         
        }];
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"弹出text" forState:UIControlStateNormal];
        [self.subView2 addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.height.mas_equalTo(30);
        }];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(backSubView:) forControlEvents:UIControlEventTouchUpInside];
    }
    //增加旋转特性,已经集成为一个小小的框架,随意调用,更改源码
    [Manager AnimationBle:self.subView2];
    //将subviw放在subview2之上
    [self.view insertSubview:self.subView2 aboveSubview:self.subView];

    NSLog(@"%f",self.subView2.frame.size.width);
}

- (void)backSubView:(id)sender {
    
    
    [self.view bringSubviewToFront:self.subView];
    //NSLog(@"%f",self.subView2.frame.size.width);
    // [self.subView2 removeFromSuperview];
    
    
    //self.subView2= nil;
   // [self.view setNeedsDisplay];
}
@end
