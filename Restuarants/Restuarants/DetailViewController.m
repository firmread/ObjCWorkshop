//
//  DetailViewController.m
//  Restuarants
//
//  Created by Firm Read on 4/1/13.
//  Copyright (c) 2013 Firm Read. All rights reserved.
//

#import "DetailViewController.h"


float priceOfDinner;

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    
    NSString* someText = [NSString stringWithFormat:@"Price $%.2f", [self priceOfDinnerForGuest:10]];
    self.detailDescriptionLabel.text = someText;
    
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
    
    
    
//    [self text];
//    self.text;
//    
//    [self setText:@"SS"];
//    self.text = @"SS";
//    
//    [self setText:@"SS"  andThisOtherThing:@""]
}

- (float) priceOfDinnerForGuest:(int) person
{
    
    float entree        = 21.50;
    float appertizer    = 8.00;
    float wine          = 43.00;
    float dessert       = 4.75;
    
    float totalEntree       = entree * person;
    float totalAppertizer   = appertizer * person/2;
    float totalWine         = wine * person/4;
    float totalDessert      = dessert * person;
    
    NSLog(@"my first log, hehe");
    NSLog(@"Total price of entree $%f for %i person", totalEntree, person );
    NSLog(@"Total price of desert $%f for %i person", totalDessert, person );
    
    priceOfDinner = totalEntree + totalAppertizer + totalWine + totalDessert;
    return priceOfDinner;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
