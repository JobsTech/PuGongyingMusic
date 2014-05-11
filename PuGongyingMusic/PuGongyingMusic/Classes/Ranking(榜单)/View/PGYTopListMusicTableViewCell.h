//
//  PGYTopListMusicTableViewCell.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartInfoEntity.h"

@interface PGYTopListMusicTableViewCell : UITableViewCell

@property(nonatomic,strong)ChartInfoEntity *chartInfoEntity;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
