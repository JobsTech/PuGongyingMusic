//
//  PGyMusicProgressBar.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYMusicProgressBar.h"




@interface PGYMusicProgressBar()

@property(nonatomic,assign) BOOL needSlipRect;

@property(nonatomic,assign) MusicProgressBarStyle style;

@property(nonatomic,strong) UIView * slipRect;

@property(nonatomic,strong) UIView * bgRect;

@property(nonatomic,strong) UIView * progressRect;

@end



@implementation PGYMusicProgressBar

- (id)initWithFrame:(CGRect)frame WithStyle:(MusicProgressBarStyle)style AndNeedSlip:(BOOL) needSlipRect
{
    self = [super initWithFrame:frame];
    if (self) {
        _style=style;
        _needSlipRect=needSlipRect;
        [self setUpViews];
    }
    return self;
}


-(void)setUpViews{
    if (_needSlipRect) {
        _slipRect=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self addSubview:_slipRect];
    }
    
    _bgRect = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    
    if (_style==MusicProgressBarStyleBlack) {
        [_bgRect setBackgroundColor:[UIColor blackColor]];
        
    }
    
    
    if (_style==MusicProgressBarStyleWhite) {
        [_bgRect setBackgroundColor:[UIColor whiteColor]];
    }

    [self addSubview:_bgRect];
    
    _progressRect=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, self.frame.size.height)];
    [_progressRect setBackgroundColor:[UIColor grayColor]];
    
    [self addSubview:_progressRect];
    


}




-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];

    if (_needSlipRect) {
        _progressRect.frame=CGRectMake(0, 0, 100, self.frame.size.height);
    }
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_needSlipRect) {
        _progressRect.frame=CGRectMake(0, 0, 200, self.frame.size.height);
    }

}


/**
 传入1-100 百分比
 */


-(void)updateProgress:(int)num{
    float progressW=self.frame.size.width/100*num;
    _progressRect.frame=CGRectMake(0, 0, progressW,self.frame.size.height);

}

@end
