//
//  PGyMusicProgressBar.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGYMusicProgressBar : UIView

typedef NS_OPTIONS(NSInteger,MusicProgressBarStyle){
    
    MusicProgressBarStyleBlack,
    MusicProgressBarStyleWhite,
};

- (id)initWithFrame:(CGRect)frame WithStyle:(MusicProgressBarStyle)style AndNeedSlip:(BOOL) needSlipRect;



-(void)updateProgress:(int)num;


@end
