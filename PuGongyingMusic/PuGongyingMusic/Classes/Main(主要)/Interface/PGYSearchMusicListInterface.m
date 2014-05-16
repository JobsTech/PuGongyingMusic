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

@property(nonatomic,strong)EnablerSDK *  enablerSDK;

@end


@implementation PGYSearchMusicListInterface


- (void) downloadMusicListWithSearchKey:(NSString*)keyWord AndPageNum:(NSString *)pageNum AndCurrPageCount:(NSString *)currPageCount{
    
    _enablerSDK = [EnablerSDK shared];
    _enablerSDK.delegate = self;
//    @"%@&0&%@&%@"
    
    
    [_enablerSDK EnablerCalling:@"getMusicsByKey" Parameter:[NSString stringWithFormat:@"%@&0&%@&%@",keyWord,pageNum,currPageCount] ID:APP_ID rsaSign:@""];  // 页码&每页条数
    
//    [enablerSDK EnablerCalling:@"getMusicsByKey" Parameter:[NSString stringWithFormat:@"zjl&0&1&20"] ID:APP_ID rsaSign:@""];  // 页码&每页条数
}



- (void)retQueryResult:(NSString *)queryResult{
    NSLog(@"retQueryResult:queryResult=%@", queryResult);
    NSData * aData = [queryResult dataUsingEncoding:NSUTF8StringEncoding];
    ChartMusicListParser *parse=[[ChartMusicListParser alloc]init];
    [self.delegate arrayWithDownSearchMusicListComplete:[parse arrayWithParseData:aData]];
}



-(void)dealloc{
    _enablerSDK.delegate=nil;
    _enablerSDK=nil;
}

@end
