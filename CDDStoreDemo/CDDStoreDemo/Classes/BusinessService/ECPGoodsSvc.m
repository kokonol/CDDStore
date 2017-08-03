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

-(NSString *)findGoodsList:(NSString *)condition showLoadingView: (UIView*) showLoadingView{
    NSLog(@"!!!GOODS SERVICE!!!");
    [super showLoadingIndicatorForView:showLoadingView];
    [super sendToUrl:@"https://r5x.ren5xing.com/test": @"findGoodsList"];
    return @"ECPGoodsSvc.";
}

@end
