//
//  CommentTableViewCell.m
//  KickOffDemoCode
//
//  Created by Daniel Driussi on 8/8/15.
//  Copyright (c) 2015 Daniel Driussi. All rights reserved.
//

#import "CommentTableViewCell.h"

#import "UITableViewCell+CustomObject.h"

#import "Comment.h"

@implementation CommentTableViewCell

- (void)setCustomObject:(id)customObject
{
    Comment *comment = (Comment *)customObject;
    
    self.postIdLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)comment.postId];
    self.idLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)comment.id];
    self.nameLabel.text = comment.name;
    self.emailLabel.text = comment.email;
    self.bodyLabel.text = comment.body;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
