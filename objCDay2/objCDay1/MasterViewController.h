//
//  MasterViewController.h
//  objCDay1
//
//  Created by Firm Read on 4/1/13.
//  Copyright (c) 2013 Firm Read. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
