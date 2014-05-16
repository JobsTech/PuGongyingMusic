//
//  PGYChartMusicListInterface.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYChartMusicListInterface.h"
#import "EnablerSDK.h"
#import "ChartMusicListParser.h"


@interface PGYChartMusicListInterface()<QueryResultDelegate>
@property(nonatomic,strong)EnablerSDK *  enablerSDK;
@end

@implementation PGYChartMusicListInterface


- (void) downloadMusicListWithChartId:(NSString*)chartId AndPageNum:(NSString *)pageNum AndCurrPageCount:(NSString *)currPageCount{
    
    
    _enablerSDK = [EnablerSDK shared];
    _enablerSDK.delegate = self;
    [_enablerSDK EnablerCalling:@"getMusicsByChartId" Parameter:[NSString stringWithFormat:@"%@&%@&%@",chartId,pageNum,currPageCount] ID:APP_ID rsaSign:@""];  // 页码&每页条数
}



- (void)retQueryResult:(NSString *)queryResult{
    NSLog(@"retQueryResult:queryResult=%@", queryResult);
    NSData * aData = [queryResult dataUsingEncoding:NSUTF8StringEncoding];
    ChartMusicListParser *parse=[[ChartMusicListParser alloc]init];
    [self.delegate arrayWithDownChartMusicListComplete:[parse arrayWithParseData:aData]];
}


-(void)dealloc{
    _enablerSDK.delegate=nil;
    _enablerSDK=nil;
}

@end
