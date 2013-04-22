//
//  DetailViewController.h
//  Assignment1
//
//  Created by Dimitri Stancioff on 3/31/13.
//  Copyright (c) 2013 Dimitri Stancioff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Restaurant.h"

@interface DetailViewController : UIViewController



@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuisineLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfDinersLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UITextField *numberOfGuestsField;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
- (IBAction)tappedImage:(id)sender;
- (IBAction)tappedAnywhere:(id)sender;
@end
