//
//  FirstLaunchViewController.h
//  StreetArtPhone
//
//  Created by Eric Vialle on 06/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "SubscriptionViewController.h"
#import "PasswordRetrieverViewController.h"


@interface FirstLaunchViewController : UIViewController {


}

-(IBAction) goToLoginView:(id)sender;
-(IBAction) goToSubscriptionView:(id)sender;
-(IBAction) gotToPasswordRetriever:(id)sender;

@end
