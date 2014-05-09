//
//  SearchMusicListParser.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderMusicInfoParser : NSObject<NSXMLParserDelegate>


@property (nonatomic, strong) NSMutableString *currentString;
@property (nonatomic, strong) NSString *resCode;
@property (nonatomic, strong) NSString *resMsg;
@property (nonatomic, strong) NSString *resCounter;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *musicId;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *crbtValidity;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *songName;
@property (nonatomic, strong) NSString *singerId;
@property (nonatomic, strong) NSString *singerName;
@property (nonatomic, strong) NSString *ringValidity;
@property (nonatomic, strong) NSString *songValidity;
@property (nonatomic, strong) NSString *albumPicDir;
@property (nonatomic, strong) NSString *singerPicDir;
@property (nonatomic, strong) NSString *crbtListenDir;
@property (nonatomic, strong) NSString *ringListenDir;
@property (nonatomic, strong) NSString *songListenDir;
@property (nonatomic, strong) NSString *lrcDir;



@end



