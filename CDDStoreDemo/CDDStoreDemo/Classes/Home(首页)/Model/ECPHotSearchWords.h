//
//  ECPHotSearchWords.h
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/1.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//
#import "JKDBModel.h"

@interface ECPHotSearchWords : JKDBModel

@property (nonatomic, copy) NSString *hotWords;
+ (NSArray*)getHotWordsArray:(NSString *)hotWordsJson;

@end

