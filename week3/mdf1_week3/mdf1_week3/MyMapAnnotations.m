//
//  MyMapAnnotations.m
//  mdf1_week3
//
//  Created by Monica Peters on 11/3/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "MyMapAnnotations.h"

@implementation MyMapAnnotations
@synthesize title, coordinate;

-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord
{
    if ((self = [super init]))
    {
        title = text;
        coordinate = coord;
    }
    return self;
}

@end
