//
//  PGYTabBarMusicPlayView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYTabBarMusicPlayView.h"
#import "UIEvent+Expand.h"
#import "PGYMusicProgressBar.h"
#import "MyAudioPlayer.h"


@interface PGYTabBarMusicPlayView()<MyAudioPlayerDelegate>


@property (nonatomic,assign)CGPoint startTouchPoint;

@property(nonatomic,strong)UITapGestureRecognizer *tap;

@property(nonatomic,assign)NSTimeInterval startTouchTimeInterval;

@property(nonatomic,strong)UIImageView *  imgBgView;

@property(nonatomic,strong)UILabel *  songNameLabel;

@property(nonatomic,strong)UIButton *  backButton;

@property(nonatomic,strong)UILabel *  lrcLabel;

@property(nonatomic,strong)UILabel *  leftTimeLabel;
@property(nonatomic,strong)UILabel *  rightTimeLabel;

@property(nonatomic,strong)PGYMusicProgressBar *  progressBar;

@property(nonatomic,strong)UIButton *  playButton;

@property(nonatomic,strong)UIButton *  prePlayButton;

@property(nonatomic,strong)UIButton *  nextPlayButton;

@property(nonatomic,strong)UIButton *  playTypeButton;

@property(nonatomic,strong)UIButton *  likeButton;

@property(nonatomic,assign)BOOL  isPlaying;

@end



@implementation PGYTabBarMusicPlayView

#pragma mark  初始化部分


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [MyAudioPlayer shareMyAudioPlayer].musicPageAudioPlayerDelegate=self;
        self.userInteractionEnabled=YES;
        [self setUpView];
        
        [self addEvent];
    }
    return self;
}



- (void) setUpView{
    float mainW=self.frame.size.width;
    float mainH=self.frame.size.height;
    
    
    //背景
    
    self.imgBgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.imgBgView.image=[UIImage imageNamed:@"000.jpg"];
    [self insertSubview:self.imgBgView atIndex:0];
    
    //top部分
    float topViewH=40;
    
    UIView * topView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, topViewH)];
    [topView setBackgroundColor:[UIColor clearColor]];
    topView.userInteractionEnabled=YES;
    [self addSubview:topView];
    
    
    //返回
    float backButtonW=30;
    UIImageView * backImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, backButtonW, topViewH)];
    backImage.userInteractionEnabled=YES;
    UITapGestureRecognizer *recognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideViewWithUp)];
    [backImage addGestureRecognizer:recognizer];
    backImage.contentMode=UIViewContentModeCenter;
    backImage.image=[UIImage imageNamed:@"img_actionitem_back_white"];
    [topView addSubview:backImage];
    
    
    //歌手歌名
    float songNameLabelW=mainW-backButtonW;
    self.songNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(backButtonW, 0, songNameLabelW, topViewH)];
    [self.songNameLabel setTextColor:[UIColor whiteColor]];
    [self.songNameLabel setFont:[UIFont systemFontOfSize:15]];
    [topView addSubview:self.songNameLabel];
    
    
    
    
    
    //bottom部分
    float bottomH=115;
    
    UIView * bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, mainH-bottomH, mainW, bottomH)];
    [bottomView setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:bottomView];
    
    
    //歌词
    float lrcLabelH=40;
    UIFont *lrcFlont=[UIFont systemFontOfSize:14];
    UIColor *lrcColor=[UIColor whiteColor];
    self.lrcLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, mainW, lrcLabelH)];
    self.lrcLabel.font=lrcFlont;
    self.lrcLabel.textColor=lrcColor;
    self.lrcLabel.text=@"遗憾的时真想  早晚要面对 ";
    self.lrcLabel.textAlignment=NSTextAlignmentCenter;
    self.lrcLabel.contentMode=UIViewContentModeCenter;
    [bottomView addSubview:self.lrcLabel];
    
    
    
    
    

    
    //进度条
    float progressBarX=20;
    float progressBarY=lrcLabelH+20;
    float progressBarW=mainW-2*progressBarX;
    float progressBarH=1;
    
    self.progressBar=[[PGYMusicProgressBar alloc]initWithFrame:CGRectMake(progressBarX, progressBarY, progressBarW, progressBarH) WithStyle:MusicProgressBarStyleBlack AndNeedSlip:YES];
    
    [bottomView addSubview:self.progressBar];
    
    //时间
    float timeLabelW=30;
    float timeLabelH=10;
    float timeLabelY=lrcLabelH+5;
    float leftTimeLabelX=progressBarX+5;
    UIFont *timeFont=[UIFont systemFontOfSize:10];
    UIColor *timeColor=[UIColor grayColor];
    
    self.leftTimeLabel=[[UILabel  alloc]initWithFrame:CGRectMake(leftTimeLabelX, timeLabelY, timeLabelW, timeLabelH)];
    
    self.leftTimeLabel.text=@"01:26";
    self.leftTimeLabel.font=timeFont;
    self.leftTimeLabel.textColor=timeColor;
    float rightTimeLabelX=mainW-leftTimeLabelX-timeLabelW;
    self.rightTimeLabel=[[UILabel  alloc]initWithFrame:CGRectMake(rightTimeLabelX, timeLabelY, timeLabelW, timeLabelH)];
    self.rightTimeLabel.font=timeFont;
    self.rightTimeLabel.textColor=timeColor;
    self.rightTimeLabel.text=@"01:26";
    
    [bottomView addSubview:self.leftTimeLabel];
    
    [bottomView addSubview:self.rightTimeLabel];
    
    
    
    
    //播放
    float playY=progressBarY+10;
    float playH=40;
    float playW=40;
    float playX=mainW*0.5-playW*0.5;
    
    self.playButton =[[UIButton alloc]initWithFrame:CGRectMake(playX, playY, playW, playH)];
    [self.playButton addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"img_button_playcontrolbar_transparent_play_normal"] forState:UIControlStateNormal];
    
    [bottomView addSubview:self.playButton];
    
    
    //播放模式
    float playTypeX=10;
    
    self.playTypeButton =[[UIButton alloc]initWithFrame:CGRectMake(playTypeX, playY, 40, playH)];
    
    [self.playTypeButton setBackgroundImage:[UIImage imageNamed:@"img_playmode_repeat"] forState:UIControlStateNormal];
    
    [bottomView addSubview:self.playTypeButton];
    
    //like
    float likeX=mainW-10-40;
    
    self.likeButton =[[UIButton alloc]initWithFrame:CGRectMake(likeX, playY, 40, playH)];
    
    [self.likeButton setBackgroundImage:[UIImage imageNamed:@"img_favourite_normal"] forState:UIControlStateNormal];
    
    [bottomView addSubview:self.likeButton];
    
    
    //前进后退
    float prePlayX=playTypeX+50;
    
    self.prePlayButton =[[UIButton alloc]initWithFrame:CGRectMake(prePlayX, playY, 40, playH)];
    
    [self.prePlayButton setBackgroundImage:[UIImage imageNamed:@"img_button_prev_landscape_normal"] forState:UIControlStateNormal];
    
    [bottomView addSubview:self.prePlayButton];
    
    float nextPlayX=likeX-50;
    
    self.nextPlayButton =[[UIButton alloc]initWithFrame:CGRectMake(nextPlayX, playY, 40, playH)];
    
    [self.nextPlayButton setBackgroundImage:[UIImage imageNamed:@"img_button_next_landscape_normal"] forState:UIControlStateNormal];
    
    [bottomView addSubview:self.nextPlayButton];
    
    
    

}


