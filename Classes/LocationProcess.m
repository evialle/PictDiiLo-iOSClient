//
//  LocationProcess.m
//  DiiLoStreetArtPhone
//
//  Created by Eric VIALLE on 22/08/10.
//  Copyright 2010 DiiLo. All rights reserved.
//

#import "LocationProcess.h"



@implementation LocationProcess

@synthesize longitude, latitude, lastUpdated;

static LocationProcess* sharedSingleton = nil;

#pragma mark -
#pragma mark iPhone's Location

/**
 * It starts the GPS, but doesnt return the result
 */
-(void) launchLocation {
	locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.distanceFilter = 2; //all 2 meters, we update
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	[locationManager startUpdatingLocation];
}

/**
 * Stop the location.
 */
- (void) stopLocation {
	[locationManager stopUpdatingLocation];
}

#pragma mark iPhone's location delegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
	
	latitude = newLocation.coordinate.latitude;
	longitude = newLocation.coordinate.longitude;
	lastUpdated =  newLocation.timestamp;
	
	//Tells that it's the first time that we have a position
	[[NSNotificationCenter defaultCenter] postNotificationName:kPositionSet object:nil];

}


+ (double) getLongitude {
	return [[LocationProcess sharedManager] longitude];
}

+ (double) getLatitude {
	return [[LocationProcess sharedManager]	latitude];
}

+ (NSDate*) getLastUpdated {
	return [[LocationProcess sharedManager] lastUpdated];
}

#pragma mark -
#pragma mark Singleton

+ (LocationProcess*)sharedManager {
    if (sharedSingleton == nil) {
        sharedSingleton = [[super allocWithZone:NULL] init] ;
		NSLog(@"Creation d'un nouveau singleton LocationProcess");
    }
    return sharedSingleton;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedManager];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;  //denotes an object that cannot be released
}

@end
