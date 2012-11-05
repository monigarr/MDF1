//
//  ListViewController.h
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//
//  First Tab. UITableView with 10 locations
//  Edit Button to delete items from list
//  Click list item > transition to MapDetailViewController
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *bizTableView;
    NSMutableArray *theArray;
    MyAnnotation *getAnnotation;
}

@property(nonatomic,retain)NSMutableArray *theArray;

@end
