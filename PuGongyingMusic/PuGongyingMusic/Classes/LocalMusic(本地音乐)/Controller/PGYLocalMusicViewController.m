//
//  PGYLocalMusicViewController.m
//  PuGongyingMusic
//
//  Created by wangtao on 14-5-7.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYLocalMusicViewController.h"

@interface PGYLocalMusicViewController ()

@end

@implementation PGYLocalMusicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
        
        [btn setTitle:@"我的" forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
