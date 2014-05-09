//
//  ChartMusicListParser.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicInfoEntity.h"

@interface ChartMusicListParser : NSObject <NSXMLParserDelegate>


@property (nonatomic, strong) NSMutableString *currentString;
@property (nonatomic, strong) MusicInfoEntity *entity;
@property (nonatomic, strong) NSMutableArray *entityList;
@property (nonatomic, strong) NSString *resCode;
@property (nonatomic, strong) NSString *resCounter;
@property (nonatomic, strong) NSString *resMsg;


- (NSMutableArray *)arrayWithParseData:(NSData *)data;

- (NSMutableArray *) arrayAppendArray:(NSMutableArray *)musicInfoEntityArray WithParseData:(NSData *)data;



@end