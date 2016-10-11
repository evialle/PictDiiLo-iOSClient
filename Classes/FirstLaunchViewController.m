//
//  FirstLaunchViewController.m
//  StreetArtPhone
//
//  Created by Eric Vialle on 06/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import "FirstLaunchViewController.h"


@implementation FirstLaunchViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
#pragma mark _

-(IBAction) goToLoginView:(id)sender {
	//Display the subscription page
	LoginViewController* loginViewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil] ;
	[self.navigationController pushViewController:loginViewController animated:YES];
	[loginViewController release];
}

-(IBAction) goToSubscriptionView:(id)sender {
	//Display the subscription page
	SubscriptionViewController* subscriptionViewController = [[SubscriptionViewController alloc] initWithNibName:nil bundle:nil] ;
	[self.navigationController pushViewController:subscriptionViewController animated:YES];
	[subscriptionViewController release];
}

-(IBAction) gotToPasswordRetriever:(id)sender {
	//Display the password page
	PasswordRetrieverViewController* prViewController = [[PasswordRetrieverViewController alloc] initWithNibName:nil bundle:nil] ;
	[self.navigationController pushViewController:prViewController animated:YES];
	[prViewController release];
}

#pragma mark _
#pragma mark Memory's management


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
