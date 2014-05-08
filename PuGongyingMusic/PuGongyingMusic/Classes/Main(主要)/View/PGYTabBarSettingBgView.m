//
//  PGYTabBarSettingBgView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-6.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYTabBarSettingBgView.h"

@interface PGYTabBarSettingBgView()


@end


@implementation PGYTabBarSettingBgView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor blackColor]];
        self.userInteractionEnabled=YES;
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
        // Initialization code
       
    }
    return self;
}



@end
