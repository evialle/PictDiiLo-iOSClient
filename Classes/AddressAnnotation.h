//
//  AdressAnnotation.h
//  StreetArtPhone
//
//  Created by Eric Vialle on 04/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "PictureDTO.h"


@interface AddressAnnotation : NSObject<MKAnnotation> {
	
	
	CLLocationCoordinate2D coordinate;
	
	@private
	NSString *mTitle;
	NSString *mSubTitle;
}
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *mTitle;
@property (nonatomic, retain) NSString *mSubTitle;

- (id)initWithPictureDto:(PictureDTO*)picture;
- (id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end