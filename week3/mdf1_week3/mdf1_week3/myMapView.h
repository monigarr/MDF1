//
//  myMapView.h
//  mdf1_week3
//
//  Created by Monica Peters on 11/3/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MyMapAnnotations.h"
#import "MyAnnotationView.h"

@interface myMapView : NSObject 
{
    IBOutlet UIButton *backButton;
    IBOutlet UILabel *bizName;
    IBOutlet UILabel *latLabel;
    IBOutlet UILabel *lonLabel;
    //don't declare IBOutlet here
    //declare in property declarations instead
    //Beginning iOS5 Development book
    //page 50
    //IBOutlet MKMapView *mapView;
    MKMapView *mapView;
    NSArray *myMapAnnotations;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

//button to close this view
-(IBAction)onClick:(id)sender;

@end
