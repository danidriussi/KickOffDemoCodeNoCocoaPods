//
//  WebHTTPClient.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WebSuccessBlockType)(id json);
typedef void (^WebFailureBlockType)(NSError *error, id json);

@interface WebHTTPClient : NSObject

+ (WebHTTPClient *)instance;

- (void)GET:(NSString *)path
 usingCache:(BOOL)shouldUseCache
    success:(WebSuccessBlockType)success
    failure:(WebFailureBlockType)failure;

- (void)POST:(NSString *)path
        json:(NSDictionary *)json
 withTimeout:(NSTimeInterval)timeout
     success:(WebSuccessBlockType)success
     failure:(WebFailureBlockType)failure;

@end
