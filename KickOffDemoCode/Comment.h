//
//  Comment.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/7/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (nonatomic) NSUInteger postId;
@property (nonatomic) NSUInteger id; //This is not good, but the endpoint parameter name is id.
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *body;

- (id)initFromJSON:(NSDictionary *)jsonObject;

@end
