//
//  PGYMusicListViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYMusicListViewController.h"
#import "PGYMusicListTableView.h"

@interface PGYMusicListViewController ()

@end

@implementation PGYMusicListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setUpViews];

}


- (void)setUpViews{
    
    PGYMusicListTableView *tableView=[[PGYMusicListTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60) AndMusicListType:PGYMusicListNetSearchMusicList AndKeyWord:@"周杰伦" AndChartId:nil];
    
    [self.view addSubview:tableView];

}








@end
