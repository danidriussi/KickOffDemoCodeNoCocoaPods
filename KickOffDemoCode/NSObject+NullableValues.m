//
//  NSObject+NullableValues.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "NSObject+NullableValues.h"

#import "NSArray+MapFromJSON.h"

@implementation NSObject (NullableValues)

- (NSArray *)optionalArrayForKey:(NSString *)key usingClass:(Class)cls
{
    NSArray *originalObjects = [self optionalObjectForKey:key defaultValue:@[]];
    
    return [originalObjects mapUsingJSONClass:cls];
}

- (NSArray *)optionalArrayForArray:(NSArray *)json usingClass:(Class)cls
{
    return [json mapUsingJSONClass:cls];
}

- (int)optionalIntForKey:(NSString *)key
{
    return [self optionalIntForKey:key defaultValue:0];
}

- (int)optionalIntForKey:(NSString *)key defaultValue:(int)defaultValue
{
    id object = [self optionalObjectForKey:key defaultValue:[NSNumber numberWithInt:defaultValue]];
    
    return [object intValue];
}

- (id)optionalObjectForKey:(NSString *)key
{
    return [self optionalObjectForKey:key defaultValue:nil];
}

- (id)optionalObjectForKey:(NSString *)key defaultValue:(id)defaultValue
{
    id object = [(NSDictionary *)self objectForKey:key];
    
    if ([object isKindOfClass:[NSNull class]]) {
        return defaultValue;
        
    } else {
        return object;
    }
}

@end
