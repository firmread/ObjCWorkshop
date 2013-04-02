//
//  DetailViewController.h
//  objCDay1
//
//  Created by Firm Read on 4/1/13.
//  Copyright (c) 2013 Firm Read. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;


@property (weak, nonatomic) IBOutlet UILabel *guest1;
@property (weak, nonatomic) IBOutlet UILabel *guest2;
@property (weak, nonatomic) IBOutlet UILabel *guest3;

@property (weak, nonatomic) IBOutlet UILabel *wine1;
@property (weak, nonatomic) IBOutlet UILabel *wine2;
@property (weak, nonatomic) IBOutlet UILabel *wine3;

@property (weak, nonatomic) IBOutlet UILabel *dessert1;
@property (weak, nonatomic) IBOutlet UILabel *dessert2;
@property (weak, nonatomic) IBOutlet UILabel *dessert3;

@property (weak, nonatomic) IBOutlet UILabel *price1;
@property (weak, nonatomic) IBOutlet UILabel *price2;
@property (weak, nonatomic) IBOutlet UILabel *price3;

@end
