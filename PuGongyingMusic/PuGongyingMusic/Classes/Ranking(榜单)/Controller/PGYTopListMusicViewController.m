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

@interface PGYTopListMusicViewController ()<PGYChartInfoInterfaceDelegate>
{
    PGYChartInfoInterface * chartInfoInterface;

}

@end

@implementation PGYTopListMusicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    chartInfoInterface=[[PGYChartInfoInterface alloc]init];
    chartInfoInterface.delegate=self;
    [chartInfoInterface downloadChartInfoWithPageNum:@"1" AndCurrPageCount:@"20"];
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
