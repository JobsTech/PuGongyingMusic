//
//  PGYMusicListTableView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYMusicListTableView.h"
#import "PGYMusicListTableViewCell.h"
#import "PGYChartMusicListInterface.h"
#import "PGYSearchMusicListInterface.h"
#import "MusicInfoEntity.h"
#import "MJRefresh.h"
#import "PGYmusicPlay.h"
#import <AVFoundation/AVFoundation.h>
#import "AudioStreamer.h"
#import "MyAudioPlayer.h"




@interface PGYMusicListTableView()<UITableViewDataSource,UITableViewDelegate,PGYChartMusicListInterfaceDelegate,PGYSearchMusicListInterfaceDelegate>


{
    bool loadDataEnd;
}




@property(nonatomic,assign)PGYMusicListType musicListType;

@property(nonatomic,strong)PGYChartMusicListInterface *chartMusicListInterface;

@property(nonatomic,strong)PGYSearchMusicListInterface *searchMusicListInterface;


@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)AVAudioPlayer *  audioPlayer;

@property(nonatomic,strong)AudioStreamer *  audioStreamer;

@property(nonatomic,strong)MJRefreshFooterView *  footer;

@end

@implementation PGYMusicListTableView

#pragma mark 初始化部分


- (id)initWithFrame:(CGRect)frame AndMusicListType:(PGYMusicListType)musicListType AndKeyWord:(NSString *)keyWord AndChartId:(NSString *)chartId
{
    loadDataEnd=NO;
    self.musicListType=musicListType;
    self.keyWord=keyWord;
    self.chartId=chartId;
    self = [self initWithFrame:frame];
    
    
    
    return self;
}

/**
    取消掉下拉弹簧效果。  上拉可以 
 */

-(void)setContentOffset:(CGPoint)contentOffset{
    
    contentOffset.y=contentOffset.y<0?0:contentOffset.y;
    
    [super setContentOffset:contentOffset];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1]];
        self.separatorStyle=NO;
//        self.bounces=NO;
        self.dataSource=self;
        self.delegate=self;
        [self setUpViews];
    }
    return self;
}

-(void)setUpViews{
    [self addFooter];
    
}

- (void)addFooter
{
    __unsafe_unretained PGYMusicListTableView *tv=self;
    
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = self;
    
    footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        
        int pageNum=([tv->_dataArray  count]+19)/20+1;
        
        [tv performSelector:@selector(loadNetDataWithPageNum:) withObject:[NSString stringWithFormat:@"%d",pageNum]];
        
        NSLog(@"%@----开始进入刷新状态", refreshView.class);
    };
    _footer = footer;
}

-(void)loadNetDataWithPageNum:(NSString *)pageNum{
    if (self.musicListType==PGYMusicListNetChartMusicList) {
        [self.chartMusicListInterface downloadMusicListWithChartId:self.chartId AndPageNum:pageNum AndCurrPageCount:@"20"];
       
    }
    
    if (self.musicListType==PGYMusicListNetSearchMusicList) {
        [self.searchMusicListInterface downloadMusicListWithSearchKey:self.keyWord AndPageNum:pageNum AndCurrPageCount:@"20"];
    }
}


-(void)setChartId:(NSString *)chartId{
    if ([_chartId isEqual:chartId]) return;
    _chartId=chartId;
    self.musicListType=PGYMusicListNetChartMusicList;
    [self.dataArray removeAllObjects];
    [self loadNetDataWithPageNum:@"1"];
}

-(void)setKeyWord:(NSString *)keyWord{
    if ([_keyWord isEqual:keyWord]) return;
    self.musicListType=PGYMusicListNetSearchMusicList;
    _keyWord=keyWord;
    [self.dataArray removeAllObjects];
    [self loadNetDataWithPageNum:@"1"];
    
}

-(void)setPlayListId:(NSString *)playListId{
    if ([_playListId isEqual:playListId]) return;
    
    _playListId=playListId;
    [self.dataArray removeAllObjects];
}



-(PGYChartMusicListInterface *)chartMusicListInterface{

    if (nil==_chartMusicListInterface) {
        _chartMusicListInterface=[[PGYChartMusicListInterface alloc]init];
        _chartMusicListInterface.delegate=self;
    }
    return _chartMusicListInterface;
}


-(PGYSearchMusicListInterface *)searchMusicListInterface{

    if (nil==_searchMusicListInterface) {
        _searchMusicListInterface=[[PGYSearchMusicListInterface alloc]init];
        _searchMusicListInterface.delegate=self;
    }
    return _searchMusicListInterface;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.dataArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [PGYMusicListTableViewCell cellWithTableView:self AndMusicInfo:[self.dataArray objectAtIndex:indexPath.row]];



}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MusicInfoEntity *currPlayMusic=[self.dataArray objectAtIndex:indexPath.row];
    [[MyAudioPlayer  shareMyAudioPlayer] playWithMusicInfo:currPlayMusic];
    
//    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL URLWithString:currPlayMusic.songListenDir] error:nil];
//    
//    [self.audioPlayer play];
    
//    [self deselectRowAtIndexPath:indexPath animated:NO];
    
//    [[PGYMusicPlay shareMusicPlay] playMusicWithMusic:[self.dataArray objectAtIndex:indexPath.row]];
//    

    
//    NSURL *url = [NSURL URLWithString:currPlayMusic.ringListenDir];
//    [[AudioStreamer shareAudioStreamer] stop];
//    
//	self.audioStreamer = [[AudioStreamer shareAudioStreamer] initWithURL:url];
//    
//    [self.audioStreamer start];
    
}




-(void)arrayWithDownChartMusicListComplete:(NSMutableArray *)musicInfoArray{
    
    if (nil==musicInfoArray||[musicInfoArray count]==0) {
        loadDataEnd=YES;
        
    }
    
    [self.dataArray addObjectsFromArray:musicInfoArray];
    
    
    [self reloadData];
    
    [_footer endRefreshing];

}


-(void)arrayWithDownSearchMusicListComplete:(NSMutableArray *)musicInfoArray{
    if (nil==musicInfoArray||[musicInfoArray count]==0) {
        loadDataEnd=YES;
        
    }
    [self.dataArray addObjectsFromArray:musicInfoArray];
    
    
    [self reloadData];
    
    [_footer endRefreshing];

}


-(NSMutableArray *)dataArray{

    if (nil==_dataArray) {
        _dataArray=[NSMutableArray array];
//        MusicInfoEntity *entity=[[MusicInfoEntity alloc]init];
//        
//        entity.songName=@"zjl";
//        
//        entity.singerName=@"zjl zjl";
//        
//        for (int i=0; i<20; i++) {
//            
//        
//        
//        [_dataArray addObject:entity];
//        
//        }
    }
    return _dataArray;
}




-(void)free{
    [_footer free];
    _searchMusicListInterface.delegate=nil;
    _searchMusicListInterface=nil;

}

@end
