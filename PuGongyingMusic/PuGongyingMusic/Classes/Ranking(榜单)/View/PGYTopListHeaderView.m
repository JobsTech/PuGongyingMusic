//
//  PGYTopListHeaderView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-13.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListHeaderView.h"

@implementation PGYTopListHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1]];
//        UITextField * title=[[UITextField alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width-40, self.frame.size.height)];
//        [title setBackgroundColor:[UIColor redColor]];
//        title.text=@"分类";
//
//        title.userInteractionEnabled=NO;
//        [self addSubview:title];
        //        title.contentMode=UIViewContentModeCenter;
        //        title.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        //        title.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;

    self.textLabel.text=@"分类";
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
