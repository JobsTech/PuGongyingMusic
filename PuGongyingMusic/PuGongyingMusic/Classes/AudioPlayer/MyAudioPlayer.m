//
//  MyAudioPlayer.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-22.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "MyAudioPlayer.h"
#import "AudioPlayer.h"



@interface MyAudioPlayer()<AudioPlayerDelegate>

@property(nonatomic,strong)AudioPlayer *  audioPlayer;
@property(nonatomic,strong)NSTimer *  timer;
@property(nonatomic,strong)NSMutableArray *  currPlayList;
@property(nonatomic,strong)NSString *  currPlayListId;

@end




@implementation MyAudioPlayer


static MyAudioPlayer * myAudioPlayer;

#pragma  mark  初始化部分

+(instancetype)shareMyAudioPlayer{

    if(!myAudioPlayer){
        myAudioPlayer=[[MyAudioPlayer alloc]init];
    }
    return myAudioPlayer;
}



/**
    初始化底层框架
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.audioPlayer=[[AudioPlayer alloc]init];
        self.audioPlayer.delegate=self;
        [self setupTimer];
    }
    return self;
}

/**
    设置每1/4 秒查看播放状态 ，调用代理更新状态方法。
 */

-(void) setupTimer
{
	self.timer = [NSTimer timerWithTimeInterval:0.25 target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
	[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


/**
    调用更新时间ui代理方法
 */

-(void) tick
{
    double min=0;
    double max=0;
    
	if (self.audioPlayer && self.audioPlayer.duration != 0)
	{
        min=self.audioPlayer.progress;
        max=self.audioPlayer.duration;
	}
	[self.tabBarAudioPlayerDelegate updateTimeWithMax:max Min:min];
    [self.musicPageAudioPlayerDelegate updateTimeWithMax:max Min:min];

    
}

#pragma  mark  播放部分

/**
    播放歌曲 ，通知ui代理方法 播放歌曲
 */

-(void)playWithMusicInfo:(MusicInfoEntity *)entity{
    
    _currPlayMusic=entity;
    
    [self.tabBarAudioPlayerDelegate updateMusicInfo:entity];
    [self.musicPageAudioPlayerDelegate updateMusicInfo:entity];
    
    if (entity.musicInfoType==MusicInfoTypesLocal) {
        [self playFromLocalFileWithFileName:entity.localResourceName FileType:entity.localResourceType];
    }
    
    if (entity.musicInfoType==MusicInfoTypesNet) {
        [self playFromHTTPUrl:entity.songListenDir];
    }
}

-(void) playFromHTTPUrl:(NSString *)urlString
{
	NSURL* url = [NSURL URLWithString:urlString];
    
	[self.audioPlayer setDataSource:[self.audioPlayer dataSourceFromURL:url] withQueueItemId:url];
}

-(void) playFromLocalFileWithFileName:(NSString *)name FileType:(NSString *)type
{
 
	NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:type];
	if (path) {
        NSURL* url = [NSURL fileURLWithPath:path];
        [self.audioPlayer setDataSource:[self.audioPlayer dataSourceFromURL:url] withQueueItemId:url];
    }else{
    
        NSLog(@"没有找到音乐");
    }
	
}

#pragma mark 播放控制

/**
  播放
 */
-(void)resume{
    [self.audioPlayer resume];
}


/**
 暂停播放
 */
-(void)pause{
    [self.audioPlayer pause];
}

/**
 下一首播放
 */
-(void)nextMusic{
    
//    [self playWithMusicInfo:];
}

/**
 前一首播放
 */
-(void)preMusic{
//    [self playWithMusicInfo:];
    
}

-(AudioPlayerState)playStatus{
    return self.audioPlayer.state;
}



#pragma  mark  audioPlayer代理方法



-(void) audioPlayer:(AudioPlayer*)audioPlayer stateChanged:(AudioPlayerState)state{



}


-(void) audioPlayer:(AudioPlayer*)audioPlayer didEncounterError:(AudioPlayerErrorCode)errorCode{



}


-(void) audioPlayer:(AudioPlayer*)audioPlayer didStartPlayingQueueItemId:(NSObject*)queueItemId{


}



-(void) audioPlayer:(AudioPlayer*)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject*)queueItemId{



}



-(void) audioPlayer:(AudioPlayer*)audioPlayer didFinishPlayingQueueItemId:(NSObject*)queueItemId withReason:(AudioPlayerStopReason)stopReason andProgress:(double)progress andDuration:(double)duration{
    
    NSLog(@"%f",progress);
    NSLog(@"%f",duration);


}




@end
