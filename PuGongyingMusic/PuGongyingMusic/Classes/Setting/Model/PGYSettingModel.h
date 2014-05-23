//
//  PGYSettingModel.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGYSettingModel : NSObject


@property(nonatomic,strong)NSString *title;

@property(nonatomic,assign)CGRect rect;

@property(nonatomic,strong)UIColor *  bgColor;

@property(nonatomic,strong)NSString *  imageName;

@property(nonatomic,strong)Class  actionControllerClass;

@property(nonatomic,strong)NSMutableArray  * childSettingModel;


@end
