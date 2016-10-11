//
//  AccountInfoViewController.m
//  StreetArtPhone
//
//  Created by Eric Vialle on 09/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import "AccountInfoViewController.h"


@implementation AccountInfoViewController

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
#pragma mark back to browse list view
 
- (IBAction) backToBrowseListView:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction) goToTwitterSubscription:(id)sender {
	TwitterSubscriptionViewController *tsViewController = [[TwitterSubscriptionViewController alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:tsViewController animated:YES];
	[tsViewController release];
}

- (IBAction) goToFacebookSubscription:(id)sender {
	FacebookSubscriptionViewController *fbViewController = [[FacebookSubscriptionViewController alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:fbViewController animated:YES];
	[fbViewController release];
}


- (IBAction) goToPasswordManagement:(id)sender {
	PasswordModificationViewController *pmViewController = [[PasswordModificationViewController alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:pmViewController animated:YES];
	[pmViewController release];
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
