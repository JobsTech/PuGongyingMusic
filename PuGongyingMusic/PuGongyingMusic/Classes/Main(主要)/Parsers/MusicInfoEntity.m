//
//  MusicInfoEntity.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "MusicInfoEntity.h"


@implementation MusicInfoEntity



#pragma mark -
#pragma mark Intilization Methods
#pragma mark -
- (id) init
{
	if (!(self = [super init]))
		return nil;
	
	_musicId = nil;
    _count = nil;
    _crbtValidity = nil;
    _price = nil;
    _songName = nil;
    _singerId = nil;
    _singerName = nil;
    _ringValidity = nil;
    _songValidity = nil;
    _albumPicDir = nil;
    _singerPicDir = nil;
    _crbtListenDir = nil;
    _ringListenDir = nil;
    _songListenDir = nil;
    _lrcDir = nil;
	
	return self;
}

- (void) dealloc
{
	
}

#pragma mark -
#pragma mark NSCoding OR NSCopying Methods
#pragma mark -
- (void) encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:self.musicId forKey:@"musicId"];
    [coder encodeObject:self.count forKey:@"count"];
    [coder encodeObject:self.crbtValidity forKey:@"crbtValidity"];
    [coder encodeObject:self.price forKey:@"price"];
    [coder encodeObject:self.songName forKey:@"songName"];
    [coder encodeObject:self.singerId forKey:@"singerId"];
    [coder encodeObject:self.singerName forKey:@"singerName"];
    [coder encodeObject:self.ringValidity forKey:@"ringValidity"];
    [coder encodeObject:self.songValidity forKey:@"songValidity"];
    [coder encodeObject:self.albumPicDir forKey:@"albumPicDir"];
    [coder encodeObject:self.singerPicDir forKey:@"singerPicDir"];
    [coder encodeObject:self.crbtListenDir forKey:@"crbtListenDir"];
    [coder encodeObject:self.ringListenDir forKey:@"ringListenDir"];
    [coder encodeObject:self.songListenDir forKey:@"songListenDir"];
    [coder encodeObject:self.lrcDir forKey:@"lrcDir"];
}

- (id) initWithCoder:(NSCoder *)decoder
{
	if (self = [super init])
	{
		self.musicId = [decoder decodeObjectForKey:@"musicId"];
        self.count = [decoder decodeObjectForKey:@"count"];
        self.crbtValidity = [decoder decodeObjectForKey:@"crbtValidity"];
        self.price = [decoder decodeObjectForKey:@"price"];
        self.songName = [decoder decodeObjectForKey:@"songName"];
        self.singerId = [decoder decodeObjectForKey:@"singerId"];
        self.singerName = [decoder decodeObjectForKey:@"singerName"];
        self.ringValidity = [decoder decodeObjectForKey:@"ringValidity"];
        self.songValidity = [decoder decodeObjectForKey:@"songValidity"];
        self.albumPicDir = [decoder decodeObjectForKey:@"albumPicDir"];
        self.singerPicDir = [decoder decodeObjectForKey:@"singerPicDir"];
        self.crbtListenDir = [decoder decodeObjectForKey:@"crbtListenDir"];
        self.ringListenDir = [decoder decodeObjectForKey:@"ringListenDir"];
        self.songListenDir = [decoder decodeObjectForKey:@"songListenDir"];
        self.lrcDir = [decoder decodeObjectForKey:@"lrcDir"];
	}
	
	return self;
}

- (id) copyWithZone:(NSZone *)zone
{
	MusicInfoEntity* entity = [[[self class] allocWithZone:zone] init];
	entity.musicId = self.musicId;
    entity.count = self.count;
    entity.crbtValidity = self.crbtValidity;
    entity.price = self.price;
    entity.songName = self.songName;
    entity.singerId = self.singerId;
    entity.singerName = self.singerName;
    entity.ringValidity = self.ringValidity;
    entity.songValidity = self.songValidity;
    entity.albumPicDir = self.albumPicDir;
    entity.singerPicDir = self.singerPicDir;
    entity.crbtListenDir = self.crbtListenDir;
    entity.ringListenDir = self.ringListenDir;
    entity.songListenDir = self.songListenDir;
    entity.lrcDir = self.lrcDir;
	
	return entity;
}

@end

