//
//  PGYSearchMusicListInterface.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYSearchMusicListInterface.h"
#import "ChartMusicListParser.h"
#import "EnablerSDK.h"

@interface PGYSearchMusicListInterface()<QueryResultDelegate>

@end


@implementation PGYSearchMusicListInterface


- (void) downloadMusicListWithSearchKey:(NSString*)keyWord AndPageNum:(NSString *)pageNum AndCurrPageCount:(NSString *)currPageCount{
    
    EnablerSDK * enablerSDK = [EnablerSDK shared];
    enablerSDK.delegate = self;
    [enablerSDK EnablerCalling:@"getChartInfo" Parameter:[NSString stringWithFormat:@"%@&%@",pageNum,currPageCount] ID:APP_ID rsaSign:@""];  // 页码&每页条数
}



- (void)retQueryResult:(NSString *)queryResult{
    NSLog(@"retQueryResult:queryResult=%@", queryResult);
    NSData * aData = [queryResult dataUsingEncoding:NSUTF8StringEncoding];
    ChartMusicListParser *parse=[[ChartMusicListParser alloc]init];
    [self.delegate arrayWithDownSearchMusicListComplete:[parse arrayWithParseData:aData]];
}

@end
