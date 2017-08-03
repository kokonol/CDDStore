//
//  ServerGetRequest.m
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/3.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServerGetRequest.h"
#import "ASIHTTPRequest.h"

@implementation ServerGetRequest

- (void) sendToUrl:(NSString *)url:(NSString *)requestTypeFlag
{
    NSURL *u = [NSURL URLWithString:url];
    self.request = [ASIHTTPRequest requestWithURL:u];
    super.requestTypeFlag = requestTypeFlag;
    [self.request setDelegate : self ];
    [self.request startAsynchronous];
}

- (void) requestFinished:(ASIHTTPRequest *)_request
{
    [super requestFinished:_request];
    self.request = nil;
}

- (void) requestFailed:(ASIHTTPRequest *)_request
{
    [super requestFailed:_request];
    self.request = nil;
}

- (void) didFetchJson:(NSDictionary *)json
{
    // to be overridden
}

@end
