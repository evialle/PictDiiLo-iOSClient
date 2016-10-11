//
//  LoginViewController.m
//  StreetArtPhone
//
//  Created by Eric VIALLE on 05/09/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController

@synthesize email, password, waitingView, request;

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


#pragma mark -
#pragma mark Keyboard mgmnt

/**
 * When return is pressed, the keyboard disapears
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self hideKeyboard:textField];
	return YES;
}

/**
 * Hide the keyboard.
 */
- (void)hideKeyboard:(UITextField*)textField {
	[textField resignFirstResponder];
}

#pragma mark -
- (IBAction) submit:(id)sender {
	
	waitingView.hidden = FALSE;
	finished = FALSE;
	
	//
	NSURL* url = [RestUrlBuilder buildUserLoginRestUrlUdid:[RestUrlBuilder getUdid] email:[email text] password:[password text]];
	request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request startAsynchronous];
	
}



#pragma mark -
#pragma mark return resource

- (void)requestFinished:(ASIHTTPRequest*)request_ {
	waitingView.hidden = NO;
	finished = YES;
	
	NSLog(@"Success");
	NSString* responseString = [request_ responseString];
	NSDictionary *content = [responseString JSONValue];
	int status = [[content valueForKey:@"status"] intValue];
	NSLog(@"Status: %i", status);

	switch (status) {
		case kStatusOk:
			[UserPreferences setUserNickname:[content valueForKey:@"nickname"]];
			[UserPreferences setUserPassword:[password text]];
			[UserPreferences setUserEmail:[email text]];
			[UserSession setCredentials:[content valueForKey:@"credentials"]];
			NSNumber *twitterStatus = [content valueForKey:@"twitter_status"];
			if (twitterStatus != nil) {
				[UserSession setTwitterEnabled:[twitterStatus boolValue]];
			}
  			[self okConfirm];
			break;
		case kStatusUserUnknown:
			[self userUnknownConfirm];
			break;
		case kStatusUserBadAuth:
			[self userBadAuthConfirm];
			break;
		default:
			NSLog(@"Default");
			break;
	}
}

- (void) okConfirm {
	[self goToBrowseList];
}

- (void) userUnknownConfirm {
	UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Erreur Inscription"
														message: @"Désolé, mais cet e-mail ne nous dit rien du tout..."
													   delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];

	[someError show];
	[someError release];

	waitingView.hidden = TRUE;
}

- (void) userBadAuthConfirm {
	UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Erreur Inscription"
														message: @"Votre e-mail nous dit quelque chose... Vous êtes bien déjà inscrit chez nous. Mais vous vous êtes trompé de mot de passe."
													   delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];

	[someError show];
	[someError release];

	waitingView.hidden = TRUE;
}

- (void)requestFailed:(ASIHTTPRequest*) request_ {
	waitingView.hidden = TRUE;
	finished = YES;
	
    //Recieved a bad status code 404, 500, etc.
	NSError* error = [request_ error];
	NSLog(@"Error %@", [error localizedDescription]);
	UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Erreur réseau"
														message: @"Votre inscription n'a pu être prise en compte. Votre iPhone n'est peut-etre pas connecté à Internet."
													   delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];

	[someError show];
	[someError release];
}

- (void) cancelRequest {
	if ((request != nil) && (finished == false)) {
		[request clearDelegatesAndCancel];
	}
}

#pragma mark -

- (void) goToBrowseList {
	[self cancelRequest];
	
	//Next View
	PicturesBrowseViewController* plViewController = [[PicturesBrowseViewController alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:plViewController animated:YES];
	[plViewController release];
}

- (IBAction) goToFirstViewAction:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
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
