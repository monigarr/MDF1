//
//  TableViewController.m
//  MDF1_Week1_Final
//
//  Created by Monica Peters on 10/23/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import "CustomCellView.h"
#import "DetailViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize foodArray, vitaminArray, detailView;


//Button to Turn Editing On & Off for List
- (IBAction)clickEdit:(id)sender
{
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
        // Custom initialization
    }
    return self;
}

#pragma mark load data
- (void)viewDidLoad
{
    //create array of 20 items for my list
    //http://www.ewg.org/foodnews/summary/
    //http://www.care2.com/greenliving/the-top-10-foods-to-eat-organically.html
    foodArray = [[NSMutableArray alloc] initWithObjects:
                 @"Apple",
                 @"Celery",
                 @"Pepper",
                 @"Peach",
                 @"Strawberry",
                 @"Nectarine",
                 @"Grape",
                 @"Spinach",
                 @"Lettuce",
                 @"Blueberry",
                 @"Cucumber",
                 @"Potatoe",
                 @"Bean",
                 @"Kale",
                 @"Corn",
                 @"Greens",
                 @"Cherry",
                 @"Cantaloupe",
                 @"Nectarine",
                 @"Collard",
                 nil];
    vitaminArray = [[NSMutableArray alloc] initWithObjects:
                    @"Vitamin C",
                    @"Carotenoids",
                    @"Vitamin C",
                    @"Vitamin A & C",
                    @"Vitamin C",
                    @"Vitamin A & C",
                    @"Potassium",
                    @"Vitamin A & C",
                    @"Vitamin C",
                    @"Vitamin C",
                    @"Protein & Calcium",
                    @"Protein & Calcium",
                    @"Vitamin C",
                    @"Carotenoids",
                    @"Vitamin K",
                    @"Vitamin B",
                    @"Vitamin A, C & Potassium",
                    @"Protein & Calcium",
                    @"Vitamin C",
                    @"Protein & Calcium",
                    nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [foodArray count];
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
        NSLog(@"we want to delete row=%d", indexPath.row);
        [foodArray removeObjectAtIndex:indexPath.row];
        [myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                           withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark Table Row Selected to show Detail View
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *foodSelected = [foodArray objectAtIndex:[indexPath row]];
    NSString *vitaminSelected = [vitaminArray objectAtIndex:[indexPath row]];
    
    //connect both strings above for detailView
    //NSString *foodInfo = [[NSString alloc] initWithFormat: @"%@ \n \n %@", foodSelected, vitaminSelected];
    
    //avoid using alloc and let the core lang framework manage the allocation.
    NSString *foodInfo = [NSString stringWithFormat:@"%@\n\n%@", foodSelected, vitaminSelected];
    
    // show detail view
    // http://iphonedevsdk.com/forum/iphone-sdk-development/80644-subview-not-displaying-in-uitableviewcontroller.html
    if (self.detailView == nil)
    {
        //show either iphone or ipad xib
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            //show iphone xib
            DetailViewController *details = [[DetailViewController alloc]initWithNibName:@"DetailViewController_iPhone" bundle:[NSBundle mainBundle]];
            self.detailView = details;
        }
        else
        {
            //show pad xib
            DetailViewController *details = [[DetailViewController alloc]initWithNibName:@"DetailViewController_iPad" bundle:[NSBundle mainBundle]];
            self.detailView = details;
        }
    }
    
    //send foodInfo string to detailView
    detailView.textSelected = foodInfo;
    
    //show the detailView
    [self presentViewController:detailView animated:TRUE completion:nil];
}

#pragma mark Table Custom Cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //set this in IB xib too
    static NSString *CellIdentifier = @"Cell";
    
    CustomCellView *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //show either iphone or ipad xib
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            //show iphone xib
            NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView_iPhone" owner:nil options:nil];
            
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
        else
        {
            //show ipad xib
            NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView_iPad" owner:nil options:nil];
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
    }
    
    //returns nil if not visible or out of range
    return cell;
}

@end
