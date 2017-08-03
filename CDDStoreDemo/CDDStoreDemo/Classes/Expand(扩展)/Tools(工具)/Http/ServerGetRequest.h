//
//  ServerGetRequest.h
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/3.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerRequest.h"
#import "ASIHTTPRequestDelegate.h"

@interface ServerGetRequest:ServerRequest<ASIHTTPRequestDelegate>

- (void) sendToUrl : (NSString *)url : (NSString *)requestTypeFlag;
- (void) didFetchJson:(NSDictionary *)json;

@end

