//
//  ServerRequest.h
//  CDDStoreDemo
//
//  Created by zhangj on 2017/8/3.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "MBProgressHUD.h"
#import "ASIHTTPRequest.h"

#define SERVER_API_BASE_URL @"http://wwoapp.herokuapp.com/api/v1/"

//#define SERVER_API_BASE_URL @"http://localhost:3000/api/v1"




// 步骤1:声明一份协议(OC中的协议一般写在类中的.h文件)
// 这个协议只有一个方法
@protocol ServerRequestDelegate <NSObject>

// 标记了optional关键字,表示协议中这个方法是可选择性实现(也就是可以不实现)
@optional
/**
 *  这个方法通知「被委托对象」.
 *
 *  @param result 传递连接上的设备数量给被委托对象
 */
-(void)serverCallBack:(NSString *)requestTypeFlag :(BOOL)status :(NSString *)code :(NSString *)msg :(NSDictionary *)response;

@end


@interface ServerRequest : NSObject<ServerRequestDelegate>


// 步骤2:声明delegate属性
@property (assign) id<ServerRequestDelegate> delegate;


//@property (readonly) NSString *accessToken;
@property (nonatomic, retain) ASIHTTPRequest *request;
@property (nonatomic, retain) MBProgressHUD *loadingIndicator;

@property (nonatomic) BOOL showProgress;
@property (nonatomic, retain) NSString *progressMessage;

@property(nonatomic, retain) NSString *requestTypeFlag;

//@property (nonatomic, copy) dispatch_block_t callback;

- (void) didFetchJson:(NSDictionary *)json;
- (NSString *) fullUrl:(NSString *)url, ...;

- (void) showLoadingIndicatorForView:(UIView *)view;
- (void) showLoadingIndicator:(NSString *)message forView:(UIView *)view;

- (void) requestFinished:(ASIHTTPRequest *)request;
- (void) requestFailed:(ASIHTTPRequest *)request;

@end
