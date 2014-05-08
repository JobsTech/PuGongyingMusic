//
//  EnablerSDK.h
//  EnablerSDK
//
//  Created by 吕麟 on 13-6-13.
//  Copyright (c) 2013年 sitech. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
	kErrorOK,
	kErrorEnablerClientNotInstalled,
	//kErrorSignError,
};

////////////////////////////////////////////////////////////////////////
@protocol QueryResultDelegate <NSObject>

@optional
- (void) retQueryResult:(NSString *)queryResult;
@end
////////////////////////////////////////////////////////////////////////

@interface EnablerSDK : NSObject
{
    id<QueryResultDelegate> delegate;
}
@property (nonatomic, assign) id<QueryResultDelegate> delegate;

+ (EnablerSDK *)shared;

- (int) EnablerCalling:(NSString *)enablerName Parameter:(NSString *)enablerParameter ID:(NSString *)appID rsaSign:(NSString *)signedString;

- (NSURL *) makeURL:(NSString *)_enablerName;
- (NSString *) makeSendXML:(NSString *)_enablerName byParameter:(NSString *)_enablerParameter;
- (void) query:(NSString *)_enablerName byParameter:(NSString *)_enablerParameter byID:(NSString *)_appID;

- (NSString *)EncodeUTF8Str:(NSString *)encodeStr;
- (NSString *)EncodeGB2312Str:(NSString *)encodeStr;

- (NSString *)URLEncodedString:(NSString *)str;
- (NSString *)URLDecodedString:(NSString *)str;

@end
