//
//  PGYTopListMusicTableViewCell.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListMusicTableViewCell.h"

@implementation PGYTopListMusicTableViewCell



+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"PGYTopListMusicTableViewCell";
    PGYTopListMusicTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[PGYTopListMusicTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
