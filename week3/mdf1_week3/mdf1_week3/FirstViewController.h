//
//  FirstViewController.h
//  mdf1_week3
//
//  Created by Monica Peters on 11/3/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//
//  UITableView list of ten or more business locations
//  edit button to delete item in list
//  click list item -> go to mapview

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "myMapView.h"
#import "MyMapAnnotations.h"
#import "MyAnnotationView.h"

@interface FirstViewController : UIViewController
{
    IBOutlet UITableView *myTableView;
}

-(IBAction)onClick:(id)sender;

@end
