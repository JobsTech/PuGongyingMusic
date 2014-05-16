//
//  PGYSettingTableViewCell.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGYSettingModel.h"
@interface PGYSettingTableViewCell : UITableViewCell


@property(nonatomic,strong)PGYSettingModel *  settingModel;


+(instancetype)cellWithTableView:(UITableView *)tableView AndSettingModel:(PGYSettingModel *)settingModel;

@end
