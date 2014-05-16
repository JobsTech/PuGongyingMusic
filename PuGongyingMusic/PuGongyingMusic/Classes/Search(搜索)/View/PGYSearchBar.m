//
//  PGYSearchBar.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-16.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYSearchBar.h"

@implementation PGYSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.barStyle=UIBarStyleDefault;
        [self setBackgroundColor:[UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0]];
        
        self.alpha=0.7;
        
        
    }
    return self;
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
