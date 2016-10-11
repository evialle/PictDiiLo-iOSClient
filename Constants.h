/*
 *  Constants.h
 *  DiiLoStreetArtPhone
 *
 *  Created by Eric VIALLE on 21/08/10.
 *  Copyright 2010 DiiLo. All rights reserved.
 *
 */


#define PROD
//#define DEV

//Nb of simultaneous download
#define kMaxConcurrentDownload 3

#define kStatusOk 1
#define kStatusUserNicknameAlreadyTaken 1001
#define kStatusUserEmailAlreadyTaken 100
#define kStatusUserUnknown 1002
#define kStatusUserBadAuth 1003



#define kApplicationName		@"Pict.DiiLo"

#ifdef PROD
	#define kApplicationServerUrl	@"http://app.diilo.fr/sap-services/commands/"
	#define kWebServerUrl			@"http://app.diilo.fr/sap-services/web/"

	#define kContentServerUrl		@"http://static.diilo.fr/sap/"
#endif

#ifdef DEV
	#define kApplicationServerUrl	@"http://app.diilo.fr/sap-services-dev/commands/"
	#define kWebServerUrl			@"http://app.diilo.fr/sap-services-dev/web/"

	#define kContentServerUrl		@"http://static.diilo.fr/sap-dev/"
#endif

#define kMaxPicturesInList		70 


//The authentification token has a life time inferior of one hour
#define kCredentialsLifeTimeInSeconds 3500.0

//Minimum time in secondes
#define kMinimumTimeForRefreshBetweenNewGpsLocation 47.0

//Maximumn size of characters for the comments
#define kMaxCommentLenght 255

#define kVideoMp4ContentType	@"video/mp4"
#define kImageJpgContentType	@"image/jpeg"


#define kUserPasswordSizeMin	5
#define kUserPasswordSizeMax	24
#define kUserEmailSizeMin		6
#define kUserEmailSizeMax		50
#define kUserNicknameSizeMin	4
#define kUserNicknameSizeMax	18