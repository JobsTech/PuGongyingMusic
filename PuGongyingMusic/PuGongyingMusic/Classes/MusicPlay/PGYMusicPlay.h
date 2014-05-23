//
//  PGYMusicPlay.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-19.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicInfoEntity.h"

@interface PGYMusicPlay : NSObject

+(instancetype)shareMusicPlay;

-(void)playMusicWithMusic:(MusicInfoEntity *)entity;

@end
