//
//  PGYViewController.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGYTabBarController : UITabBarController

-(void)moveTarBarControllerWithPanGestureRecognizer:(UIPanGestureRecognizer *)recongnizer WithShow:(BOOL)isShowSetting;

@end
