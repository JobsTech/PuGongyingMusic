//
//  PGYChartInfoInterface.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYChartInfoInterface.h"
#import "EnablerSDK.h"
#import "ChartInfoParser.h"


@interface PGYChartInfoInterface()<QueryResultDelegate>
@property(nonatomic,strong)EnablerSDK *  enablerSDK;
@end



@implementation PGYChartInfoInterface



- (void) downloadChartInfoWithPageNum:(NSString *)pageNum AndCurrPageCount:(NSString *)currPageCount
{
    
    
    _enablerSDK = [EnablerSDK shared];
    _enablerSDK.delegate = self;
    [_enablerSDK EnablerCalling:@"getChartInfo" Parameter:[NSString stringWithFormat:@"%@&%@",pageNum,currPageCount] ID:APP_ID rsaSign:@""];  // 页码&每页条数
}



- (void)retQueryResult:(NSString *)queryResult{
    NSLog(@"retQueryResult:queryResult=%@", queryResult);
    NSData * aData = [queryResult dataUsingEncoding:NSUTF8StringEncoding];
    ChartInfoParser *parse=[[ChartInfoParser alloc]init];
    [self.delegate arrayWithDownChartInfoComplete:[parse arrayWithParseData:aData]];
}


-(void)dealloc{
    _enablerSDK.delegate=nil;
    _enablerSDK=nil;
}


@end
