//
//  Restaurant.h
//  Assignment1
//
//  Created by Dimitri Stancioff on 4/8/13.
//  Copyright (c) 2013 Dimitri Stancioff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Restaurant : NSObject <MKAnnotation>


@property NSString* name;
@property NSString* cuisineType;
@property float priceOfWine;
@property float priceOfDessert;
@property float priceOfAppetizer;
@property float priceOfEntree;
@property NSString* imageFileName;

//Map stuff
@property CLLocationCoordinate2D coordinate;

- (float)priceOfDinnerForGuests:(int)numberOfGuests;
@end
