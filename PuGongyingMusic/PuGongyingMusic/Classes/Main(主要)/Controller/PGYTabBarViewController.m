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
        
        [self setUpViews];
    }
    return self;
}

-(void)setUpViews{


}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{


}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{



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
