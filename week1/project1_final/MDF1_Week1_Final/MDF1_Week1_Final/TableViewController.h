//
//  TableViewController.h
//  MDF1_Week1_Final
//
//  Created by Monica Peters on 10/23/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface TableViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray *foodArray;
    NSMutableArray *vitaminArray;
    DetailViewController *detailView;
}

@property (strong, nonatomic) NSMutableArray *foodArray;
@property (strong, nonatomic) NSMutableArray *vitaminArray;
@property (nonatomic, retain) DetailViewController *detailView;

//button to edit list items
- (IBAction)clickEdit:(id)sender;

//button to close this view and show home
-(IBAction)onClose:(id)sender;

@end
