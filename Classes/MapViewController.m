//
//  MapViewController.m
//  StreetArtPhone
//
//  Created by Eric Vialle on 04/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView, pictureDTO, segmentedControl;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
 
	//Center the map at the picture location
	CLLocationCoordinate2D coord = {latitude: pictureDTO.latitude, longitude:pictureDTO.longitude};
	MKCoordinateSpan span = {latitudeDelta: 0.001, longitudeDelta: 0.001};
	MKCoordinateRegion region = {coord, span};
	[mapView setRegion:region];
	
	//Add annotation to the map
	AddressAnnotation *annotation = [[AddressAnnotation alloc ]initWithPictureDto:pictureDTO];
	[mapView addAnnotation:annotation];
	[annotation release];
	
	[super viewDidLoad];
}



- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}


// Allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#pragma mark -

-(IBAction) segmentedControlIndexChanged {
	if (segmentedControl.selectedSegmentIndex == 0) {
		[mapView setMapType:MKMapTypeStandard];
	} else if (segmentedControl.selectedSegmentIndex == 1) {
		[mapView setMapType:MKMapTypeSatellite];
	} else {
		[mapView setMapType:MKMapTypeHybrid];
	}
}


- (IBAction) pictureAction:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
