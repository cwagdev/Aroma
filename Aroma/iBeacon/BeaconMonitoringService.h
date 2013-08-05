//
//  BeaconMonitoringService.h
//  Aroma
//
//  Created by Chris Wagner on 8/5/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface BeaconMonitoringService : NSObject

+ (BeaconMonitoringService *)sharedService;

- (void)startMonitoringBeaconWithUUID:(NSUUID *)uuid
                                major:(CLBeaconMajorValue)major
                                minor:(CLBeaconMinorValue)minor
                           identifier:(NSString *)identifier
                              onEntry:(BOOL)entry
                               onExit:(BOOL)exit;

- (void)stopMonitoringBeaconWithUUID:(NSUUID *)uuid
                               major:(CLBeaconMajorValue)major
                               minor:(CLBeaconMinorValue)minor
                          identifier:(NSString *)identifier;


- (void)stopMonitoringAllRegions;

@end
