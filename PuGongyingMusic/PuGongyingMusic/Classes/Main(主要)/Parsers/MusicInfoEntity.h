//
//  MusicInfoEntity.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, MusicInfoTypes) {
    MusicInfoTypesLocal =0,
    MusicInfoTypesNet =1,
};


@interface MusicInfoEntity : NSObject <NSCoding, NSCopying>

	
// 点击量
// 彩玲有效期
// 彩玲价格
// 歌曲名称
// 歌手id
// 歌手name
// 振铃有效期
// 全曲有效期
// 专辑图片地址
// 歌手图片地址
// 彩玲试听地址
// 振铃试听地址
// 全曲试听地址
// 歌词地址





@property (nonatomic, strong) NSString *musicId;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *crbtValidity;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *songName;
@property (nonatomic, strong) NSString *singerId;
@property (nonatomic, strong) NSString *singerName;
@property (nonatomic, strong) NSString *ringValidity;
@property (nonatomic, strong) NSString *songValidity;
@property (nonatomic, strong) NSString *albumPicDir;
@property (nonatomic, strong) NSString *singerPicDir;
@property (nonatomic, strong) NSString *crbtListenDir;
@property (nonatomic, strong) NSString *ringListenDir;
@property (nonatomic, strong) NSString *songListenDir;
@property (nonatomic, strong) NSString *lrcDir;

@property(nonatomic,assign)MusicInfoTypes musicInfoType;

@property(nonatomic,strong)NSString *  localResourceName;
@property(nonatomic,strong)NSString *  localResourceType;

@end
