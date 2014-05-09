//
//  ChartInfoEntity.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChartInfoEntity : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *chartCode;
@property (nonatomic, strong) NSString *chartName;
@property (nonatomic, strong) NSString *chartDes;
@property (nonatomic, strong) NSString *chartPic;


@end
