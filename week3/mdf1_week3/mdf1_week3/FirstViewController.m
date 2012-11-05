//
//  FirstViewController.m
//  mdf1_week3
//
//  Created by Monica Peters on 11/3/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "myMapView.h"
#import "MyAnnotationView.h"
#import "MyMapAnnotations.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize bizNameArray, latitudeArray, longitudeArray, detailView;


-(IBAction)onClick:(id)sender
{
    //delete the item in the tableview list
    //edit items in my table view list
    if (myTableView.editing == NO)
    {
        [myTableView setEditing:YES];
    }
    else
    {
        [myTableView setEditing:NO];
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Locations", @"Locations");
        self.tabBarItem.image = [UIImage imageNamed:@"07-map-marker.png"];
    }
    return self;
}

#pragma mark load data
- (void)viewDidLoad
{
    //tableview list
    //click list item to go to map view
    //with map and location info at the bottom
    //lat, lon, business name
    //create array of 20 items for my list of business locations
    //st. regis mohawk tribe business offices
    bizNameArray = [[NSMutableArray alloc] initWithObjects:
                 @"Cultural Center",
                 @"AERC",
                 @"Group Home",
                 @"Mohawk Casino",
                 @"Fire Dept.",
                 @"Health Services",
                 @"Bingo Palace",
                 @"Partridge House",
                 @"Seniors",
                 @"Social Services",
                 nil];
    // create array of 20 latitudes for each biz name
    latitudeArray = [[NSMutableArray alloc] initWithObjects:
                @"10.0f",
                @"10.0f",
                @"10.0f",
                @"10.0f",
                @"10.0f",
                @"10.0f",
                @"10.0f",
                @"10.0f",
                @"10.0f",
                @"10.0f",
                    nil];
    // create array of 20 longitudes for each biz name
    // only show tips on the Detail View
    longitudeArray = [[NSMutableArray alloc] initWithObjects:
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         @"10.0f",
                         nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Table Rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //make one row in the table for each Biz Name item in the array
    return [bizNameArray count];
}


#pragma mark Table Rows Editing
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


#pragma mark Table Editing View
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //NSLog(@"we want to delete row=%d", indexPath.row);
        [bizNameArray removeObjectAtIndex:indexPath.row];
        [myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                           withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark Table Row Selected to show Detail View
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *bizNameSelected = [bizNameArray objectAtIndex:[indexPath row]];
    NSString *latitudeSelected = [latitudeArray objectAtIndex:[indexPath row]];
    NSString *longitudeSelected = [longitudeArray objectAtIndex:[indexPath row]];
    
    //connect both strings above for detailView
    NSString *bizInfo = [NSString stringWithFormat:@"%@\n %@\n %@", bizNameSelected, latitudeSelected, longitudeSelected];
    
    //start with nil so we don't show a previously selected cell.
    self.detailView = nil;
    
    
     // show detail view
    if (self.detailView == nil)
    {
        // xib
        myMapView *details = [[myMapView alloc]initWithNibName:@"myMapView" bundle:[NSBundle mainBundle]];
        self.detailView = details;
        //send foodInfo string to detailView
        detailView.textSelected = bizInfo;
    }
    
    //show the detailView
    [self presentViewController:detailView animated:TRUE completion:nil];
}

#pragma mark Table Custom Cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //set identifier in IB too
    static NSString *CellIdentifier = @"Cell";
    
    CustomCellView *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //show xib
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"myMapView" owner:nil options:nil];
        
        //check if view is custom table cell
        for (UIView *view in views)
        {
            if([view isKindOfClass:[CustomCellView class]])
            {
                cell = (CustomCellView *)view;
                cell.textLabel.text = (NSString *)[foodArray objectAtIndex:indexPath.row];
                cell.vitaminLabel.text = (NSString *)[vitaminArray objectAtIndex:indexPath.row];
            }
        }
    }
    
    //returns nil if not visible or out of range
    return cell;
}

@end
