//
//  MyMapAnnotations.h
//  mdf1_week3
//
//  Created by Monica Peters on 11/3/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"
#import "myMapView.h"
#import "MyAnnotationView.h"

@interface MyMapAnnotations : NSObject <MKAnnotation>
{
    //annotation must have min. of
    //these 2 properties. They must be
    //accessed outside, so create properties for them
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

//set the two properties
-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord;

//synthesize both of these in m file
//this will fail if I try to use outside my init function
//because its readonly. will be copied into new nsstring var
@property (copy, nonatomic)NSString *title;
@property (readonly, nonatomic)CLLocationCoordinate2D coordinate;


@end
