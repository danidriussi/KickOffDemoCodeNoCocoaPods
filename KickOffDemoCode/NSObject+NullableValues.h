//
//  NSObject+NullableValues.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NullableValues)

- (NSArray *)optionalArrayForKey:(NSString *)key usingClass:(Class)cls;
- (NSArray *)optionalArrayForArray:(NSArray *)json usingClass:(Class)cls;

- (int)optionalIntForKey:(NSString *)key;
- (int)optionalIntForKey:(NSString *)key defaultValue:(int)defaultValue;

- (id)optionalObjectForKey:(NSString *)key;
- (id)optionalObjectForKey:(NSString *)key defaultValue:(id)defaultValue;


//optionalLong
//optionalDouble
//optionalURl...

@end
