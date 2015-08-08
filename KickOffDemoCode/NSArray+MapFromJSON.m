//
//  NSArray+MapFromJSON.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "NSArray+MapFromJSON.h"

@interface NSObject (initFromJSON)

- (instancetype)initFromJSON:(NSDictionary *)json;

@end

@implementation NSArray (MapFromJSON)

- (NSArray *)mapUsingJSONClass:(Class)cls
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[self count]];
    
    for (NSDictionary *jsonObject in self) {
        id obj = [[cls alloc] initFromJSON:jsonObject];
        [result addObject:obj];
    }
    
    return [result copy];
}

@end
