//
//  MapDetailViewController.m
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//


#import "MapDetailViewController.h"
#import <MapKit/MapKit.h>
#import "ListViewController.h"
#import "MyAnnotation.h"
#import "AppDelegate.h"

@interface MapDetailViewController ()

@end

@implementation MapDetailViewController
@synthesize mapBizView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)mapIt:(CLLocationCoordinate2D)coord title:(NSString *)title
{
    NSString *mCoord = [[NSString alloc]initWithFormat:@"Latitude:%f Longitude:%f", coord.latitude, coord.longitude];
    
    name.text = title;
    bizLocation.text = mCoord;
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = coord.latitude;
    newRegion.center.longitude = coord.longitude;
    newRegion.span.latitudeDelta = 0.3;
    newRegion.span.longitudeDelta = 0.3;
    
    self.mapBizView.delegate = (id)self;
    self.title = title;
    
    [self.mapBizView setRegion:newRegion animated:YES];
    
    CLLocationCoordinate2D location;
    location.latitude = coord.latitude;
    location.longitude = coord.longitude;
	
	passAnnotation = [[MyAnnotation alloc] init];
	passAnnotation.coordinate = location;
	passAnnotation.title = title;
	passAnnotation.subtitle = @"toxic";
    
    [mapBizView addAnnotation:passAnnotation];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
