//
//  CameraProcess.h
//  DiiLoStreetArtPhone
//
//  Created by Eric VIALLE on 17/08/10.
//  Copyright 2010 DiiLo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "Constants.h"
#import "ASIFormDataRequest.h"
#import <HTTPRiot/JSON.h>
#import "UserPreferences.h"



#define kUrlUploadPict @"http://diilo.com:8080/streetartphone/commands/picturesmgr/"

@interface CameraProcess : NSObject<UINavigationControllerDelegate, UIImagePickerControllerDelegate> {

}



@end
