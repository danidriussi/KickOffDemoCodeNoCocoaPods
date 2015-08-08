//
//  WebDSClient.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebDSClient <NSObject>

- (void)requestPage:(int)page withParameters:(NSDictionary *)parameters successBlock:(void(^)(NSArray * returnedObjects))successBlock;

@end
