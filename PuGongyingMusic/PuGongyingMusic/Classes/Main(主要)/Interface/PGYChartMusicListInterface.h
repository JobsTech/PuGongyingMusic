//
//  PGYChartMusicListInterface.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>





@protocol PGYChartMusicListInterfaceDelegate;


@interface PGYChartMusicListInterface : NSObject

@property (nonatomic,weak)id<PGYChartMusicListInterfaceDelegate> delegate;
- (void) downloadMusicListWithChartId:(NSString*)chartId AndPageNum:(NSString *)pageNum AndCurrPageCount:(NSString *)currPageCount;

@end

@protocol PGYChartMusicListInterfaceDelegate <NSObject>

-(void)arrayWithDownChartMusicListComplete:(NSMutableArray *)musicInfoArray;

@end

