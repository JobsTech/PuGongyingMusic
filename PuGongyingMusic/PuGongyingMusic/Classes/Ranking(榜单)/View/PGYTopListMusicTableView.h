//
//  PGYTopListMusicTableView.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGYTopListMusicViewController.h"

@interface PGYTopListMusicTableView : UITableView

@property(nonatomic,strong)NSMutableArray *  topListModelArray;

@property(nonatomic,weak)UINavigationController *superController;

@property(nonatomic,strong)NSString *  chartId;
@property(nonatomic,strong)NSString *  keyWord;
@property(nonatomic,strong)NSString *  playListId;

@end
