//
//  ServerRequest.m
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/3.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//


#import "ServerRequest.h"
#import "JSONKit.h"
#import "ASIHTTPRequest.h"

@implementation ServerRequest

@synthesize request, loadingIndicator, showProgress, progressMessage, requestTypeFlag;

- (NSString *) fullUrl:(NSString *)url, ...
{
    va_list args;
    va_start(args, url);
    NSString *formattedUrl =[[[NSString alloc] initWithFormat:url arguments:args] autorelease];
    va_end(args);
    
    return [NSString stringWithFormat:@"%@/%@", SERVER_API_BASE_URL, formattedUrl];
}

//- (NSString *) accessToken
//{
//    return [ServerInterface sharedManager].facebook.accessToken;
//}

- (void) requestFinished:(ASIHTTPRequest *)_request
{
    NSString *jsonString = _request.responseString;
    NSLog(@"**Response Content: %@", jsonString);
    
    NSDictionary *responseDict = [jsonString objectFromJSONString];
    
    NSString *successStr = [responseDict objectForKey:@"success"];
    NSString *code = [responseDict objectForKey:@"code"];
    NSString *msg = [responseDict objectForKey:@"msg"];
    NSDictionary *response = [responseDict objectForKey:@"response"];
    BOOL success = [@"true" isEqualToString:successStr];
    
    if ([_delegate respondsToSelector:@selector(serverCallBack:::::)]) {
        [_delegate serverCallBack:requestTypeFlag:success:code:msg:response];
    }
    
    [self didFetchJson:responseDict];
    [self hideLoadingBadge];
}

- (void) requestFailed:(ASIHTTPRequest *)_request
{
    [self hideLoadingBadge];
}

- (void) didFetchJson:(NSDictionary *)json
{
    // to be overridden
}

- (void) showLoadingIndicatorForView:(UIView *)view
{
    [self showLoadingIndicator:nil forView:view];
}

- (void) showLoadingIndicator:(NSString *)message forView:(UIView *)view
{
    self.loadingIndicator = [[[MBProgressHUD alloc] initWithView:view] autorelease];
    self.loadingIndicator.removeFromSuperViewOnHide = YES;
    self.loadingIndicator.labelText = message;
    
    [view addSubview:self.loadingIndicator];
    [self.loadingIndicator show:YES];
}

- (void) hideLoadingBadge
{
    [self.loadingIndicator hide:YES];
}

@end
