//
//  CustomCellView.m
//  mdf1_project2
//
//  Created by Monica Peters on 10/29/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "CustomCellView.h"

@implementation CustomCellView

//setup my setters and getters
@synthesize textLabel, vitaminLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
