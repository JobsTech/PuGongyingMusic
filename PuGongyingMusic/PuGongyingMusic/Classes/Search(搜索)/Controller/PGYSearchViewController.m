//
//  PGYSearchViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-6.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYSearchViewController.h"
#import "PGYSearchBar.h"

@interface PGYSearchViewController ()

@property(nonatomic,strong)PGYSearchBar *searchBar;


@end

@implementation PGYSearchViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpViews];
}

-(void)setUpViews{
    _searchBar=[[PGYSearchBar alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 40)];
    
    [self.view addSubview:_searchBar];
    
    
//    [self setUpContent];


}

-(void)setUpContent{
    float scrollViewH=120;
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, scrollViewH, self.view.frame.size.width, self.view.frame.size.height-scrollViewH-50)];
    scrollView.bounces=NO;
    [scrollView setBackgroundColor:[UIColor blackColor]];
    
    
    [self.view addSubview:scrollView];
    
    
    
    
    
    
    
    
    
    


}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
