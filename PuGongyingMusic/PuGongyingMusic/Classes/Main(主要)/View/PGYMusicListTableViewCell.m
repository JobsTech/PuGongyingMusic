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

@property(nonatomic,strong)UIImageView *loveImageView;

@property(nonatomic,strong)UIView *  lineView;


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
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
        self.selectedBackgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self setUpViews];
    }
    return self;
}

-(void)setFrame:(CGRect)frame{

//    frame.origin.x+=10;
//    frame.size.width-=20;
    [super setFrame:frame];
}



-(void)setUpViews{
    UIColor * textColor=[UIColor whiteColor];
    
    self.songName=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 100, 20)];
    [self.songName setTextColor:textColor];
    self.singerName=[[UILabel alloc]initWithFrame:CGRectMake(60, 20, 100, 20)];
    [self.singerName setTextColor:textColor];
    self.loveImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.loveImageView.image=[UIImage imageNamed:@"Recognize_Heart_Normal"];
    
    float lineViewX=50;
    float lineViewW=self.frame.size.width-lineViewX;
    self.lineView=[[UIView alloc]initWithFrame:CGRectMake(lineViewX, self.frame.size.height-1,lineViewW, 1)];
    [self.lineView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.3]];
    
    [self addSubview:self.songName];
    [self addSubview:self.singerName];
    [self addSubview:self.loveImageView];
    [self addSubview:self.lineView];


}





-(void)setMusicInfo:(MusicInfoEntity *)musicInfo{
    _musicInfo=musicInfo;
    _songName.text=musicInfo.songName;
    _singerName.text=musicInfo.singerName;

}


-(void)setSelected:(BOOL)selected{}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}



//
//-(void)setHighlighted:(BOOL)highlighted{
//    
//    [super setHighlighted:highlighted];
//
//    if (highlighted) {
//        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
//    }else{
//        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
//    }
//    
//    
//}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
    [super setHighlighted:highlighted animated:animated  ];
    
    if (highlighted) {
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    }else{
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
    }
}

@end
