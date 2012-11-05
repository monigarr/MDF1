//
//  MapViewController.m
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//  tutorial http://www.raywenderlich.com/21365/introduction-to-mapkit-in-ios-6-tutorial

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "ListViewController.h"
#import "AppDelegate.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize factorywest, gewest, reynolds, genorthwest, geturtlebay, gerooseveltown, oldpaintfactory, domtar, ammoniatanks, domtarnewmound, showArrayloc, showArrayname, listBizView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Map", @"Map");
        self.tabBarItem.image = [UIImage imageNamed:@"103-map.png"];
    }
    return self;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    //static NSString *identifier = @"MyLocation";
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[self.listBizView dequeueReusableAnnotationViewWithIdentifier:@"identifier"];
    
        if (pinView == nil)
        {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identifier"];
            pinView.enabled = YES;
            pinView.canShowCallout = YES;
            //change color and image for pin
            pinView.image = [UIImage imageNamed:@"shield.png"];
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 45.014453;
    newRegion.center.longitude = -74.683027;
    newRegion.span.latitudeDelta = .13;
    newRegion.span.longitudeDelta = .13;
    
    self.listBizView.delegate = self;
    
    [self.listBizView setRegion:newRegion animated:YES];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate myArray];
    showArrayloc = appDelegate.myArray;
    
    
    [listBizView removeAnnotations:listBizView.annotations];
    for (int k = 0; showArrayloc.count > k; k++)
    {
        MyAnnotation *theloc = [showArrayloc objectAtIndex:k];
        [listBizView addAnnotation:theloc];
    }
    
    [super viewWillAppear:TRUE];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
