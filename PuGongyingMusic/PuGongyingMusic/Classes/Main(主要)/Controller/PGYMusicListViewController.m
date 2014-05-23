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

@property(nonatomic,strong)PGYMusicListTableView *  tableView;
@end

@implementation PGYMusicListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0]];
    
    
    
    [self setUpViews];

}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
//    self.navigationController.navigationBar.alpha=0.7;
    
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        [view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    }
}



- (void)setUpViews{
    
    UIImageView *bgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgView.image=[UIImage imageNamed:@"000@2x.jpg"];
    [self.view insertSubview:bgView atIndex:0];
    
    
    
//    self.tableView=[[PGYMusicListTableView alloc]initWithFrame:CGRectMake(0, 63, self.view.frame.size.width, self.view.frame.size.height-63-50) AndMusicListType:PGYMusicListNetSearchMusicList AndKeyWord:@"周杰伦" AndChartId:nil];
    self.tableView=[[PGYMusicListTableView alloc]initWithFrame:CGRectMake(0, 63, self.view.frame.size.width, self.view.frame.size.height-63-50)];
    if (_chartId) {
        [self.tableView setChartId:_chartId];
    }
    if (_playListId) {
        [self.tableView setPlayListId:_playListId];
    }
    if (_keyWord) {
        [self.tableView setKeyWord:_keyWord];
    }
    [self.view addSubview:self.tableView];
    
}



-(void)setChartId:(NSString *)chartId{
    _chartId=chartId;
    [self.tableView setChartId:chartId];
}


-(void)setKeyWord:(NSString *)keyWord{
    _keyWord=keyWord;
    [self.tableView setKeyWord:keyWord];
}

-(void)setPlayListId:(NSString *)playListId{
    _playListId=playListId;
    [self.tableView setPlayListId:playListId];
    
}



-(void)dealloc{
    [self.tableView free];

}





@end
