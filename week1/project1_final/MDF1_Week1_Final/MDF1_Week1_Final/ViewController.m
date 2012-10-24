//
//  ViewController.m
//  MDF1_Week1_Final
//
//  Created by Monica Peters on 10/23/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender
{
    //show tableview list when button is clicked
    //either the iphone or ipad xib view
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        //iphone view
        TableViewController *listFoodView = [[TableViewController alloc] initWithNibName:@"TableViewController_iPhone" bundle:nil];
        if (listFoodView != nil)
        {
            [self presentViewController:listFoodView animated:TRUE completion:nil];
        }
    }
    else
    {
        //ipad view
        TableViewController *listFoodView = [[TableViewController alloc] initWithNibName:@"TableViewController_iPad" bundle:nil];
        if (listFoodView != nil)
        {
            [self presentViewController:listFoodView animated:TRUE completion:nil];
        }
    }
}

@end
