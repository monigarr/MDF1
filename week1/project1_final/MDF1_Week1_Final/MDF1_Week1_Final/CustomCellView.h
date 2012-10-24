//
//  CustomCellView.h
//  MDF1_Week1_Final
//
//  Created by Monica Peters on 10/23/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellView : UITableViewCell
{
    IBOutlet UILabel *textLabel;
    IBOutlet UILabel *vitaminLabel;
}

@property (strong, nonatomic)IBOutlet UILabel *textLabel;
@property (strong, nonatomic)IBOutlet UILabel *vitaminLabel;

@end
