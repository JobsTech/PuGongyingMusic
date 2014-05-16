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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    PGYTopListMusicTableViewCell *cell=[PGYTopListMusicTableViewCell cellWithTableView:self];
    cell.superController=self.superController;
    return cell;
    
}





//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//
//    return [[PGYTopListHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
//
//}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 500;

}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat sectionHeaderHeight = 50;
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}



//设置cell选中事件
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"willSelectRow");
    return nil;


}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self deselectRowAtIndexPath:indexPath animated:NO];
//}


@end
