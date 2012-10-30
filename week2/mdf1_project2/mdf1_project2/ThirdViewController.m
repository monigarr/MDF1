//
//  ThirdViewController.m
//  mdf1_project2
//
//  Created by Monica Peters on 10/29/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

-(IBAction)onClick:(id)sender
{
        //when user clicks the button with 0 tag
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.living-foods.com/recipes"]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Info", @"Info");
        self.tabBarItem.image = [UIImage imageNamed:@"28-star"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
