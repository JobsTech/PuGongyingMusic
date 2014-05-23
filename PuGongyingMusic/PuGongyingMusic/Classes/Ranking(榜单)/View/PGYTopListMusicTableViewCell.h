//
//  PGYTopListMusicTableViewCell.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartInfoEntity.h"
#import "PGYTopListMusicViewController.h"
#import "PGYTopListButton.h"
#import "PGYTopListModel.h"
#import "PGYTopListBtnModel.h"

@interface PGYTopListMusicTableViewCell : UITableViewCell

@property(nonatomic,strong)ChartInfoEntity *chartInfoEntity;
@property(nonatomic,weak)UINavigationController *superController;
@property(nonatomic,strong)PGYTopListModel *  topListModel;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
