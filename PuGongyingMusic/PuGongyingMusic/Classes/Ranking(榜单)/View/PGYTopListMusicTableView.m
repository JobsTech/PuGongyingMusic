//
//  PGYTopListMusicTableView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListMusicTableView.h"
#import "PGYTopListMusicTableViewCell.h"
#import "PGYTopListClassifyView.h"
#import "PGYTopListHeaderView.h"
#import "PGYTopListModel.h"
#import "PGYTopListBtnModel.h"


@interface PGYTopListMusicTableView()<UITableViewDataSource,UITableViewDelegate>



@end




@implementation PGYTopListMusicTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.dataSource =self;
        self.delegate=self;
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1]];
        //取消分割线
        self.separatorStyle=NO;
        self.bounces=NO;
        
        self.sectionHeaderHeight=50;
        
    }
    return self;
}

-(void)setTopListModelArray:(NSMutableArray *)topListModelArray{
    _topListModelArray=topListModelArray;
    [self reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.topListModelArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    PGYTopListMusicTableViewCell *cell=[PGYTopListMusicTableViewCell cellWithTableView:self];
    cell.superController=self.superController;
    cell.topListModel=[self.topListModelArray objectAtIndex:indexPath.row];
    return cell;
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    PGYTopListModel * listModel=[self.topListModelArray objectAtIndex:indexPath.row];
    
    int num=[listModel.btnArray count];
    
    float contentBtnWH=(self.frame.size.width-10*4)/3+10;
    
    int height=(num+2)/3*contentBtnWH+50+10;
    
    return height;

}




//设置cell选中事件
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}



@end
