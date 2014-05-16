//
//  PGYMusicListTableView.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGYMusicListTableView : UITableView

typedef NS_ENUM(NSInteger, PGYMusicListType) {
    PGYMusicListNetChartMusicList,
    PGYMusicListNetSearchMusicList,
    PGYMusicListLocalMusicList,
};

- (id)initWithFrame:(CGRect)frame AndMusicListType:(PGYMusicListType)musicListType AndKeyWord:(NSString *)keyWord AndChartId:(NSString *)chartId;



@end
