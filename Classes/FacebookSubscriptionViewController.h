//
//  FacebookSubscriptionViewController.h
//  StreetArtPhone
//
//  Created by Eric Vialle on 13/12/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestUrlBuilder.h"
#import "UserSession.h"
#import "ASIHTTPRequest.h"
#import "CacheCellsDownloader.h"
#import "PicturesBrowseViewController.h"


@interface FacebookSubscriptionViewController : UIViewController<UIWebViewDelegate, ASIHTTPRequestDelegate> {
	IBOutlet UIWebView *webView;
	IBOutlet UIActivityIndicatorView *activityIndicatorView;
}

@property(nonatomic, retain) IBOutlet UIWebView* webView;
@property(nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicatorView;

+ (void) informAboutFacebook;
- (IBAction) closeAction:(id)sender;
- (void) goToBrowseList;


@end
