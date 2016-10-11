//
//  AccountInfoViewController.h
//  StreetArtPhone
//
//  Created by Eric Vialle on 09/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSubscriptionViewController.h"
#import "TwitterSubscriptionViewController.h"
#import "PasswordModificationViewController.h"


@interface AccountInfoViewController : UIViewController {

}

- (IBAction) backToBrowseListView:(id)sender;
- (IBAction) goToTwitterSubscription:(id)sender;
- (IBAction) goToFacebookSubscription:(id)sender;
- (IBAction) goToPasswordManagement:(id)sender;

@end
