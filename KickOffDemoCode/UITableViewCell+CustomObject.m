//
//  UITableViewCell+CustomObject.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "UITableViewCell+CustomObject.h"

#import <objc/runtime.h>

static char kCustomObject;

@implementation UITableViewCell (CustomObject)

- (void)setCustomObject:(id)customObject
{
    objc_setAssociatedObject(self, &kCustomObject, customObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)customObject
{
    return objc_getAssociatedObject(self, &kCustomObject);
}

@end
