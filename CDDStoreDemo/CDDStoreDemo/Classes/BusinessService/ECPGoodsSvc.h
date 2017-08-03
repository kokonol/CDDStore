//
//  GoodsSvc.h
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/2.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//
#import "ServerGetRequest.h"

@interface ECPGoodsSvc : ServerGetRequest

-(void)findGoodsList:(NSString *)condition showLoadingView: (UIView*) showLoadingView;

@end
