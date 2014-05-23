//
//  PGySettingView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-27.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYSettingView.h"
#import "PGYSettingModel.h"
#import "PGYSettingViewController.h"
#import "PGYSettingTableViewCell.h"
#import "PGYSettingTableView.h"
#import "MJAboutViewController.h"

@interface PGYSettingView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)PGYSettingTableView * tableView;

@end



@implementation PGYSettingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
         [self setBackgroundColor:[UIColor blackColor]];
//        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//        [btn setBackgroundColor:[UIColor blueColor]];
//        
//        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//        [btn setTitle:@"设置" forState:UIControlStateNormal];
//        [self addSubview:btn];
    }
    return self;
}



-(void)click{

   
}





-(void)setUpView{
    self.userInteractionEnabled=YES;
    [self setBackgroundColor:[UIColor whiteColor]];
    self.tableView=[[PGYSettingTableView alloc]initWithFrame:CGRectMake(10, 80, self.frame.size.width-20,self.frame.size.height-80)];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self addSubview:self.tableView];
}






-(NSMutableArray *)dataArray{
    if (nil==_dataArray) {
        _dataArray=[NSMutableArray array];
       PGYSettingModel *model=[[PGYSettingModel alloc]init];
        model.title=@"全部循环";
        model.imageName=@"img_playmode_repeat";
        
        
        model.title=@"单曲循环";
        model.imageName=@"img_playmode_repeatone";
        
        model.title=@"顺序播放";
        model.imageName=@"img_playmode_sequence";
        
        model.title=@"随机播放";
        model.imageName=@"img_playmode_shuffle";
        
        [_dataArray addObject:model];
        
        PGYSettingModel *model1=[[PGYSettingModel alloc]init];
        model1.title=@"更换背景";
        model1.imageName=@"img_main_right_menuitem_changeskin";
        [_dataArray addObject:model1];
        
        PGYSettingModel *model2=[[PGYSettingModel alloc]init];
        model2.title=@"睡眠定时";
        model2.imageName=@"img_main_right_menuitem_time";
        [_dataArray addObject:model2];
        
        PGYSettingModel *model3=[[PGYSettingModel alloc]init];
        model3.title=@"关于我们";
        model3.actionControllerClass=[MJAboutViewController class];
        model3.imageName=@"img_main_right_menuitem_setting";
        [_dataArray addObject:model3];
        
    }
    
    return _dataArray;

}


//-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
// NSLog(@"sssssssssssssssssssssssssssssssssssssss-------------------");
//
//    return indexPath;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UINavigationController *navController=[[UINavigationController alloc]init];
    
    PGYSettingModel *model=[self.dataArray objectAtIndex:indexPath.row];
    
    
    PGYSettingViewController *controller=[[PGYSettingViewController alloc]init];
    if (model.actionControllerClass) {
        [navController pushViewController:[[model.actionControllerClass alloc]init]  animated:YES];
    }else{
    [navController pushViewController:controller animated:NO];
    }
    
    
    [self.tabBarController presentViewController:navController animated:NO completion:^{
            
    }];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PGYSettingModel *model=[self.dataArray objectAtIndex:indexPath.row];
    
    PGYSettingTableViewCell *cell=[PGYSettingTableViewCell cellWithTableView:self.tableView AndSettingModel:model];
    
    
    return cell;
    
    
}



@end
