//
//  CacheCellsDownloader.m
//  StreetArtPhone
//
//  Created by Eric Vialle on 06/10/10.
//  Copyright 2010 DiiLo Corp. All rights reserved.
//

#import "CacheCellsDownloader.h"


@implementation CacheCellsDownloader

@synthesize queue, cellsCache;

/** Singleton. */
static CacheCellsDownloader* sharedSingleton = nil;


- (id)init {
	cellsCache = [[NSMutableDictionary alloc] initWithCapacity:kMaxPicturesInList];
	return [super init];
}

+(void) requestDownloadFileId:(NSString*)fileId {
	//1- check if its in the cache
	NSString* key = [CacheCellsDownloader fileIdThumbKey:fileId];
	if ([[CacheCellsDownloader sharedManager].cellsCache objectForKey:key] == nil) {
		//2- not in the cache, so request it	
		//NSLog(@"Request for %@", fileId);
		[[CacheCellsDownloader sharedManager] launchRequest:fileId];
	}
	
	
}

#pragma mark getKeys as stored in the CacheCellsDownloader

+(NSString*) fileIdThumbKey:(NSString*)fileId {
	return [NSString stringWithFormat:@"%@-thumb", fileId];
}

+(NSString*) fileIdLowqualKey:(NSString*)fileId {
	return [NSString stringWithFormat:@"%@-lowqual", fileId];
}

#pragma mark getImages

+(UIImage*) getImageThumb:(NSString*)fileId {
	NSString *key = [CacheCellsDownloader fileIdThumbKey:fileId];
	
	NSData *data = [[CacheCellsDownloader sharedManager].cellsCache objectForKey:key];
	
	if (data == nil) {
		return nil;
	} else {
		return [UIImage imageWithData:data];
	}

}

+(UIImage*) getImageLowqual:(NSString*)fileId {
	NSString *key = [CacheCellsDownloader fileIdLowqualKey:fileId];
	
	NSData *data = [[CacheCellsDownloader sharedManager].cellsCache objectForKey:key];
	
	if (data == nil) {
		return nil;
	} else {
		return [UIImage imageWithData:data];
	}
}

#pragma mark _
#pragma mark Request
-(void) launchRequest:(NSString*) fileId {
	if (![self queue]) {
		[self setQueue:[[NSOperationQueue alloc] init]];
		[self.queue setMaxConcurrentOperationCount:kMaxConcurrentDownload];
	}
	
	//Launch thumb request
	NSURL *urlThumb = [RestUrlBuilder buildPicturesStaticThumbIdPicture:fileId];
	NSString *keyThumb =[CacheCellsDownloader fileIdThumbKey:fileId];
	ASIHTTPRequest *requestThumb = [ASIHTTPRequest requestWithURL:urlThumb];
	[requestThumb setDelegate:self];
	[requestThumb setTimeOutSeconds:30];
	[requestThumb setNumberOfTimesToRetryOnTimeout:5];
	[requestThumb setDidFinishSelector:@selector(requestThumbDone:)];
	[requestThumb setDidFailSelector:@selector(requestWentWrong:)];
	[requestThumb setShouldContinueWhenAppEntersBackground:YES];
	[requestThumb setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:keyThumb, @"key", nil]];
	[[self queue] addOperation:requestThumb];
	 
	 //Launch Lowqual request
	 NSURL *urlLowQual = [RestUrlBuilder buildPicturesStaticLowqualIdPicture:fileId];
	 ASIHTTPRequest *requestLowQual = [ASIHTTPRequest requestWithURL:urlLowQual];
	 [requestLowQual setDelegate:self];
	 [requestLowQual setDidFinishSelector:@selector(requestLowqualDone:)];
	 [requestLowQual setTimeOutSeconds:30];
	 [requestLowQual setNumberOfTimesToRetryOnTimeout:5];
	 [requestLowQual setShouldContinueWhenAppEntersBackground:YES];
	 [requestLowQual setUserInfo:[NSDictionary dictionaryWithObject:[CacheCellsDownloader fileIdLowqualKey:fileId] forKey:@"key"]];
	 [[self queue] addOperation:requestLowQual];
}

- (void)requestLowqualDone:(ASIHTTPRequest *)request {
	//Put the image in the cache
	NSData *image = [request responseData];
	NSString *key = [request.userInfo objectForKey:@"key"];
	[self.cellsCache setObject:image forKey:key];
	
	//NSLog(@"L'image Lowqual %@ est arrivée avec une taille de %i", key, [image length]);
}

- (void)requestThumbDone:(ASIHTTPRequest *)request {
	
	//Put the image in the cache
	NSData *image = [request responseData];
	NSString *key = [request.userInfo objectForKey:@"key"];
	[self.cellsCache setObject:image forKey:key];
		
	//Tell that a thumb has arrived
	NSDictionary *userInfoDictionary = [NSDictionary dictionaryWithObject:[key substringToIndex:8] forKey:kTableFileId];
	[[NSNotificationCenter defaultCenter] postNotificationName:kthumbHasArrived object:nil userInfo:userInfoDictionary];
	
	//NSLog(@"L'image Thumb %@ est arrivée, avec une taille de %i", key,  [image length]);
}

 

#pragma mark _
#pragma mark Singleton

+ (CacheCellsDownloader*)sharedManager {
    if (sharedSingleton == nil) {
        sharedSingleton = [[super allocWithZone:NULL] init] ;
    }
    return sharedSingleton;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedManager];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release {
    [queue release];
	[cellsCache release];
}

- (id)autorelease {
    return self;
}

@end
