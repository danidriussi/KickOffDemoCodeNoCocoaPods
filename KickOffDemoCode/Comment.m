//
//  Comment.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/7/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "Comment.h"

#import "NSObject+NullableValues.h"

@implementation Comment


- (id)initFromJSON:(id)jsonObject
{
    self = [super init];
    
    if (self) {
        
        self.postId = [jsonObject optionalIntForKey:@"postId" defaultValue:0];
        self.id = [jsonObject optionalIntForKey:@"id" defaultValue:0];
        self.name = [jsonObject optionalObjectForKey:@"name"];
        self.email = [jsonObject optionalObjectForKey:@"email"];
        self.body = [jsonObject optionalObjectForKey:@"body"];
    }
    
    return self;
}


@end
