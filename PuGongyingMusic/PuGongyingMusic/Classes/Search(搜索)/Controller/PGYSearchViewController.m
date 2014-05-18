//
//  PGYSearchViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-6.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYSearchViewController.h"
#import "PGYSearchBar.h"
#import "CUSLayout.h"
#import "CUSRowLayout.h"
#import "CUSLayoutSampleFactory.h"

@interface PGYSearchViewController ()

@property(nonatomic,strong)PGYSearchBar *searchBar;
@property(nonatomic,strong)UIView *hotWordView;
@property(nonatomic,strong)NSMutableArray *  hotWordArray;

@end

@implementation PGYSearchViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self setUpViews];
}



-(void)setUpViews{
    
    UIView *contentView=[[UIView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60-50)];
    contentView.userInteractionEnabled=YES;
    [contentView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3 ]];
    
    
    [self.view addSubview:contentView];
    
    _searchBar=[[PGYSearchBar alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 40)];
    
    [contentView addSubview:_searchBar];
    
    
    float scrollViewH=60;
    
    _hotWordView=[[UIView alloc]initWithFrame:CGRectMake(0, scrollViewH, self.view.frame.size.width, self.view.frame.size.height-scrollViewH-50)];
        _hotWordView.userInteractionEnabled=YES;
    
    
    for (int i = 0; i < [self.hotWordArray count]; i++) {
        UIButton *button=[[UIButton alloc]init];
        [button setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
        button.layoutData=CUS_LAYOUT.share_rowData;
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
        [button setTitle:[self.hotWordArray objectAtIndex:i] forState:UIControlStateNormal];
        [_hotWordView addSubview:button];
    }
    
    [contentView addSubview:_hotWordView];
    
    CUSRowLayout *layout = [[CUSRowLayout alloc]init];
    layout.justify = YES;
    layout.spacing=10;
    layout.marginTop=20;
    _hotWordView.layoutFrame=layout;
    
    [layout layout:_hotWordView];
    
    

}


-(void)click:(UIButton *)btn{
    
    _searchBar.text=btn.titleLabel.text;



}



-(NSMutableArray *)hotWordArray{
    if(nil==_hotWordArray){
        _hotWordArray=[NSMutableArray array];
        [_hotWordArray addObject:@"周杰伦"];
        [_hotWordArray addObject:@"希望在这里"];
        [_hotWordArray addObject:@"周杰伦"];
        [_hotWordArray addObject:@"蔡依林"];
        [_hotWordArray addObject:@"李琦"];
        [_hotWordArray addObject:@"东方神起"];
        [_hotWordArray addObject:@"周杰伦"];
        [_hotWordArray addObject:@"周杰伦"];
        [_hotWordArray addObject:@"周杰伦"];
        [_hotWordArray addObject:@"周杰伦"];
        [_hotWordArray addObject:@"周杰伦"];
        
    
    }
    return _hotWordArray;

}






@end
