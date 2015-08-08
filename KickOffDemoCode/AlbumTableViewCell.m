//
//  AlbumTableViewCell.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "AlbumTableViewCell.h"

#import "UITableViewCell+CustomObject.h"
#import "Album.h"

@implementation AlbumTableViewCell

- (void)setCustomObject:(id)customObject
{
    Album *album = (Album *)customObject;
    
    self.userIdLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long) album.userId];
    self.idLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long) album.id];
    self.titleLabel.text = album.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
