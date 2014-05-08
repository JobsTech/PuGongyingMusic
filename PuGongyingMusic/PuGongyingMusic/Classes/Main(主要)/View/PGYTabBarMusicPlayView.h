//
//  PGYTabBarMusicPlayView.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PGYTabBarMusicPlayViewDelegate<NSObject>
@required
-(void)finashedHideTabBarMusicPlayView;
@end


@interface PGYTabBarMusicPlayView : UIView

@property(nonatomic,assign)id<PGYTabBarMusicPlayViewDelegate> delegate;

-(void)moveViewWithPointY:(float)pointY;

-(void)showView;

-(void)hideViewWithDown;


@end
