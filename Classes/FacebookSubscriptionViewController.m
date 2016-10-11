//
//  FacebookSubscriptionViewController.m
//  StreetArtPhone
//
//  Created by Eric Vialle on 13/12/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import "FacebookSubscriptionViewController.h"


@implementation FacebookSubscriptionViewController

@synthesize webView, activityIndicatorView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidAppear:(BOOL)animated {
	
	//Request the web site
	NSURLRequest* request = [NSURLRequest requestWithURL:[RestUrlBuilder buildFacebookLoginCredentials:[UserSession getCredentials]]];
	[webView loadRequest:request];
	
	//Display the info box
	[FacebookSubscriptionViewController informAboutFacebook];
		
    [super viewDidAppear:animated];
}


+ (void) informAboutFacebook {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook avec Pict.DiiLo" 
													message:@"Vous pouvez mettre à jour votre statut Facebook, à la demande, avec vos Instants pris avec Pict.DiiLo. Cet écran vous permet d'attacher ou de détacher votre compte Facebook à votre compte Pict.DiiLo." 
												   delegate:self cancelButtonTitle:@"Ok" 
										  otherButtonTitles:nil];
	
	[alert show];
	[alert release];
}

#pragma mark _
#pragma mark WebView Delegate
- (void) webViewDidFinishLoad:(UIWebView*)webView {
	self.activityIndicatorView.hidden = YES;
}


- (void) webView:didFailLoadWithError:(UIWebView*)webView {
	//1- Disable activity Indicator 
	self.activityIndicatorView.hidden = YES;
	
	//2- Tell that an error has occured
	UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Erreur réseau"
														message: @"Désolé, Pict.DiiLo ne peut se connecter à Facebook."
													   delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
	
	[someError show];
	[someError release];
	
	//3- Come back
	[self goToBrowseList];
}
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

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


- (IBAction) closeAction:(id)sender {
	[UserSession updateSocialNetworkStatusFromServer];
	
	[self goToBrowseList];
}



#pragma mark -



- (void) goToBrowseList {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
	webView.delegate = nil;
    [super dealloc];
}



@end
