//
//  WebDS.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "WebDS.h"
#import "UITableViewCell+CustomObject.h"

@interface WebDS ()

@property (nonatomic, strong) NSMutableArray *pages;
@property (nonatomic) BOOL finished;
@property (nonatomic) BOOL loading;

@end

@implementation WebDS

- (id)init
{
    self = [super init];
    
    if (self) {
        self.cellIdentifier = @"Cell";
        self.loadMoreCellIdentifier = @"LoadMoreCell";
        self.noResultsCellIdentifier = @"NoResultsCell";
        
        self.pages = [@[] mutableCopy];
    }
    
    return self;
}

- (void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.pages count] + (([self.pages count] && self.finished) ? 0 : 1);

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == [self.pages count]) {
        return 1;
    }
    
    return [[self.pages objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![self.pages count] && self.finished){
        return [tableView dequeueReusableCellWithIdentifier:self.noResultsCellIdentifier forIndexPath:indexPath];
    }
    
    if (indexPath.section - self.sectionIndexOffset >= [self.pages count]) {
        [self performSelectorOnMainThread:@selector(loadPage:) withObject:@([self.pages count]) waitUntilDone:NO];
        return [tableView dequeueReusableCellWithIdentifier:self.loadMoreCellIdentifier forIndexPath:indexPath];
    }
    
    id customObject = [self objectForIndexPath:indexPath];
    
    if (self.customObjectBlock) {
        customObject = self.customObjectBlock(customObject);
        
    }
    
    NSString *cellIdentifier;
    
    if (self.cellIdentifierBlock) {
        cellIdentifier = self.cellIdentifierBlock(customObject);
    }

    //previous block can return nil
    if (!cellIdentifier) {
        cellIdentifier = self.cellIdentifier;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.customObject = customObject;
    
    if (self.cellDequeueBlock) {
        self.cellDequeueBlock(cell);
    }
    
    return cell;
}

#pragma mark - Custom Object Management

- (id)objectForIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section - self.sectionIndexOffset;
    if ( section == [self.pages count] )
    {
        return nil;
    }
    return [[self.pages objectAtIndex:section] objectAtIndex:indexPath.row];
}

#pragma mark - Async loading

- (void)loadPage:(NSNumber *)n
{
    
    if (self.loading)
        return;

    self.loading = YES;
    
    int number = [n intValue];
    
    void (^sucessBlock)(NSArray *stuff) = ^(NSArray * stuff) {
      
        if (self.requestCallBackStartBlock) {
            stuff = self.requestCallBackStartBlock(stuff);
        }
        
        if (![stuff count] && number == 0) {
            //No results
            self.finished = YES;
            [self.tableView reloadData];
            
        } else if (![stuff count]) {
            self.finished = YES;
            [self.tableView reloadData];
            
        } else {
            [self.pages addObject:stuff];
            
            [self.tableView reloadData];
        }
        
        self.loading = NO;
        
        if (self.requestCallBackFinishBlock) {
            self.requestCallBackFinishBlock(stuff);
        }
    };
    
    [self.client requestPage:number +1 withParameters:nil successBlock:sucessBlock];
}

#pragma mark - Utils 

- (BOOL)hasNoResults
{
    return ( [self.pages count] == 0 );
}

- (BOOL)isLoadingData
{
    return self.loading;
}

- (void)resetData
{
    self.pages = [@[] mutableCopy];
    self.finished = NO;
    self.loading = NO;
    //reset loadMore data and
}


@end
