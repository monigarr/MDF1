//
//  DetailViewController.h
//  mdf1_project2
//
//  Created by Monica Peters on 10/29/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *detail;
    NSString *textSelected;
}

@property (nonatomic, retain) UILabel *detail;
@property (nonatomic, retain) NSString *textSelected;

-(id)initWithTextSelected:(NSString *) text;

//button to close this detail view
-(IBAction)onClose:(id)sender;
@end
