//
//  PGYTopListBtnModel.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-23.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TopListBtnTypeSearchKeyWord=0,
    TopListBtnTypeChartId=1,
}TopListBtnTypes;


@interface PGYTopListBtnModel : NSObject

@property(nonatomic,strong)NSString *  btnTitle;

@property(nonatomic,strong)NSString *  chartId;

@property(nonatomic,assign)TopListBtnTypes   btnType;

@end
