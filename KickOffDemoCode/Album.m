//
//  Album.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "Album.h"

#import "NSObject+NullableValues.h"

@implementation Album

- (id)initFromJSON:(NSDictionary *)jsonObject
{
    self = [super init];
    
    if (self) {
        self.userId = [jsonObject optionalIntForKey:@"userId" defaultValue:0];
        self.id = [jsonObject optionalIntForKey:@"id" defaultValue:0];
        self.title = [jsonObject optionalObjectForKey:@"title"];
    }
    
    return self;
}

@end
