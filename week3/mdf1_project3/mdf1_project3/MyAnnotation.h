//
//  MyAnnotation.h
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface MyAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

@property(nonatomic, assign)CLLocationCoordinate2D	coordinate;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *subtitle;

@end
