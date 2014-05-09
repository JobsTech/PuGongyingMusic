//
//  PGYSearchMusicListInterface.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <Foundation/Foundation.h>





@protocol PGYSearchMusicListInterfaceDelegate;


@interface PGYSearchMusicListInterface : NSObject

@property (nonatomic,weak)id<PGYSearchMusicListInterfaceDelegate> delegate;
- (void) downloadMusicListWithSearchKey:(NSString*)keyWord AndPageNum:(NSString *)pageNum AndCurrPageCount:(NSString *)currPageCount;

@end

@protocol PGYSearchMusicListInterfaceDelegate <NSObject>

-(void)arrayWithDownSearchMusicListComplete:(NSMutableArray *)musicInfoArray;

@end
