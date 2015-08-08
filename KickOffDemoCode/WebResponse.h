//
//  WebResponse.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebResponse : NSObject

@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) NSArray *albums;

- (id)initFromJSON:(NSDictionary *)jsonObject;
- (id)initFromJSONWithoutKeyValues:(NSDictionary *)jsonObject;

@end
