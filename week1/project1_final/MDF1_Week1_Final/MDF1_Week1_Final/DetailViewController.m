//
//  DetailViewController.m
//  MDF1_Week1_Final
//
//  Created by Monica Peters on 10/23/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "TableViewController.h"
#import "CustomCellView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
//setup my setters and getters to be used later
@synthesize detail, textSelected;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTextSelected:(NSString *) text
{
    self.textSelected = text;
    [detail setText:[self textSelected]];
    return self;
}

- (void)viewDidLoad
{
    [detail setText:[self textSelected]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


//button to close this view
//setup in IB
-(IBAction)onClose:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
