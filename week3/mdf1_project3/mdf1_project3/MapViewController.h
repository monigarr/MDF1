//
//  MapViewController.h
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//
//  Fullscreen Map
//  Zooms into main location on Cornwall Island Ontario
//  Map Pin Annotation for all business locations
//  I track my array of locations in an object that is
//  accessisble to both tab views to keep data in sync.
//  Click Pin Annotation to view Location Name & Detail.

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *listBizView;
    NSMutableArray *showArrayname, *showArrayloc;
    MyAnnotation *passAnnotation, *passAnnotation2, *factorywest, *gewest, *reynolds, *genorthwest, *geturtlebay, *gerooseveltown, *oldpaintfactory, *domtar, *ammoniatanks, *domtarnewmound;
}

@property (retain) IBOutlet MKMapView *listBizView;
@property (nonatomic, retain) NSMutableArray *showArrayname, *showArrayloc;
@property (nonatomic,retain) MyAnnotation *factorywest, *gewest, *reynolds, *genorthwest, *geturtlebay, *gerooseveltown, *oldpaintfactory, *domtar, *ammoniatanks, *domtarnewmound;

@end

