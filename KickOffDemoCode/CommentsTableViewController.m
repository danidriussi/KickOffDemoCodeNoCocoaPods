//
//  CommentsTableViewController.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "CommentsTableViewController.h"

#import "WebDS.h"
#import "CommentClient.h"

@interface CommentsTableViewController ()

@property (nonatomic, weak) IBOutlet WebDS *dataSource;

@end

@implementation CommentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.dataSource.isLoadingData) {
        return 80.0f;
    }
    
    if (self.dataSource.hasNoResults) {
        
        return 60.0f;
    }
    
    return 230.0f;
}
    
@end
