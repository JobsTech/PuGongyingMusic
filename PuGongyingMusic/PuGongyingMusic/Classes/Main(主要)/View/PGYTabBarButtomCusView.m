//
//  PGYTabBarButtomCusView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYTabBarButtomCusView.h"
#import "PGYMusicProgressBar.h"
#import "MyAudioPlayer.h"
#import "AudioPlayer.h"

@interface PGYTabBarButtomCusView()<MyAudioPlayerDelegate>

@property(nonatomic,strong)UIButton *playBtn;

@property(nonatomic,strong)UIButton *nextMusicBtn;

@property(nonatomic,strong)UIButton *settingBtn;

@property(nonatomic,strong)UILabel *songNameLabel;

@property(nonatomic,strong)UILabel *singerNameLabel;

@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UIImageView *songImg;

@property(nonatomic,strong)PGYMusicProgressBar *progressBar;

@property(nonatomic,assign)bool isPlaying;

@end



@implementation PGYTabBarButtomCusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [MyAudioPlayer shareMyAudioPlayer].tabBarAudioPlayerDelegate=self;
        
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

    
    float progressBarH=1;
    float viewH=self.frame.size.height-progressBarH;
    
    
    _progressBar=[[PGYMusicProgressBar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, progressBarH) WithStyle:MusicProgressBarStyleBlack AndNeedSlip:NO];
    
    [self addSubview:_progressBar];
    
    float songImgW=viewH;
    _songImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, progressBarH, songImgW, viewH)];
    _songImg.contentMode=UIViewContentModeScaleToFill;
    _songImg.image=[UIImage imageNamed:@"img_online_discovery"];
    [self addSubview:_songImg];
    
    
    float songNameLabelX=songImgW+10;
    float songNameLabelH=20;
    _songNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(songNameLabelX, 2, 100, songNameLabelH)];
    _songNameLabel.font=[UIFont systemFontOfSize:13];
    _songNameLabel.textColor=[UIColor whiteColor];
   
    [self addSubview:_songNameLabel];
    
    float singerNameLabelH=14;
    _singerNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(songNameLabelX, 22, 100, singerNameLabelH)];
    _singerNameLabel.font=[UIFont systemFontOfSize:11];
    _singerNameLabel.textColor=[UIColor whiteColor];
    
    [self addSubview:_singerNameLabel];
    
    _timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(songNameLabelX, 37, 100, 14)];
    _timeLabel.font=[UIFont systemFontOfSize:11];
    _timeLabel.textColor=[UIColor whiteColor];
    
    [self addSubview:_timeLabel];
    
    
    _playBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-110, progressBarH, viewH, viewH-progressBarH)];
    [_playBtn setBackgroundImage:[UIImage imageNamed:@"img_lockscreen_play_normal"] forState:UIControlStateNormal];
    [_playBtn addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_playBtn];
    
    _nextMusicBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-75, progressBarH, viewH, viewH-progressBarH)];
    [_nextMusicBtn setBackgroundImage:[UIImage imageNamed:@"img_lockscreen_next_normal"] forState:UIControlStateNormal];
    [self addSubview:_nextMusicBtn];
    
    _settingBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-40, progressBarH, viewH, viewH-progressBarH)];
    [_settingBtn setBackgroundImage:[UIImage imageNamed:@"img_button_playcontrolbar_transparent_menu_normal"] forState:UIControlStateNormal];
    
   
    [_settingBtn addTarget:self action:@selector(openSettingView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_settingBtn];
   
    
    
    
    
    
}


-(void)playMusic:(UIButton *)btn{
//    MusicInfoEntity *entity=[MusicInfoEntity new];
//    entity.localResourceName=@"sample";
//    entity.localResourceType=@"m4a";
//    
//    [[MyAudioPlayer shareMyAudioPlayer]playWithMusicInfo:entity];
    
    if (self.isPlaying) {
        
        [[MyAudioPlayer shareMyAudioPlayer] pause];
    }else{
        
        [[MyAudioPlayer shareMyAudioPlayer] resume];
    }
    
    [self checkPlayStatus];
    
}


-(void)checkPlayStatus{
    if ([[MyAudioPlayer shareMyAudioPlayer] playStatus]==AudioPlayerStatePlaying) {
        if (self.isPlaying) return;
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"img_lockscreen_pause_normal"] forState:UIControlStateNormal];
        self.isPlaying=YES;
    }else{
        if (!self.isPlaying) return;
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"img_lockscreen_play_normal"] forState:UIControlStateNormal];
        self.isPlaying=NO;
    }


}



-(void)openSettingView{
    [self.tabBarController openSettingViews];

}

#pragma mark 代理方法

-(void)updateMusicInfo:(MusicInfoEntity *)entity{
    _songNameLabel.text=entity.songName;
    _singerNameLabel.text=entity.singerName;
}

-(void)updateTimeWithMax:(double)maxTimer Min:(double)minTimer{
    if (maxTimer==0) {
        _timeLabel.text=@"";
    }else{
        NSString * minStr=[NSString stringWithFormat:@"%d:%d",(int)minTimer/60,(int)(minTimer)%60];
        NSString * maxStr=[NSString stringWithFormat:@"%d:%d",(int)maxTimer/60,(int)(maxTimer)%60];
        _timeLabel.text=[NSString stringWithFormat:@"%@ - %@",minStr,maxStr];
    }
    [_progressBar updateProgress:(minTimer*100/maxTimer)];
    
    [self checkPlayStatus];
}



@end
