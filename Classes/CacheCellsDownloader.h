//
//  CacheCellsDownloader.h
//  StreetArtPhone
//
//  Created by Eric Vialle on 06/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "RestUrlBuilder.h"
#import "Constants.h"

#define kthumbHasArrived @"thumbHasArrived"
#define kTablePositionUserInfo @"tablePosition"
#define kTableFileId @"tableFileId"

@interface CacheCellsDownloader : NSObject<ASIHTTPRequestDelegate> {

	@private
	NSMutableDictionary *cellsCache;
	NSOperationQueue *queue;
}

@property(nonatomic, retain) NSMutableDictionary *cellsCache;
@property(nonatomic, retain) NSOperationQueue *queue;


+(void) requestDownloadFileId:(NSString*)fileId;
+(UIImage*) getImageThumb:(NSString*)fileId;
+(UIImage*) getImageLowqual:(NSString*)fileId;

-(void) launchRequest:(NSString*) fileId ;

+(NSString*) fileIdThumbKey:(NSString*)fileId;
+(NSString*) fileIdLowqualKey:(NSString*)fileId;

+ (CacheCellsDownloader*)sharedManager;
- (id)copyWithZone:(NSZone *)zone;
- (id)retain;
- (NSUInteger)retainCount;
- (void)release;
- (id)autorelease;



@end
