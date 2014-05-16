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







@interface PGYMusicListTableView()<UITableViewDataSource,UITableViewDelegate,PGYChartMusicListInterfaceDelegate,PGYSearchMusicListInterfaceDelegate>

@property(nonatomic,strong)NSString *keyWord;

@property(nonatomic,strong)NSString *chartId;

@property(nonatomic,assign)PGYMusicListType musicListType;

@property(nonatomic,strong)PGYChartMusicListInterface *chartMusicListInterface;

@property(nonatomic,strong)PGYSearchMusicListInterface *searchMusicListInterface;


@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation PGYMusicListTableView




- (id)initWithFrame:(CGRect)frame AndMusicListType:(PGYMusicListType)musicListType AndKeyWord:(NSString *)keyWord AndChartId:(NSString *)chartId
{
    
    self.musicListType=musicListType;
    self.keyWord=keyWord;
    self.chartId=chartId;
    self = [self initWithFrame:frame];
    
    
    
    return self;
}




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.dataSource=self;
        self.delegate=self;
        
        [self loadNetData];
    }
    return self;
}

-(void)loadNetData{
    if (self.musicListType==PGYMusicListNetChartMusicList) {
        [self.chartMusicListInterface downloadMusicListWithChartId:self.chartId AndPageNum:@"1" AndCurrPageCount:@"20"];
       
    }
    
    if (self.musicListType==PGYMusicListNetSearchMusicList) {
        [self.searchMusicListInterface downloadMusicListWithSearchKey:self.keyWord AndPageNum:@"1" AndCurrPageCount:@"20"];
    }



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
    
    
    [self deselectRowAtIndexPath:indexPath animated:NO];
}




-(void)arrayWithDownChartMusicListComplete:(NSMutableArray *)musicInfoArray{
    
   
    [self.dataArray addObjectsFromArray:musicInfoArray];
    
    
    [self reloadData];

}


-(void)arrayWithDownSearchMusicListComplete:(NSMutableArray *)musicInfoArray{
    
    [self.dataArray addObjectsFromArray:musicInfoArray];
    
    
    [self reloadData];

}


-(NSMutableArray *)dataArray{

    if (nil==_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}




-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"willdisappear");
    _searchMusicListInterface.delegate=nil;
    _searchMusicListInterface=nil;
    
}



-(void)dealloc{
    NSLog(@"dealloc");
    _searchMusicListInterface.delegate=nil;
    _searchMusicListInterface=nil;
    
}

@end
