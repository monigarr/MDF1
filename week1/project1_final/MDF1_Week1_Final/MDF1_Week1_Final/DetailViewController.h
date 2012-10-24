//
//  DetailViewController.h
//  MDF1_Week1_Final
//
//  Created by Monica Peters on 10/23/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *detail;
    NSString *textSelected;
}

@property (nonatomic, retain) IBOutlet UILabel *detail;
@property (nonatomic, retain) NSString *textSelected;

-(id)initWithTextSelected:(NSString *) text;

-(IBAction)onClose:(id)sender;
@end
