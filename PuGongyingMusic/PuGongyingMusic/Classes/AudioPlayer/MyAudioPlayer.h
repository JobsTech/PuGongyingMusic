//
//  MyAudioPlayer.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-22.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicInfoEntity.h"
#import "AudioPlayer.h"


@protocol MyAudioPlayerDelegate;

@interface MyAudioPlayer : NSObject

@property(nonatomic,weak)id<MyAudioPlayerDelegate>   tabBarAudioPlayerDelegate;

@property(nonatomic,weak)id<MyAudioPlayerDelegate>   musicPageAudioPlayerDelegate;

@property(nonatomic,strong,readonly)MusicInfoEntity *  currPlayMusic;


+(instancetype)shareMyAudioPlayer;

-(void)playWithMusicInfo:(MusicInfoEntity *)entity;

/**
 播放
 */
-(void)resume;

/**
 暂停播放
 */
-(void)pause;

-(void)nextMusic;
/**
 前一首播放
 */
-(void)preMusic;

-(AudioPlayerState)playStatus;

@end



@protocol MyAudioPlayerDelegate<NSObject>

-(void)updateMusicInfo:(MusicInfoEntity *)entity;

-(void)updateTimeWithMax:(double)maxTimer Min:(double)minTimer;


@end