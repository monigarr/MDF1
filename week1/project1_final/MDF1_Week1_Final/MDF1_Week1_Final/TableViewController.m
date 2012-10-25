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

//Button to close this view
-(IBAction)onClose:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
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
                 @"Sweet Bell Pepper",
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
                 @"Dark Leafy Greens",
                 @"Cherry",
                 @"Cantaloupe",
                 @"Nectarine",
                 @"Collard",
                 nil];
    vitaminArray = [[NSMutableArray alloc] initWithObjects:
                    @"Vitamin C.\n Mix with maple syrup and cinnamon to eat whole. Blend with dark leafy greens for raw vegan smoothies.",
                    @"Carotenoids.\nMix with sage and walnuts for salads.",
                    @"Vitamin C.\nChop in big pieces and dip into raw vegan dips. Mix with raw vegan fresh tomatoe sauce.",
                    @"Vitamin A & C.\nMix with maple syrup, hot peppers, onions, garlic, and your favorite salsa ingredients.",
                    @"Vitamin C.\n The entire berry including leaves is awesome whole, in salads, and in blended into smoothies.",
                    @"Vitamin A & C.\n Fast healthy mono meal.  Blend into green smoothies.",
                    @"Potassium.\n Mono meal, great in salads, and blended into green smoothies.",
                    @"Vitamin A & C, Calcium, Protein.\n Dark leafy greens provide the most nutrients per calorie. Consider growing your own all year long in your kitchen and small home greenhouse.",
                    @"Vitamin C.\n Use instead of bread for your sandwiches and wraps.",
                    @"Vitamin C.\n Excellant brain food. Blend with fresh coconut water and or nut/seed mylks with maple syrup or date paste.",
                    @"Protein & Calcium.\n Fast mono meal. Chop up and mix with avocado and your favorite seasonings to eat as a salad or dip.",
                    @"Protein & Calcium.\n Marinate in your favorite dressing then dehydrate for healthy unique snack.",
                    @"Vitamin C.\n Marinate in your favorite raw vegan dressing. Eat fresh or dehydrated.",
                    @"Carotenoids.\n Marinate in your fave raw vegan dressing. Eat fresh or dehydrate.",
                    @"Vitamin K.\n Fresh right off the cob tastes so awesome you will wonder why you ever boiled it in the past.  Also great for making raw vegan corn chips.",
                    @"Vitamin B, Calcium, Protein.\n Dark leafy greens provide the most nutrients per calorie and should be 80% of our daily food intake for raw vegans. Provide more protein than meat and dairy products.",
                    @"Vitamin A, C & Potassium.\n Mono meal. Great in salads, salsa, and smoothies.",
                    @"Protein & Calcium.\n Mono meal or mix with other melons.",
                    @"Vitamin C.\n Great as a mono meal, in salads, gazpacho style soups, and smoothies.",
                    @"Protein & Calcium.\n Use instead of bread and flour wraps.  Marinate in your fave raw vegan dressing to improve the taste if you are not accustomed to the bitterness.",
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
    NSString *foodInfo = [NSString stringWithFormat:@"%@\n%@", foodSelected, vitaminSelected];
    
    //set to nil so that we don't show the cell selected in the last round
    self.detailView = nil;
    
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
            //send foodInfo string to detailView
            detailView.textSelected = foodInfo;
        }
        else
        {
            //show pad xib
            DetailViewController *details = [[DetailViewController alloc]initWithNibName:@"DetailViewController_iPad" bundle:[NSBundle mainBundle]];
            self.detailView = details;
            //send foodInfo string to detailView
            detailView.textSelected = foodInfo;
        }
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
    }
    
    //returns nil if not visible or out of range
    return cell;
}

@end
