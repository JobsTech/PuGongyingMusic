//
//  PGYTabBarMusicPlayView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYTabBarMusicPlayView.h"
#import "UIEvent+Expand.h"



@interface PGYTabBarMusicPlayView()
@property (nonatomic,assign)CGPoint startTouchPoint;

@property(nonatomic,strong)UITapGestureRecognizer *tap;

@property(nonatomic,assign)NSTimeInterval startTouchTimeInterval;


@end



@implementation PGYTabBarMusicPlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUpView];
        
        [self addEvent];
    }
    return self;
}



- (void) setUpView{
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    imgView.image=[UIImage imageNamed:@"000.jpg"];
    [self insertSubview:imgView atIndex:0];

}


-(void)addEvent{
   

}






-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    _startTouchPoint=[event pointEventWithView:self.superview];
    _startTouchTimeInterval=[[NSDate date] timeIntervalSince1970]*1;

}




-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint moveTouchPoint=[event pointEventWithView:self.superview];
 
    
    [self moveViewWithPointY:(moveTouchPoint.y-_startTouchPoint.y)];
    
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint endTouchPoint=[event pointEventWithView:self.superview];
    
    NSTimeInterval timeInterval=[[NSDate date] timeIntervalSince1970]*1-_startTouchTimeInterval;
    float pointY=endTouchPoint.y-_startTouchPoint.y;
    
    //清扫
    if (timeInterval<0.5 && pointY>50) {
        [self hideViewWithDown];
        return;
    }
    if (timeInterval<0.5 && pointY<-50) {
        [self hideViewWithUp];
        return;
    }
    
    
    
    //向下hidden；
    if (pointY>=(self.frame.size.height*0.5)) {
        [self hideViewWithDown];
    }else if(pointY>=(self.frame.size.height*0.5)){
    //向上hidden；
        [self hideViewWithUp];
    }else{
    //显示全部
        [self showView];
    }
}


-(void)moveViewWithPointY:(float)pointY{
    [self moveMusicPlayViewWithPointY:pointY WithAnim:NO WithFinashHide:NO];
}


-(void)showView{
    [self moveMusicPlayViewWithPointY:0 WithAnim:YES WithFinashHide:NO];
}


-(void)hideViewWithUp{
    [self moveMusicPlayViewWithPointY:-self.frame.size.height WithAnim:YES WithFinashHide:YES];

}


-(void)hideViewWithDown{
    [self moveMusicPlayViewWithPointY:self.frame.size.height WithAnim:YES WithFinashHide:YES];
}





-(void)moveMusicPlayViewWithPointY:(float)y WithAnim:(BOOL)anim WithFinashHide:(BOOL)hide{
    
    
    if (anim) {
        [UIView animateWithDuration:1 animations:^{
            
           self.frame=CGRectMake(0, y, self.frame.size.width, self.frame.size.height);
            
        } completion:^(BOOL finished){
            
            if (hide) {
                [_delegate finashedHideTabBarMusicPlayView ];
            }
        }];
    }else{
        self.frame=CGRectMake(0, y, self.frame.size.width, self.frame.size.height);
    }   
}


@end
