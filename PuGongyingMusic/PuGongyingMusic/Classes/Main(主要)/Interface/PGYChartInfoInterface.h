//
//  PGYChartInfoInterface.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PGYChartInfoInterfaceDelegate;


@interface PGYChartInfoInterface : NSObject

@property (nonatomic,weak)id<PGYChartInfoInterfaceDelegate> delegate;
- (void) downloadChartInfoWithPageNum:(NSString *)pageNum AndCurrPageCount:(NSString *)currPageCount;

@end

@protocol PGYChartInfoInterfaceDelegate <NSObject>

-(void)arrayWithDownChartInfoComplete:(NSMutableArray *)chartInfoArray;

@end