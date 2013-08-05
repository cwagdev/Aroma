//
//  BeaconMonitoringService.m
//  Aroma
//
//  Created by Chris Wagner on 8/5/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import "BeaconMonitoringService.h"

@import CoreLocation;

@interface BeaconMonitoringService () <CLLocationManagerDelegate>

@end

@implementation BeaconMonitoringService {
    CLLocationManager *_locationManager;
}

+ (BeaconMonitoringService *)sharedService {
    static dispatch_once_t onceToken;
    static BeaconMonitoringService *_sharedService;
    dispatch_once(&onceToken, ^{
        _sharedService = [[self alloc] init];
    });
    
    return _sharedService;
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    return self;
}

- (void)startMonitoringBeaconWithUUID:(NSUUID *)uuid
                                major:(CLBeaconMajorValue)major
                                minor:(CLBeaconMinorValue)minor
                           identifier:(NSString *)identifier
                              onEntry:(BOOL)entry
                               onExit:(BOOL)exit
{
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major minor:minor identifier:identifier];
    region.notifyOnEntry = entry;
    region.notifyOnExit = exit;
    region.notifyEntryStateOnDisplay = YES;
    [_locationManager startMonitoringForRegion:region];
}

- (void)stopMonitoringBeaconWithUUID:(NSUUID *)uuid
                               major:(CLBeaconMajorValue)major
                               minor:(CLBeaconMinorValue)minor
                          identifier:(NSString *)identifier
{
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major minor:minor identifier:identifier];
    [_locationManager stopMonitoringForRegion:region];
}

- (void)stopMonitoringAllRegions {
    for (CLRegion *region in _locationManager.monitoredRegions) {
        [_locationManager stopMonitoringForRegion:region];
    }
}

@end
