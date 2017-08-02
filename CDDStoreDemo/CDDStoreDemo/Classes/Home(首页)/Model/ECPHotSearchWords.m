//
//  ECPHotSearchWords.m
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/1.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "ECPHotSearchWords.h"

@implementation ECPHotSearchWords

+ (NSArray*)getHotWordsArray:(NSString *)hotWordsJson
{
    NSArray *hotWordsArray;
    NSData *jsonData = [hotWordsJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
    }
    hotWordsArray = [dic objectForKey:@"hotWords"];
    return hotWordsArray;
}
@end
