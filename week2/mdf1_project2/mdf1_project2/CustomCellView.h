//
//  CustomCellView.h
//  mdf1_project2
//
//  Created by Monica Peters on 10/29/12.
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
