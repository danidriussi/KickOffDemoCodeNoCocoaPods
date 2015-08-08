//
//  WebResponse.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "WebResponse.h"

#import "Comment.h"
#import "Album.h"

#import "NSObject+NullableValues.h"

@implementation WebResponse

//JSON with all key values.
- (id)initFromJSON:(id)jsonObject
{
    self = [super init];
    
    self.comments = [jsonObject optionalArrayForKey:@"Comments" usingClass:[Comment class]];
    self.albums = [jsonObject optionalArrayForKey:@"Albuns" usingClass:[Album class]];
    
    return self;
}

- (id)initFromJSONWithoutKeyValues:(id)jsonObject
{
    self = [super init];
    
    self.comments = [jsonObject optionalArrayForArray:jsonObject usingClass:[Comment class]];
    self.albums= [jsonObject optionalArrayForArray:jsonObject usingClass:[Album class]];
    
    return self;
}

@end
