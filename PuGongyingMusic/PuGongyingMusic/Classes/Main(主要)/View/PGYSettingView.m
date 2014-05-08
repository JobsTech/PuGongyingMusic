//
//  PGySettingView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-27.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYSettingView.h"

@implementation PGYSettingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
        [self setBackgroundColor:[UIColor greenColor]];
        
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        
        [btn setTitle:@"设置" forState:UIControlStateNormal];
        
        [self addSubview:btn];
    }
    return self;
}



-(void)setUpView{
    [self setBackgroundColor:[UIColor whiteColor]];
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
