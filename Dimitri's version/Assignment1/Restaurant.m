//
//  Restaurant.m
//  Assignment1
//
//  Created by Dimitri Stancioff on 4/8/13.
//  Copyright (c) 2013 Dimitri Stancioff. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

- (float)priceOfDinnerForGuests:(int)numberOfGuests
{
    int numberOfWineBottles = ceilf((float)numberOfGuests / 4.0);
    int numberOfEntrees = numberOfGuests;
    int numberOfAppetizers = ceilf((float)numberOfGuests / 2.0);
    int numberOfDesserts = numberOfGuests;
    
    float subtotal =
    self.priceOfAppetizer * numberOfAppetizers +
    self.priceOfDessert * numberOfDesserts +
    self.priceOfEntree * numberOfEntrees +
    self.priceOfWine * numberOfWineBottles;
    
    float taxPercent = .08875;
    float tipPercent = .2;
    
    float tax = taxPercent * subtotal;
    float tip = tipPercent * subtotal;
    
    return subtotal + tax + tip;
}
@end
