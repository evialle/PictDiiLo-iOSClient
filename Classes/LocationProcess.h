//
//  LocationProcess.h
//  DiiLoStreetArtPhone
//
//  Created by Eric VIALLE on 22/08/10.
//  Copyright 2010 DiiLo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


#define kPositionSet @"positionSet"

@interface LocationProcess : NSObject <CLLocationManagerDelegate> {
	CLLocationManager* locationManager;
	double latitude;
	double longitude;
	NSDate* lastUpdated;
}

@property double latitude;
@property double longitude;
@property(nonatomic, retain) NSDate* lastUpdated;

+ (double) getLongitude;
+ (double) getLatitude;
+ (NSDate*) getLastUpdated;

- (void) launchLocation;
- (void) stopLocation;

+ (LocationProcess*)sharedManager;
- (id)copyWithZone:(NSZone *)zone;
- (id)retain;
- (NSUInteger)retainCount;

@end
