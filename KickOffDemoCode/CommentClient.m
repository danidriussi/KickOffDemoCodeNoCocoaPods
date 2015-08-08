//
//  CommentClient.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/7/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "CommentClient.h"

#import "WebHTTPClient.h"
#import "WebResponse.h"

NSString * const kCommentClientEndPoint = @"http://jsonplaceholder.typicode.com/comments"; //Should declare this on a separate project.

@implementation CommentClient

- (void)requestPage:(int)page withParameters:(NSDictionary *)parameters successBlock:(void (^)(NSArray *))successBlock
{
    if (page == 1) {
        self.nextPage = kCommentClientEndPoint;
    }
    
    [[WebHTTPClient instance] GET:self.nextPage usingCache:NO success:^(id json) {
        NSLog(@"Successfully received JSON: %@", json);

        WebResponse *response = [[WebResponse alloc] initFromJSONWithoutKeyValues:json];

        if ([response.comments count] > 0){
            successBlock(response.comments);
            
        }
        
    } failure:^(NSError *error, id json) {
        NSLog(@"%@", error);
        
        successBlock(@[]);
    }];
    
}

@end
