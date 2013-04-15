//
//  DetailViewController.m
//  objCDay1
//
//  Created by Firm Read on 4/1/13.
//  Copyright (c) 2013 Firm Read. All rights reserved.
//
#import "DetailViewController.h"

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
    Restaurant * enjuu      = [Restaurant new];
    Restaurant * starbucks  = [Restaurant new];
    Restaurant * mcDonald   = [Restaurant new];
    
    enjuu.name          = @"Enjuu";
    enjuu.cuisine       = @"Japanese";
    enjuu.entreePrice   = 12.50;
    enjuu.appetizerPrice= 4.25;
    enjuu.dessertPrice  = 7.50;
    enjuu.winePrice     = 10.00;

    starbucks.name          = @"Starbucks";
    starbucks.cuisine       = @"Coffee";
    starbucks.entreePrice   = 7.75;
    starbucks.appetizerPrice= 4.00;
    starbucks.dessertPrice  = 5.00;
    starbucks.winePrice     = 8.50;
    
    mcDonald.name           = @"McDonald";
    mcDonald.cuisine        = @"Fast Food";
    mcDonald.entreePrice    = 9.40;
    mcDonald.appetizerPrice = 6.00;
    mcDonald.dessertPrice   = 3.00;
    mcDonald.winePrice      = 1.00;    
    
    self.restaurantName.text  = enjuu.name;
    self.navigationItem.title = enjuu.name;
    self.cuisineType.text = enjuu.cuisine;
    
    // Q: How to make an array instead of repeating this bunch of codes?
    
    
    int numberOfGuest = 1;
    NSString* guest1String  = [NSString stringWithFormat:@"%i person", numberOfGuest];
    self.guest1.text        = guest1String;
    
    NSString* wine1String   = [NSString stringWithFormat:@"%i ea", [enjuu numberOfWine:numberOfGuest]];
    self.wine1.text         = wine1String;
    
    NSString* dessert1String= [NSString stringWithFormat:@"%i ea", [enjuu numberOfAppertizer:numberOfGuest]];
    self.dessert1.text      = dessert1String;
    
    float totalPrice1       = [enjuu priceOfDinnerForNumberOfGuests:numberOfGuest];
    NSString* price1String  = [NSString stringWithFormat:@"$%.2f", totalPrice1];
    self.price1.text        = price1String;
    
    NSString* tip1String    = [NSString stringWithFormat:@"$%.2f", [self tipIs:totalPrice1]];
    self.tip1.text          = tip1String;
    
    NSString* tax1String    = [NSString stringWithFormat:@"$%.2f", [self taxIs:totalPrice1]];
    self.tax1.text          = tax1String;
    
    
    
    numberOfGuest = 4;
    NSString* guest2String  = [NSString stringWithFormat:@"%i person", numberOfGuest];
    self.guest2.text        = guest2String;
   
    NSString* wine2String   = [NSString stringWithFormat:@"%i ea", [enjuu numberOfWine:numberOfGuest]];
    self.wine2.text         = wine2String;
 
    NSString* dessert2String= [NSString stringWithFormat:@"%i ea", [enjuu numberOfAppertizer:numberOfGuest]];
    self.dessert2.text      = dessert2String;
    
    float totalPrice2       = [enjuu priceOfDinnerForNumberOfGuests:numberOfGuest];
    NSString* price2String  = [NSString stringWithFormat:@"$%.2f", totalPrice2];
    self.price2.text        = price2String;
    
    NSString* tip2String    = [NSString stringWithFormat:@"$%.2f", [self tipIs:totalPrice2]];
    self.tip2.text          = tip2String;
                               
    NSString* tax2String    = [NSString stringWithFormat:@"$%.2f", [self taxIs:totalPrice2]];
    self.tax2.text          = tax2String;
    
    
    
    
    numberOfGuest = 5;
    NSString* guest3String  = [NSString stringWithFormat:@"%i person", numberOfGuest];
    self.guest3.text        = guest3String;
    
    NSString* wine3String   = [NSString stringWithFormat:@"%i ea", [enjuu numberOfWine:numberOfGuest]];
    self.wine3.text         = wine3String;
    
    NSString* dessert3String= [NSString stringWithFormat:@"%i ea", [enjuu numberOfAppertizer:numberOfGuest]];
    self.dessert3.text      = dessert3String;
    
    float totalPrice3       = [enjuu priceOfDinnerForNumberOfGuests:numberOfGuest];
    NSString* price3String  = [NSString stringWithFormat:@"$%.2f", totalPrice3];
    self.price3.text        = price3String;
    
    NSString* tip3String    = [NSString stringWithFormat:@"$%.2f", [self tipIs:totalPrice3]];
    self.tip3.text          = tip3String;
    
    NSString* tax3String    = [NSString stringWithFormat:@"$%.2f", [self taxIs:totalPrice3]];
    self.tax3.text          = tax3String;
    
}

    // Q: Is there a way to collapse all these methods together to one method that can do different stuffs (many kind of returns) ?

// tip 20% of price BEFORE taxes!
- (float) tipIs: (float) totalPrice
{
    float tip = totalPrice * .2;
    return tip;
}

- (float) taxIs: (float) totalPrice
{
    float tax = totalPrice * (8.875/100);
    return tax;
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
