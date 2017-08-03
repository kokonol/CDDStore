//
//  ECPGoodsSvc.m
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/2.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "ECPGoodsSvc.h"
#import "ASIHTTPRequest.h"

@implementation ECPGoodsSvc

-(void)findGoodsList:(NSString *)condition showLoadingView: (UIView*) showLoadingView{
    NSLog(@"!!!GOODS SERVICE!!!");
    [super showLoadingIndicator:@"激恼加载中..." forView:showLoadingView];
    [super sendToUrl:@"http://api-0.martkk.com/goods": @"findGoodsList"];
}

@end
