//
//  RestaurantDetailService.m
//  Aroma
//
//  Created by Chris Wagner on 8/3/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import "RestaurantDetailService.h"
#import "Restaurant.h"

@implementation RestaurantDetailService {
    NSArray *_restaurants;
}

+ (RestaurantDetailService *)sharedService {
    static dispatch_once_t onceToken;
    static RestaurantDetailService *_sharedService;
    dispatch_once(&onceToken, ^{
        _sharedService = [[self alloc] init];
    });
    
    return _sharedService;
}

- (NSArray *)restaurants {
    if (_restaurants) {
        return _restaurants;
    }

    // load up some static data, ideally this would come from a web service
    NSUUID *raysUUID = [[NSUUID alloc] initWithUUIDString:@"EC6F3659-A8B9-4434-904C-A76F788DAC43"];
    Restaurant *rays = [[Restaurant alloc] initWithUUID:raysUUID name:@"Ray's Wraps"];
    rays.motdHeader = @"Gangsta Wrappers";
    rays.motdBody = @"Welcome to Ray's Wraps! Here you will find the most gangsta wrappers dropping flavor bombs on your tongue.";
    rays.image = [UIImage imageNamed:@"Wrap"];
    
    NSUUID *jamiesUUID = [[NSUUID alloc] initWithUUIDString:@"7B377E4A-1641-4765-95E9-174CD05B6C79"];
    Restaurant *jamies = [[Restaurant alloc] initWithUUID:jamiesUUID name:@"Jamie's Jambalaya"];
    jamies.motdHeader = @"Everything Under The Sun";
    jamies.motdBody = @"And as hot as the sun, our jambalya will kick you so hard in the tastebuds you won't know what hit you.";
    jamies.image = [UIImage imageNamed:@"Jambalya"];
    
    NSUUID *chrisUUID = [[NSUUID alloc] initWithUUIDString:@"2B144D35-5BA6-4010-B276-FC4D4845B292"];
    Restaurant *chris = [[Restaurant alloc] initWithUUID:chrisUUID name:@"Chris's Calzones"];
    chris.motdHeader = @"Pockets of Heaven";
    chris.motdBody = @"These calzones are so packed full of fresh and delicious ingredients, you will swear they came strait from the calzone gods.";
    chris.image = [UIImage imageNamed:@"Calzone"];
    
    _restaurants = @[rays, chris, jamies];
    
    return _restaurants;
}

- (Restaurant *)restaurantWithUUID:(NSUUID *)uuid {
    if (!_restaurants) {
        [self restaurants];
    }
    
    NSPredicate *uuidPredicate = [NSPredicate predicateWithFormat:@"uuid == %@", uuid];
    Restaurant *restaurant = [[_restaurants filteredArrayUsingPredicate:uuidPredicate] firstObject];
    
    return restaurant;
}

@end
