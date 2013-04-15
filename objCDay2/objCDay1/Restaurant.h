//
//  Restaurant.h
//  objCDay1
//
//  Created by Firm Read on 4/8/13.
//  Copyright (c) 2013 Firm Read. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property NSString* name;
@property NSString* cuisine;

@property float entreePrice;
@property float appetizerPrice;
@property float dessertPrice;
@property float winePrice;
@property bool acceptsCreditCards;

- (float) priceOfDinnerForNumberOfGuests: (int) numberOfGuests;
- (int) numberOfAppertizer:(int) numberOfGuests;
- (int) numberOfWine:(int) numberOfGuests;

@end
