//
//  ChartInfoParser.h
//  Enabler
//
//  Created by 吕麟 on 13-8-30.
//  Copyright (c) 2013年 sitech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChartInfoEntity.h"

@interface ChartInfoParser : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableString *currentString;
@property (nonatomic, strong) ChartInfoEntity *entity;
@property (nonatomic, strong) NSMutableArray *entityList;
@property (nonatomic, strong) NSString *resCode;
@property (nonatomic, strong) NSString *resCounter;
@property (nonatomic, strong) NSString *resMsg;



- (NSMutableArray *)arrayWithParseData:(NSData *)data;

- (NSMutableArray *)arrayAppendArray:(NSMutableArray *)chartInfoEntityArray WithParseData:(NSData *)data;


@end
