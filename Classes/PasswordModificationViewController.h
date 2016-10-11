//
//  PasswordModificationViewController.h
//  StreetArtPhone
//
//  Created by Eric Vialle on 14/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestUrlBuilder.h"
#import "ASIHTTPRequest.h"
#import "UserSession.h"
#import "UserPreferences.h"
#import "Constants.h"
#import "JSON.h"


@interface PasswordModificationViewController : UIViewController<ASIHTTPRequestDelegate> {
	IBOutlet UITextField *actualPasswordTextField;
	IBOutlet UITextField *newPasswordTextField;
	IBOutlet UIView *waitingView;
}

@property(nonatomic, retain) IBOutlet UITextField *actualPasswordTextField;
@property(nonatomic, retain) IBOutlet UITextField *newPasswordTextField;
@property(nonatomic, retain) IBOutlet UIView *waitingView;


- (IBAction) modifyPasswordAction:(id)sender;
- (IBAction) backToAccountInfoAction:(id)sender;
- (void) passwordRequest;


@end
