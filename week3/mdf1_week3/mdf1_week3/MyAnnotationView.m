//
//  MyAnnotationView.m
//  mdf1_week3
//
//  Created by Monica Peters on 11/3/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "MyAnnotationView.h"

@implementation MyAnnotationView
//override initWithAnnotation
//because we are creating custom annotation view
-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier])
    {
        //make sure annotation view gives total custom graphic
        //and not the default pin
        self.image = [UIImage imageNamed:@"CustomPin.png"];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
