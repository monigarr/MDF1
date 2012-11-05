//
//  MapDetailViewController.h
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//
//  Map at top center shows Business Location.
//  Business Name & Location under map
//  Latitude & Longitude under Business Name
//  Map zooms to Location
//  Map Pin shows Business Name & Info
//  Back Button at top left returns to ListViewController


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface MapDetailViewController : UIViewController
{
    IBOutlet MKMapView *mapBizView;
    MyAnnotation *passAnnotation, *passAnnotation2;
    IBOutlet UILabel *name, *bizLocation;
}

@property(retain)IBOutlet MKMapView *mapBizView;
-(IBAction)mapIt:(CLLocationCoordinate2D)coord title:(NSString *)title;

@end

