//
//  ListViewController.m
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "ListViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "MapViewController.h"
#import "MapDetailViewController.h"
#import "AppDelegate.h"


@interface ListViewController ()

@end

@implementation ListViewController
@synthesize theArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Locations", @"Locations");
        
        self.tabBarItem.image = [UIImage imageNamed:@"07-map-marker"];
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBar.tintColor =[UIColor blueColor];
    
    UIBarButtonItem *editButton =[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor orangeColor];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate getArray];
    theArray = appDelegate.myArray;
    
    //Lots of Exhaust from this Building
    CLLocationCoordinate2D theCoordinate1;
    theCoordinate1.latitude = 44.907685;
    theCoordinate1.longitude = -74.892626;
	
    //GE North of Massena
	CLLocationCoordinate2D theCoordinate2;
    theCoordinate2.latitude = 44.958725;
    theCoordinate2.longitude = -74.893484;
	
    //Reynolds
	CLLocationCoordinate2D theCoordinate3;
    theCoordinate3.latitude = 44.981921;
    theCoordinate3.longitude = -74.751863;
	
    //GE Plant between Massena Akwesasne
	CLLocationCoordinate2D theCoordinate4;
    theCoordinate4.latitude = 44.955445;
    theCoordinate4.longitude = -74.824648;
    
    //GE Akwesasne Turtle Bay
    CLLocationCoordinate2D theCoordinate5;
    theCoordinate5.latitude = 44.988447;
    theCoordinate5.longitude = -74.730084;
    
    //GE Akwesasne SouthWest next to usabp
    CLLocationCoordinate2D theCoordinate6;
    theCoordinate6.latitude = 44.983499;
    theCoordinate6.longitude = -74.7312;
    
    //Old Paint Factory
    CLLocationCoordinate2D theCoordinate7;
    theCoordinate7.latitude = 45.016182;
    theCoordinate7.longitude = -74.709485;
    
    //Domtar Toxic Waste Source
    CLLocationCoordinate2D theCoordinate8;
    theCoordinate8.latitude = 45.0133;
    theCoordinate8.longitude = -74.742186;
    
    //Ammonia & Toxic at end of cnd bridge
    CLLocationCoordinate2D theCoordinate9;
    theCoordinate9.latitude = 45.018396;
    theCoordinate9.longitude = -74.745018;
    
    //Toxic Mountain behind Walmart
    CLLocationCoordinate2D theCoordinate10;
    theCoordinate10.latitude = 45.022128;
    theCoordinate10.longitude = -74.753001;
    
    MyAnnotation *myAnnotation1 = [[MyAnnotation alloc] init];
	myAnnotation1.coordinate = theCoordinate1;
	myAnnotation1.title = @"Paint Factory";
	myAnnotation1.subtitle = @"Air, Water, Soil Pollution";

    MyAnnotation *myAnnotation2 = [[MyAnnotation alloc] init];
	myAnnotation2.coordinate = theCoordinate2;
	myAnnotation2.title = @"GE/GM/Alcoa West";
	myAnnotation2.subtitle = @"PCBs, Dimethylphenol, Acenaphthene, Anthracene, Arsenic, Cadmium, Mercury,  http://goo.gl/8u3Lk";
	
    MyAnnotation *myAnnotation3 = [[MyAnnotation alloc] init];
	myAnnotation3.coordinate = theCoordinate3;
	myAnnotation3.title = @"Reynolds";
	myAnnotation3.subtitle = @"PCBs, Carcinogenic Metals, http://goo.gl/8u3Lk/";
    
    MyAnnotation *myAnnotation4 = [[MyAnnotation alloc] init];
	myAnnotation4.coordinate = theCoordinate4;
	myAnnotation4.title = @"GE/GM/Alcoa North West";
	myAnnotation4.subtitle = @"PCBs, Dimethylphenol, Acenaphthene, Anthracene, Arsenic, Cadmium, Mercury,  http://goo.gl/8u3Lk";
    
    MyAnnotation *myAnnotation5 = [[MyAnnotation alloc] init];
	myAnnotation5.coordinate = theCoordinate5;
	myAnnotation5.title = @"GE/GM/Alcoa Turtle Bay";
	myAnnotation5.subtitle = @"PCBs, Dimethylphenol, Acenaphthene, Anthracene, Arsenic, Cadmium, Mercury,  http://goo.gl/8u3Lk";
    
    MyAnnotation *myAnnotation6 = [[MyAnnotation alloc] init];
	myAnnotation6.coordinate = theCoordinate6;
	myAnnotation6.title = @"GE/GM/Alcoa Rooseveltown";
	myAnnotation6.subtitle = @"PCBs, Dimethylphenol, Acenaphthene, Anthracene, Arsenic, Cadmium, Mercury, http://goo.gl/8u3Lk";
		
    MyAnnotation *myAnnotation7 = [[MyAnnotation alloc] init];
	myAnnotation7.coordinate = theCoordinate7;
	myAnnotation7.title = @"Empty Paint Factory";
	myAnnotation7.subtitle = @"soil pollution";
    
    MyAnnotation *myAnnotation8 = [[MyAnnotation alloc] init];
	myAnnotation8.coordinate = theCoordinate8;
	myAnnotation8.title = @"Domtar Cornwall";
	myAnnotation8.subtitle = @"pcbs";
    
    MyAnnotation *myAnnotation9 = [[MyAnnotation alloc] init];
	myAnnotation9.coordinate = theCoordinate9;
	myAnnotation9.title = @"Ammonia Tanks";
	myAnnotation9.subtitle = @"ammonia,chlorine";
		
    MyAnnotation *myAnnotation10 = [[MyAnnotation alloc] init];
	myAnnotation10.coordinate = theCoordinate10;
	myAnnotation10.title = @"Domtar Big Ben Dump Site";
	myAnnotation10.subtitle = @"pcbs, http://goo.gl/0xWp8";
    
	[theArray addObject:myAnnotation1];
	[theArray addObject:myAnnotation2];
	[theArray addObject:myAnnotation3];
	[theArray addObject:myAnnotation4];
    [theArray addObject:myAnnotation5];
    [theArray addObject:myAnnotation6];
    [theArray addObject:myAnnotation7];
    [theArray addObject:myAnnotation8];
    [theArray addObject:myAnnotation9];
    [theArray addObject:myAnnotation10];    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)onEdit
{
    [bizTableView setEditing:!bizTableView.editing animated:YES];
    
    if (bizTableView.editing)
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    }
    else
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"Delete"];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return theArray.count;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [theArray removeObjectAtIndex:indexPath.row];
        [bizTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    MyAnnotation *location = [theArray objectAtIndex:indexPath.row];
	cell.textLabel.text = location.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MapDetailViewController *details = [[MapDetailViewController alloc] initWithNibName:@"MapDetailViewController" bundle:nil];
    if (details != nil)
    {
        [self.navigationController pushViewController:details animated:YES];
        MyAnnotation *pinit = [theArray objectAtIndex:indexPath.row];
        [details mapIt:pinit.coordinate title:pinit.title];
    }
}

@end
