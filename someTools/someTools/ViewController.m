//
//  ViewController.m
//  someTools
//
//  Created by chinargb on 2016/12/22.
//  Copyright © 2016年 myself. All rights reserved.
//

#import "ViewController.h"
#import "CategoryAndExtension.h"
#import "LVTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self demo];
}

- (void)demo{
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    whiteView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    
    [self.view addSubview:whiteView];
    
    UIButton *butten = [UIButton buttonWithType:UIButtonTypeCustom];
    [butten setTitle:@"开始请求" forState:UIControlStateNormal];
    [butten setBackgroundColor:[UIColor blueColor]];
    butten.layer.cornerRadius = 5.0f;
    [butten setFrame:CGRectMake(50, 120, 100, 50)];
    butten.tag = 100;
    [butten addTarget:self action:@selector(buttenClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butten];
    
    UIButton *endbutten = [UIButton buttonWithType:UIButtonTypeCustom];
    [endbutten setTitle:@"结束请求" forState:UIControlStateNormal];
    [endbutten setBackgroundColor:[UIColor blueColor]];
    endbutten.layer.cornerRadius = 5.0f;
    [endbutten setFrame:CGRectMake(screenW-100-50, 120, 100, 50)];
    endbutten.tag = 200;
    [endbutten addTarget:self action:@selector(buttenClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:endbutten];
}
-(void)buttenClick:(UIButton *)btn{
    if(btn.tag == 100){
        [self.view showActivityViewAtCenter];
    }else if(btn.tag == 200){
        [self.view hideActivityViewAtCenter];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
