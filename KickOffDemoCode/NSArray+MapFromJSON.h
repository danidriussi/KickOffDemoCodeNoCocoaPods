//
//  NSArray+MapFromJSON.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MapFromJSON)

- (NSArray *)mapUsingJSONClass:(Class)cls;

@end
