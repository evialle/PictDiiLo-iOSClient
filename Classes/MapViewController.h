//
//  MapViewController.h
//  StreetArtPhone
//
//  Created by Eric Vialle on 04/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AddressAnnotation.h"
#import "PictureDTO.h"
#import "JSON.h"
#import "ASIHTTPRequest.h"

@interface MapViewController : UIViewController<ASIHTTPRequestDelegate> {
	IBOutlet MKMapView* mapView;
	IBOutlet UISegmentedControl *segmentedControl;
	
	PictureDTO* pictureDTO;
}

@property(nonatomic, retain) IBOutlet MKMapView* mapView;
@property(nonatomic, retain) PictureDTO* pictureDTO;
@property(nonatomic, retain) UISegmentedControl* segmentedControl;


- (IBAction) pictureAction:(id)sender;

-(IBAction) segmentedControlIndexChanged;


@end
