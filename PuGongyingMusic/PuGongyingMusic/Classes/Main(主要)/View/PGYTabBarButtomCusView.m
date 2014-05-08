//
//  PGYTabBarButtomCusView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYTabBarButtomCusView.h"
#import "PGYMusicProgressBar.h"


@interface PGYTabBarButtomCusView()

@property(nonatomic,strong)UIButton *playBtn;

@property(nonatomic,strong)UIButton *nextMusicBtn;

@property(nonatomic,strong)UIButton *settingBtn;

@property(nonatomic,strong)UILabel *songNameLabel;

@property(nonatomic,strong)UILabel *singerNameLabel;

@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UIImageView *songImg;

@property(nonatomic,strong)PGYMusicProgressBar *progressBar;



@end



@implementation PGYTabBarButtomCusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [bgView setBackgroundColor:[UIColor blackColor]];
    bgView.alpha=0.4;
//        [self addSubview:bgView];
    [self insertSubview:bgView atIndex:0];

        [self setUpView];
    }
    return self;
}


-(void)setUpView{

    float viewH=self.frame.size.height-2;
    
    _progressBar=[[PGYMusicProgressBar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 2) WithStyle:MusicProgressBarStyleBlack AndNeedSlip:NO];
    
    [self addSubview:_progressBar];
    
    _playBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-160, 2, viewH, viewH)];
    [_playBtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    
    _nextMusicBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-80, 2, viewH, viewH)];
    [_nextMusicBtn setBackgroundImage:[UIImage imageNamed:@"btn_vs_next"] forState:UIControlStateNormal];
    
    
    _settingBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-40, 2, viewH, viewH)];
    [_settingBtn setBackgroundImage:[UIImage imageNamed:@"sidebarmenu_setting"] forState:UIControlStateNormal];
    
    _songNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, 2, 100, self.frame.size.height*0.5-5)];
    
    _singerNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, viewH*0.5, 100, viewH*0.5-20)];
    
    _timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, viewH-20, 100, 20)];
    
    
    _songImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 2, viewH, viewH)];
    _songImg.image=[UIImage imageNamed:@"wechat"];
    
    
    _songNameLabel.text=@"测试歌名";
    _singerNameLabel.text=@"测试歌手名";
    _timeLabel.text=@"01:56 -  05:03r";
    [self addSubview:_playBtn];
    [self addSubview:_nextMusicBtn];
    [self addSubview:_settingBtn];
    [self addSubview:_songNameLabel];
    [self addSubview:_singerNameLabel];
    [self addSubview:_timeLabel];
    [self addSubview:_songImg];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
