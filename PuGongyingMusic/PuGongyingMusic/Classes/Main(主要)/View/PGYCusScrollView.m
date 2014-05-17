//
//  PGyCusScrollView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-6.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYCusScrollView.h"

@implementation PGYCusScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
    }
    return self;
}


-(void)setContentOffset:(CGPoint)contentOffset{
    
    [super setContentOffset:CGPointMake(contentOffset.x, 0)];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/





//-(BOOL)touchesShouldCancelInContentView:(UIView *)view{
//
//    NSLog(@"sssssssssssmoveing............");
//    
//    return YES;
//
//}


@end
