//
//  PGYTopListButton.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-13.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListButton.h"

@implementation PGYTopListButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        [super setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    }
    return self;
}


- (void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];

}


-(void)setHighlighted:(BOOL)highlighted{


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