-(void)addEvent{
   

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


#pragma mark 代理方法



-(void)updateMusicInfo:(MusicInfoEntity *)entity{
    self.songNameLabel.text=[NSString stringWithFormat:@"%@-%@",entity.singerName,entity.songName];


}

-(void)updateTimeWithMax:(double)maxTimer Min:(double)minTimer{
    if (maxTimer==0) {
        self.leftTimeLabel.text=@"";
        self.rightTimeLabel.text=@"";
    }else{
        self.leftTimeLabel.text=[NSString stringWithFormat:@"%d:%d",(int)minTimer/60,(int)(minTimer)%60];
        self.rightTimeLabel.text=[NSString stringWithFormat:@"%d:%d",(int)maxTimer/60,(int)(maxTimer)%60];
       
    }
    [self.progressBar updateProgress:(minTimer*100/maxTimer)];
    
    [self checkPlayStatus];



}



-(void)checkPlayStatus{
    if ([[MyAudioPlayer shareMyAudioPlayer] playStatus]==AudioPlayerStatePlaying) {
        if (self.isPlaying) return;
        [self.playButton setBackgroundImage:[UIImage imageNamed:@"img_button_playcontrolbar_transparent_pause_normal"] forState:UIControlStateNormal];
        self.isPlaying=YES;
    }else{
        if (!self.isPlaying) return;
        [self.playButton setBackgroundImage:[UIImage imageNamed:@"img_button_playcontrolbar_transparent_play_normal"] forState:UIControlStateNormal];
        self.isPlaying=NO;
    }
    
    
}




#pragma mark  检测触摸事



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    _startTouchPoint=[event pointEventWithView:self.superview];
    _startTouchTimeInterval=[[NSDate date] timeIntervalSince1970]*1;

}




-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint moveTouchPoint=[event pointEventWithView:self.superview];
 
    
    [self moveViewWithPointY:(moveTouchPoint.y-_startTouchPoint.y)];
    
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint endTouchPoint=[event pointEventWithView:self.superview];
    
    NSTimeInterval timeInterval=[[NSDate date] timeIntervalSince1970]*1-_startTouchTimeInterval;
    float pointY=endTouchPoint.y-_startTouchPoint.y;
    
    //清扫
    if (timeInterval<0.5 && pointY>50) {
        [self hideViewWithDown];
        return;
    }
    if (timeInterval<0.5 && pointY<-50) {
        [self hideViewWithUp];
        return;
    }
    
    
    
    //向下hidden；
    if (pointY>=(self.frame.size.height*0.5)) {
        [self hideViewWithDown];
    }else if(pointY>=(self.frame.size.height*0.5)){
    //向上hidden；
        [self hideViewWithUp];
    }else{
    //显示全部
        [self showView];
    }
}


-(void)moveViewWithPointY:(float)pointY{
    [self moveMusicPlayViewWithPointY:pointY WithAnim:NO WithFinashHide:NO];
}


-(void)showView{
    [self moveMusicPlayViewWithPointY:0 WithAnim:YES WithFinashHide:NO];
}


-(void)hideViewWithUp{
    [self moveMusicPlayViewWithPointY:-self.frame.size.height WithAnim:YES WithFinashHide:YES];

}


-(void)hideViewWithDown{
    [self moveMusicPlayViewWithPointY:self.frame.size.height WithAnim:YES WithFinashHide:YES];
}





-(void)moveMusicPlayViewWithPointY:(float)y WithAnim:(BOOL)anim WithFinashHide:(BOOL)hide{
    if (anim) {
        [UIView animateWithDuration:1 animations:^{
            
           self.frame=CGRectMake(0, y, self.frame.size.width, self.frame.size.height);
            
        } completion:^(BOOL finished){
            if (y<0) {
                self.frame=CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
            }
            if (hide) {
                [_delegate finashedHideTabBarMusicPlayView ];
            }
        }];
    }else{
        self.frame=CGRectMake(0, y, self.frame.size.width, self.frame.size.height);
    }   
}


@end
