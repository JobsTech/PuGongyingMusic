//
//  UIEvent+Expand.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-27.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "UIEvent+Expand.h"

@implementation UIEvent (Expand)



/**
 获取touch的位置
 */
-(CGPoint)pointEventWithView:(UIView *)view{
    NSSet *allTouches=[self allTouches];
    UITouch *touch=[allTouches anyObject];
    return [touch locationInView:view];
}

@end
