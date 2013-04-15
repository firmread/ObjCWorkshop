//
//  Restaurant.m
//  objCDay1
//
//  Created by Firm Read on 4/8/13.
//  Copyright (c) 2013 Firm Read. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(float) priceOfDinnerForNumberOfGuests:(int)numberOfGuests
{
    float priceOfDinner;
    
    float totalEntree       = _entreePrice * numberOfGuests;
    float totalAppertizer   = _appetizerPrice * [self numberOfAppertizer: numberOfGuests];
    float totalWine         = _winePrice *       [self numberOfWine: numberOfGuests];
    float totalDessert      = _dessertPrice * numberOfGuests;
    
    NSLog(@"----calculation for %i person(s)----", numberOfGuests);
    NSLog(@"total price of entree is %.2f", totalEntree);
    NSLog(@"total price of appertizer is %.2f", totalAppertizer);
    NSLog(@"total price of wine is %.2f", totalWine);
    NSLog(@"total price of dessert is %.2f", totalDessert);
    
    priceOfDinner = totalEntree + totalAppertizer + totalWine + totalDessert;
    return priceOfDinner;
}

- (int) numberOfAppertizer:(int) numberOfGuests
{
    int appertizerDish      = ceilf((float)numberOfGuests/2);
    return appertizerDish;
}

- (int) numberOfWine:(int) numberOfGuests
{
    int wineBottle          = ceilf((float)numberOfGuests/4);
    return wineBottle;
}


@end
