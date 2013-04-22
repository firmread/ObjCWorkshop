//
//  DetailViewController.m
//  Assignment1
//
//  Created by Dimitri Stancioff on 3/31/13.
//  Copyright (c) 2013 Dimitri Stancioff. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
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
}






- (void)configureView
{
    // Create 3 restaurants and fill in their properties
    Restaurant* chatNChew = [Restaurant new];
    chatNChew.name = @"Chat 'N Chew";
    chatNChew.cuisineType = @"American";
    chatNChew.priceOfWine = 29.00;
    chatNChew.priceOfEntree = 15.50;
    chatNChew.priceOfDessert = 4.50;
    chatNChew.priceOfAppetizer = 5.50;
    chatNChew.imageFileName = @"chatnchew.jpg";
    chatNChew.coordinate = (CLLocationCoordinate2D){40.7371, -73.9922};
    
    Restaurant* steakFrites = [Restaurant new];
    steakFrites.name = @"Steak Frites";
    steakFrites.cuisineType = @"French";
    steakFrites.priceOfWine = 38.00;
    steakFrites.priceOfEntree = 21.00;
    steakFrites.priceOfDessert = 6.00;
    steakFrites.priceOfAppetizer = 6.50;
    steakFrites.imageFileName = @"steakfrites.jpg";
    steakFrites.coordinate = (CLLocationCoordinate2D){40.737072, -73.991785};
    

    Restaurant* unionSquareCafe = [Restaurant new];
    unionSquareCafe.name = @"Union Square Cafe";
    unionSquareCafe.cuisineType = @"American";
    unionSquareCafe.priceOfWine = 56.00;
    unionSquareCafe.priceOfEntree = 32.00;
    unionSquareCafe.priceOfDessert = 9.50;
    unionSquareCafe.priceOfAppetizer = 14.50;
    unionSquareCafe.imageFileName = @"unionsquare.jpg";
    unionSquareCafe.coordinate = (CLLocationCoordinate2D){40.736814, -73.991442};
    
    //Here we create a restaurant variable to hold the one we want to display.
    // This is solely for convenience, so we can change this variable once and not have to change it everywhere we want to get at the displaying restaurant.
    Restaurant* displayRestaurant = steakFrites;
    
    int numberOfDiners = [self.numberOfGuestsField.text intValue];
    float priceOfDinner = [displayRestaurant priceOfDinnerForGuests:numberOfDiners];
    float priceOfDinnerPerPerson = priceOfDinner / numberOfDiners;
    // Here we are setting various view properies to be the values of properties on our display restaurant.
    self.nameLabel.text = displayRestaurant.name;
    self.navigationItem.title = displayRestaurant.name;
    self.cuisineLabel.text = displayRestaurant.cuisineType;
    self.numberOfDinersLabel.text = [NSString stringWithFormat:@"Estimated cost for %i diner%@:",numberOfDiners, numberOfDiners > 1 ? @"s" : @""];
    self.detailDescriptionLabel.text = [NSString stringWithFormat:@"$%.2f\n($%.2f per person)",priceOfDinner, priceOfDinnerPerPerson];
    
    self.mainImage.image = [UIImage imageNamed:displayRestaurant.imageFileName];
    
    // Change the map
    [self.map addAnnotation:displayRestaurant];
    [self.map setCenterCoordinate:displayRestaurant.coordinate];
    [self.map setRegion:MKCoordinateRegionMake(displayRestaurant.coordinate, MKCoordinateSpanMake(.005, .005))];
    
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

- (IBAction)tappedImage:(id)sender {
    [UIView beginAnimations:@"zoomAnimation" context:nil];
    if(self.mainImage.frame.size.width !=  self.view.frame.size.width)
    {
        [self.mainImage setFrame:self.view.frame];
    }
    else
    {
        [self.mainImage setFrame:CGRectMake(11, 20, 105, 105)];
    }
    [UIView commitAnimations];
}
- (IBAction)numberOfGuestsChanged:(id)sender {
    [self configureView];
}

- (IBAction)tappedAnywhere:(id)sender {
    [self.view endEditing:YES];
}
@end
