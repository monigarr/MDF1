//
//  SecondViewController.h
//  mdf1_project2
//
//  Created by Monica Peters on 10/28/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface SecondViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray *foodArray;
    NSMutableArray *vitaminArray;
    NSMutableArray *foodItemTipsArray;
    DetailViewController *detailView;
}
@property (strong, nonatomic) NSMutableArray *foodArray;
@property (strong, nonatomic) NSMutableArray *vitaminArray;
@property (nonatomic, retain) DetailViewController *detailView;

//button to edit list of food items
- (IBAction)clickEdit:(id)sender;

@end
