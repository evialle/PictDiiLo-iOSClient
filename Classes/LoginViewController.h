//
//  LoginViewController.h
//  StreetArtPhone
//
//  Created by Eric VIALLE on 05/09/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UserPreferences.h"
#import "ASIHTTPRequest.h"
#import "Constants.h"
#import "JSON.h"
#import "RestUrlBuilder.h"
#import "PicturesBrowseViewController.h"


@interface LoginViewController : UIViewController<ASIHTTPRequestDelegate, UITextFieldDelegate> {
	IBOutlet UITextField* email;
	IBOutlet UITextField* password;

	IBOutlet UIView* waitingView;

	@private
	ASIHTTPRequest *request;
	BOOL finished;
}

@property(nonatomic, retain) IBOutlet UITextField *email;
@property(nonatomic, retain) IBOutlet UITextField *password;
@property(nonatomic, retain) IBOutlet UIView *waitingView;
@property(nonatomic, retain) ASIHTTPRequest *request;

- (IBAction) submit:(id)sender;

- (void) goToBrowseList;
- (IBAction) goToFirstViewAction:(id)sender;

- (void) cancelRequest;

- (void) userUnknownConfirm;
- (void) userBadAuthConfirm;

- (void)hideKeyboard:(UITextField*)textField;
- (void) okConfirm;

@end
