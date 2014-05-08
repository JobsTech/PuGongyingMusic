//
//  PGYTabBarViewController.m
//  PuGongyingMusic
//
//  Created by wangtao on 14-5-7.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTabBarViewController.h"

@interface PGYTabBarViewController ()

@end

@implementation PGYTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.tabBarItem.title = @"首页";//2014年05月07日17:01:07王涛修改
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
