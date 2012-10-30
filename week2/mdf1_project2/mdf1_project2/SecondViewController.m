//
//  SecondViewController.m
//  mdf1_project2
//
//  Created by Monica Peters on 10/28/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailViewController.h"
#import "CustomCellView.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
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
        self.title = NSLocalizedString(@"Food", @"Food");
        self.tabBarItem.image = [UIImage imageNamed:@"79-medical-bag"];
    }
    return self;
}

#pragma mark load data
- (void)viewDidLoad
{
    //create array of 20 items for my list of raw vegan food items.
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
    // create array of 20 vitamins to match my 20 food items in list.
    // these will show in label next to the food item name in the list.
    vitaminArray = [[NSMutableArray alloc] initWithObjects:
                    @"Vitamin C.",
                    @"Carotenoids.",
                    @"Vitamin C.",
                    @"Vitamin A & C.",
                    @"Vitamin C.",
                    @"Vitamin A & C.",
                    @"Potassium.",
                    @"Vitamin A & C, Calcium, Protein.",
                    @"Vitamin C.",
                    @"Vitamin C.",
                    @"Protein & Calcium.",
                    @"Protein & Calcium.",
                    @"Vitamin C.",
                    @"Carotenoids.",
                    @"Vitamin K.",
                    @"Vitamin B, Calcium, Protein.",
                    @"Vitamin A, C & Potassium.",
                    @"Protein & Calcium.",
                    @"Vitamin C.",
                    @"Protein & Calcium.",
                    nil];
    // create array of 20 raw vegan tips for each of the food items in list.
    // only show tips on the Detail View
    foodItemTipsArray = [[NSMutableArray alloc] initWithObjects:
                         @"Mix with maple syrup and cinnamon to eat whole. Blend with dark leafy greens for raw vegan smoothies.",
                         @"Mix with sage and walnuts for salads.",
                         @"Chop in big pieces and dip into raw vegan dips. Mix with raw vegan fresh tomatoe sauce.",
                         @"Mix with maple syrup, hot peppers, onions, garlic, and your favorite salsa ingredients.",
                         @"The entire berry including leaves is awesome whole, in salads, and in blended into smoothies.",
                         @"Fast healthy mono meal.  Blend into green smoothies.",
                         @"Mono meal, great in salads, and blended into green smoothies.",
                         @"Dark leafy greens provide the most nutrients per calorie. Consider growing your own all year long in your kitchen and small home greenhouse.",
                         @"Use instead of bread for your sandwiches and wraps.",
                         @"Excellant brain food. Blend with fresh coconut water and or nut/seed mylks with maple syrup or date paste.",
                         @"Fast mono meal. Chop up and mix with avocado and your favorite seasonings to eat as a salad or dip.",
                         @"Marinate in your favorite dressing then dehydrate for healthy unique snack.",
                         @"Marinate in your favorite raw vegan dressing. Eat fresh or dehydrated.",
                         @"Marinate in your fave raw vegan dressing. Eat fresh or dehydrate.",
                         @"Fresh right off the cob tastes so awesome you will wonder why you ever boiled it in the past.  Also great for making raw vegan corn chips.",
                         @"Dark leafy greens provide the most nutrients per calorie and should be 80% of our daily food intake for raw vegans. Provide more protein than meat and dairy products.",
                         @"Mono meal. Great in salads, salsa, and smoothies.",
                         @"Mono meal or mix with other melons.",
                         @"Great as a mono meal, in salads, gazpacho style soups, and smoothies.",
                         @"Use instead of bread and flour wraps.  Marinate in your fave raw vegan dressing to improve the taste if you are not accustomed to the bitterness.",
                         nil];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //make one row in the table for each food item in the array
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
        //NSLog(@"we want to delete row=%d", indexPath.row);
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
    NSString *foodItemTips = [foodItemTipsArray objectAtIndex:[indexPath row]];
    
    //connect both strings above for detailView
    NSString *foodInfo = [NSString stringWithFormat:@"%@\n %@\n %@", foodSelected, vitaminSelected, foodItemTips];
    
    //start with nil so we don't show a previously selected cell.
    self.detailView = nil;
    
    // show detail view
    // http://iphonedevsdk.com/forum/iphone-sdk-development/80644-subview-not-displaying-in-uitableviewcontroller.html
    if (self.detailView == nil)
    {
            // xib
            DetailViewController *details = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
            self.detailView = details;
            //send foodInfo string to detailView
            detailView.textSelected = foodInfo;
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
            NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
            
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
