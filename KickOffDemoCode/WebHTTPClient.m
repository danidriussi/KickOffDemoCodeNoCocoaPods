//
//  WebHTTPClient.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "WebHTTPClient.h"

#import "AFHTTPRequestOperation.h"

NSTimeInterval const WebClientDefaultTimeout = 20;

@implementation WebHTTPClient

+ (WebHTTPClient *)instance
{
    static WebHTTPClient *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[WebHTTPClient alloc] init];
    });
    
    return instance;
}

- (void)GET:(NSString *)path usingCache:(BOOL)shouldUseCache success:(WebSuccessBlockType)success failure:(WebFailureBlockType)failure
{
    [self requestWithMethod:@"GET" path:path json:nil withTimeout:WebClientDefaultTimeout usingCache:NO success:success failure:failure];
}

- (void)POST:(NSString *)path json:(NSDictionary *)json withTimeout:(NSTimeInterval)timeout success:(WebSuccessBlockType)success failure:(WebFailureBlockType)failure
{
    [self requestWithMethod:@"POST" path:path json:json withTimeout:WebClientDefaultTimeout usingCache:NO success:success failure:failure];
}

- (void)requestWithMethod:(NSString *)method path:(NSString *)path json:(NSDictionary *)json withTimeout:(NSTimeInterval)timeout usingCache:(BOOL)shouldUseCache
                  success:(WebSuccessBlockType)success failure:(WebFailureBlockType)failure
{
    //Not implementing cache funcionalities on this project
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:timeout];
    
    request.HTTPMethod = method;
    
    if (json) {
        NSData *body = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
        request.HTTPBody = body;
    }
    
    //use request.addValue to add headers
    
    NSDate *dateRequestWasEnqueued = [NSDate date];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer]; //json type
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"URL ended after %.3f seconds: %@", -[dateRequestWasEnqueued timeIntervalSinceNow], request.URL);
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"URL ended after %.3f seconds: %@", -[dateRequestWasEnqueued timeIntervalSinceNow], request.URL);
        NSLog(@"%@", error);
        
        if (failure) {
            failure(error, operation.responseObject);
        }
        
    }];
    
    [operation start];
}

@end
