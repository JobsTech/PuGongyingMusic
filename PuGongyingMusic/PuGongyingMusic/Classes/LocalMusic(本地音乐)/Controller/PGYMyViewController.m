//
//  PGYMyViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-6.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYMyViewController.h"
#import "PGYButtonModel.h"
#import "PGYMusicListViewController.h"

@interface PGYMyViewController ()

@property(nonatomic,strong)NSMutableArray *btnArrayModel;

@end

@implementation PGYMyViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpViews];
}


-(void)setUpViews{
    UIView * contentBgView=[[UIView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60-50)];
    [contentBgView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    [self.view addSubview:contentBgView];
    
    
    float contentW=self.view.frame.size.width;
    float contentH=50*(([self.btnArrayModel count]+1)/2);
    float contentY=self.view.frame.size.height-contentH-70;
    UIView *contentView=[[UIView alloc]initWithFrame:CGRectMake(0,contentY, contentW, contentH)];
    float splitWH=10;
    float contentBtnW=(contentW-10*3)/2;
    float contentBtnH=30;
    for (int i=0; i<[self.btnArrayModel count]; i++) {
        int cel=i%2; //列
        int row=i/2;    //行
        float contentBtnX=cel*(contentBtnW+splitWH)+splitWH;
        float contentBtnY=row*(contentBtnH+splitWH)+splitWH;
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(contentBtnX,contentBtnY, contentBtnW, contentBtnH)];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]];
        //        [btn setBackgroundColor:[UIColor redColor]];
        PGYButtonModel *model=[self.btnArrayModel objectAtIndex:i];
        [btn setTitle:model.title forState:UIControlStateNormal];
        btn.tag=i;
        [contentView addSubview:btn];
    }
    
//    [contentView setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:contentView];
    
    
    
}

-(void)click:(UIButton *)btn{
    PGYButtonModel *model=[self.btnArrayModel objectAtIndex:btn.tag];
    
    UIViewController *controller=[[model.actionClass alloc]init];
    self.superController.title=@"ceshi";
    self.superController.navigationBarHidden=NO;
    [self.superController pushViewController:controller animated:YES];
    
    
}




-(NSMutableArray *)btnArrayModel{
    if (nil==_btnArrayModel) {
        _btnArrayModel=[NSMutableArray array];
        
        
        PGYButtonModel *myLocalMusic=[PGYButtonModel new];
        
        myLocalMusic.title=@"本地音乐";
        
        myLocalMusic.actionClass=[PGYMusicListViewController class];
        
        [_btnArrayModel addObject:myLocalMusic];
        
        
        PGYButtonModel *myLove=[PGYButtonModel new];
        
        myLove.title=@"我的最爱";
        
        myLove.actionClass=[PGYMusicListViewController class];
        
        [_btnArrayModel addObject:myLove];
        
        
        PGYButtonModel *myCusMusicList=[PGYButtonModel new];
        
        myCusMusicList.title=@"我的歌单";
        
        [_btnArrayModel addObject:myCusMusicList];
        
        
//        PGYButtonModel *myDownload=[PGYButtonModel new];
//        
//        myDownload.title=@"我的下载";
//        
//        [_btnArrayModel addObject:myDownload];
        
        
        PGYButtonModel *lastPalyList=[PGYButtonModel new];
        
        lastPalyList.title=@"最近播放";
        
        [_btnArrayModel addObject:lastPalyList];
        
        
        
    }
    
    return _btnArrayModel;


}



@end
