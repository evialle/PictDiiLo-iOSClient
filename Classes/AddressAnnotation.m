//
//  AdressAnnotation.m
//  StreetArtPhone
//
//  Created by Eric Vialle on 04/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import "AddressAnnotation.h"

@implementation AddressAnnotation

@synthesize coordinate, mSubTitle, mTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord{
    coordinate = coord;	
	return self;
}

- (id)initWithPictureDto:(PictureDTO*)picture {
	self.mSubTitle = picture.description;
	self.mTitle = [NSString stringWithFormat:@"Pict.DiiLo par %@", picture.nickname];
	coordinate = (CLLocationCoordinate2D){latitude: picture.latitude, longitude:picture.longitude};
	return self;
}


- (NSString *)subtitle{
	return self.mSubTitle;
}

- (NSString *)title{
	return self.mTitle;
}


@end