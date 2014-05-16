//
//  PGYSettingViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-14.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYSettingViewController.h"
#import "PGYSettingTableView.h"
#import "PGYSettingTableViewCell.h"
#import "PGYSettingModel.h"

@interface PGYSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)PGYSettingTableView *  tableView;

@end

@implementation PGYSettingViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    [self setUpViews];
    
    
}


-(void)setUpViews{
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
 

}



-(void)click{
    
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}


-(PGYSettingTableView *)tableView{

    if (nil==_tableView) {
        _tableView=[[PGYSettingTableView alloc]init];
    }
    return  _tableView;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PGYSettingModel *model=[PGYSettingModel new];
    
    model.title=@"测试";
    
    PGYSettingTableViewCell *cell=[PGYSettingTableViewCell cellWithTableView:self.tableView AndSettingModel:model];
    
    
    return cell;
                                    

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
