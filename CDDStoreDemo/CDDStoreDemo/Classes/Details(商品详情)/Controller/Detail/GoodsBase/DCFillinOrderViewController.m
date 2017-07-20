//
//  DCFillinOrderViewController.m
//  CDDStoreDemo
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "DCFillinOrderViewController.h"

// Controllers

// Models

// Views

// Vendors

// Categories

// Others

@interface DCFillinOrderViewController ()



@end

@implementation DCFillinOrderViewController

#pragma mark - LazyLoad


#pragma mark - LifeCyle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.navigationController.navigationBar.barTintColor == DCBGColor)return;
    self.navigationController.navigationBar.barTintColor = DCBGColor;
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName : [UIFont fontWithName:PFR size:20]};
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"填写订单";
}

- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
