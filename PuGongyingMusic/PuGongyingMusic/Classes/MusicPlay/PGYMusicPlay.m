//
//  PGYMusicPlay.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-19.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYMusicPlay.h"
#import "MusicInfoEntity.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MPVolumeView.h>
#import <AVFoundation/AVFoundation.h>
#import "AudioStreamer.h"



@interface PGYMusicPlay()

@property(nonatomic,strong)NSMutableArray   *playList;
@property(nonatomic,strong)MusicInfoEntity *currPlayMusic;

@property(nonatomic,strong)NSString *  playListId;

@property(nonatomic,strong)AVAudioPlayer *  audioPlayer;

@property(nonatomic,strong)AudioStreamer *  audioStreamer;

@end



@implementation PGYMusicPlay

static PGYMusicPlay * musicPlay;


+(instancetype)shareMusicPlay{

    if (nil==musicPlay) {
        musicPlay=[[PGYMusicPlay alloc]init ];
    }
    
    
    return musicPlay;

}




-(id)init{
    
    self=[super init];
    if (self) {
//        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[musicArray[musicArrayNumber] name] ofType:@"mp3"]] error:nil];
    }
    return self;

}


/**
    播放
 */
-(void)play{
    

}

/**
 播放上一首歌曲
 */
-(void)playPreMusic{
    if ([self.playList count]==0) {
        [self setCurrPlayMusic:self.currPlayMusic];
    }else{
        int index=[self.playList indexOfObject:self.currPlayMusic];
        index=index==0?[self.playList count]-1:index-1;
        self.currPlayMusic=[self.playList objectAtIndex:index];
    }
}


/**
 播放下一首
 */
-(void)playNextMusic{
    if ([self.playList count]==0) {
        [self setCurrPlayMusic:self.currPlayMusic];
    }else{
        int index=[self.playList indexOfObject:self.currPlayMusic];
        index=index==[self.playList count]-1?0:index+1;
        self.currPlayMusic=[self.playList objectAtIndex:index];
    }
    
}

/**
    暂停播放
 */
-(void)stop{

}
/**
    播放列表修改时候调用更新播放列表
 */
-(void)updatePlayList:(NSMutableArray *)playList WithPlayListId:(NSString *)playListId{
    if ([_playListId isEqualToString:playListId]) {
        _playListId=playListId;
        _playList=playList;
        
    }
    

}


/**
    播放新播放列表  替换播放列表
 */
-(void)changePlayList:(NSMutableArray *)playList WithPlayListId:(NSString *)playListId{

        _playListId=playListId;
        _playList=playList;
    
    
}



/**
    播放榜单单曲，传递过来榜单替换掉原榜单。
 */
-(void)playMusicWithMusic:(MusicInfoEntity *)entity WithPlayList:(NSMutableArray *)playList WithPalyListId:(NSString *)playListId{

    self.currPlayMusic=entity;
    [self changePlayList:playList WithPlayListId:playListId];


}





/**
    播放单曲，播放列表就一首歌曲， 网络榜单调用。
 
 */
-(void)playMusicWithMusic:(MusicInfoEntity *)entity{
    
    self.currPlayMusic=entity;
    self.playListId=nil;
    self.playList=[NSMutableArray array];
    [self.playList addObject:entity];
    
}


/**
    随机歌曲
 */
-(void)playRandomMusic{
    float i=random()%[self.playList count];
    self.currPlayMusic=[self.playList objectAtIndex:i];
}


/**
    设置当前歌曲时候直接播放
 */
- (void)setCurrPlayMusic:(MusicInfoEntity *)currPlayMusic{
    
    _currPlayMusic=currPlayMusic;
//    
//    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL URLWithString:currPlayMusic.ringListenDir] error:nil];
//
//    
//    
//    
//    [self.audioPlayer play];

    
    NSURL *url = [NSURL URLWithString:currPlayMusic.ringListenDir];
	self.audioStreamer = [[AudioStreamer alloc] initWithURL:url];
    [self.audioStreamer start];
}


-(NSMutableArray *)playList{
    if (nil==_playList) {
        _playList=[NSMutableArray array];
    }
    return _playList;
}







/***/



/***/









@end
