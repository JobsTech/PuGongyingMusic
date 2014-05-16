//
//  PGYTopListMusicViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-8.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListMusicViewController.h"
#import "PGYChartInfoInterface.h"
#import "ChartInfoEntity.h"
#import "PGYTopListMusicTableView.h"
#import "PGYTopListClassifyView.h"


@interface PGYTopListMusicViewController ()<PGYChartInfoInterfaceDelegate>
{
    PGYChartInfoInterface * chartInfoInterface;

}

@end

@implementation PGYTopListMusicViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    chartInfoInterface=[[PGYChartInfoInterface alloc]init];
    chartInfoInterface.delegate=self;
//    [chartInfoInterface downloadChartInfoWithPageNum:@"1" AndCurrPageCount:@"20"];
    
    
    [self setUpViews];
}



-(void)setUpViews{
    
    
//     PGYTopListClassifyView *topListClassifyView=[[PGYTopListClassifyView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
//    
//    [self.view addSubview:topListClassifyView];
    
    PGYTopListMusicTableView *tableView=[[PGYTopListMusicTableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60-50)];
    tableView.superController=self.superController;
    [self.view addSubview:tableView];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)arrayWithDownChartInfoComplete:(NSMutableArray *)chartInfoArray{
    for (ChartInfoEntity *model in chartInfoArray) {
        NSLog(@"%@",model);
    }

    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
