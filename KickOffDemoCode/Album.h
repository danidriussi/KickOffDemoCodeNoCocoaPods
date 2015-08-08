//
//  Album.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic) NSUInteger userId;
@property (nonatomic) NSUInteger id;
@property (nonatomic, strong) NSString *title;

- (id)initFromJSON:(NSDictionary *)jsonObject;

@end
