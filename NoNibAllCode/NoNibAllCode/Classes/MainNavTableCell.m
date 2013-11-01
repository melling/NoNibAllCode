//
//  MainNavTableCell.m
//  NoNibAllCode
//
//  Created by Michael Mellinger on 11/1/13.
//  Copyright (c) 2013 h4labs. All rights reserved.
//

#import "MainNavTableCell.h"

@implementation MainNavTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];

    if (self) {
        // Initialization code

    }

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
