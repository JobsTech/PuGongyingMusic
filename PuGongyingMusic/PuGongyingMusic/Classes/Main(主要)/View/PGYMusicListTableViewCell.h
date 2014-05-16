//
//  PGYMusicListTableViewCell.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicInfoEntity.h"

@interface PGYMusicListTableViewCell : UITableViewCell

@property (nonatomic,strong)MusicInfoEntity *musicInfo;

+(instancetype)cellWithTableView:(UITableView *)tableView AndMusicInfo:(MusicInfoEntity *)musicInfo;

@end
