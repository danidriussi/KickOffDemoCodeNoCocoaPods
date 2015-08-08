//
//  AlbumClient.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "AlbumClient.h"

#import "WebHTTPClient.h"
#import "WebResponse.h"

NSString * const kAlbumClientEndPoint = @"http://jsonplaceholder.typicode.com/albums"; //Should declare this on a separate project.

@implementation AlbumClient

- (void)requestPage:(int)page withParameters:(NSDictionary *)parameters successBlock:(void (^)(NSArray *))successBlock
{
    if (page == 1) {
        self.nextPage = kAlbumClientEndPoint;
    }
    
    [[WebHTTPClient instance] GET:self.nextPage usingCache:NO success:^(id json) {
        NSLog(@"Successfully received JSON: %@", json);
        
        WebResponse *response = [[WebResponse alloc] initFromJSONWithoutKeyValues:json];
        
        if ([response.albums count] > 0){
            successBlock(response.albums);
            
        }
        
    } failure:^(NSError *error, id json) {
        NSLog(@"%@", error);
        
        successBlock(@[]);
    }];
    
}

@end
