//
//  ViewController.m
//  ceshi
//
//  Created by tareba on 15/12/31.
//  Copyright © 2015年 tanada. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *subView;
@property (nonatomic,strong) UIView *subView2;
@property (nonatomic,assign) int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor lightGrayColor];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100 , 60);
    button.backgroundColor =[UIColor redColor];
    [button setTitle:@"返回上一个界面" forState:UIControlStateNormal];
    
    [view addSubview:button];
    self.subView=view;
    [self.view addSubview:view];
    NSLog(@"%lu",(unsigned long)[self.view.subviews count]);
    [button addTarget:self action:@selector(exchange) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
    [self addView];
}
- (void)addView{
    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor blueColor];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100 , 60);
    button.backgroundColor =[UIColor redColor];
    [button setTitle:@"返回上一个界面" forState:UIControlStateNormal];
    [view addSubview:button];
    self.subView2 =view;
    [self.view insertSubview:view aboveSubview:self.subView];
     //[self.view addSubview:view];
    NSLog(@"%lu",(unsigned long)[self.view.subviews count]);
    [button addTarget:self action:@selector(clickButtonToPrefixView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickButtonToNextView:(int) index {
      [self addView];
    //[self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:3];
   // [self viewWillAppear:YES];
    NSLog(@"%lu",(unsigned long)[self.view.subviews count]);
   // [self.view setNeedsLayout];
  //  [self.view layoutSubviews];
    [self.view setNeedsDisplay];
    
    NSLog(@"执行");
}
   // Dispose of any resources that can be recreated.
- (void) exchange{
    [self.view bringSubviewToFront:self.subView2];
}
- (void)clickButtonToPrefixView{
    [self.view bringSubviewToFront:self.subView];
    [self.view setNeedsDisplay];
}
@end
