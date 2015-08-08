//
//  AlbumsTableViewController.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "AlbumsTableViewController.h"

#import "WebDS.h"

@interface AlbumsTableViewController ()

@property (nonatomic, weak) IBOutlet WebDS *dataSource;

@end

@implementation AlbumsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    
    return 120.0f;
}

@end
