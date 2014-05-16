//
//  PGYMusicListTableViewCell.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYMusicListTableViewCell.h"
#import "MusicInfoEntity.h"

@interface PGYMusicListTableViewCell()

@property(nonatomic,strong)UILabel *songName;

@property(nonatomic,strong)UILabel *singerName;


@end



@implementation PGYMusicListTableViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView AndMusicInfo:(MusicInfoEntity *)musicInfo{
    static NSString *ID=@"PGYMusicListTableViewCell";
    PGYMusicListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[PGYMusicListTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.musicInfo=musicInfo;
    return cell;
}





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setUpViews];
    }
    return self;
}



-(void)setUpViews{
    
    self.songName.text=@"海阔天空";
    
    self.singerName.text=@"海阔";
    
    [self addSubview:self.songName];
    [self addSubview:self.singerName];



}


-(UILabel *)songName{
    if (nil==_songName) {
        _songName=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    }
    return _songName;

}

-(UILabel *)singerName{
    if (nil==_singerName) {
        _singerName=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 20)];
    }

    return _singerName;
}


-(void)setMusicInfo:(MusicInfoEntity *)musicInfo{
    _musicInfo=musicInfo;
    _songName.text=musicInfo.songName;
    _singerName.text=musicInfo.singerName;

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
