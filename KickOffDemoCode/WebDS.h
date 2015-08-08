//
//  WebDS.h
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WebDSClient.h"

//This can be implemented on Collections as well.

@interface WebDS : NSObject <UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet id<WebDSClient> client;

@property (nonatomic, strong) NSInteger (^numberOfItemsInSectionBlock)(NSInteger calculatedNumber, NSInteger section);

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) NSString *(^cellIdentifierBlock)(id);
@property (nonatomic, strong) id (^customObjectBlock)(id);
@property (nonatomic, strong) void (^cellDequeueBlock)(id);

@property (nonatomic, strong) NSArray * (^requestCallBackStartBlock)(NSArray *retrievedContent);
@property (nonatomic, strong) void (^requestCallBackFinishBlock)(NSArray *retrievedContent);

@property (nonatomic, strong) NSString *loadMoreCellIdentifier;
@property (nonatomic, strong) NSString *noResultsCellIdentifier;

@property (nonatomic) NSInteger sectionIndexOffset;

- (id)objectForIndexPath:(NSIndexPath *)indexPath;

- (BOOL)hasNoResults;
- (BOOL)isLoadingData;

@end
