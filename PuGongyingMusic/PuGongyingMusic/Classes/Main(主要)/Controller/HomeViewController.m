//
//  HomeViewController.m
//  DDScrollViewController Example
//
//  Created by Hirat on 13-11-8.
//  Copyright (c) 2013年 Hirat. All rights reserved.
//

#import "HomeViewController.h"
#import "PGYSearchViewController.h"
#import "PGYMyViewController.h"
#import "PGYTopMenuView.h"
#import "PGYButtonModel.h"
#import "PGYTopListMusicViewController.h"
#import "PGYMusicListViewController.h"

@interface HomeViewController ()
{
    PGYSearchViewController *searchController;
    
    PGYMyViewController *myController;
    
    PGYTopListMusicViewController *topListController;
    
}
@property (nonatomic, strong) NSMutableArray* viewControllerArray;
@property   (nonatomic,strong)NSMutableArray *topMenuButtonModelArray;



@end

@implementation HomeViewController


- (void)viewDidLoad
{
    self.dataSource = self;
    self.delegate =self;
    [self setUpViews];
    [self loadData];
    [super viewDidLoad];
    

}

-(void)setUpViews{

    

}





- (void)loadData
{
    NSUInteger numberOfPages = 3;
    self.viewControllerArray = [[NSMutableArray alloc] initWithCapacity:numberOfPages];
    for (NSUInteger k = 0; k < numberOfPages; ++k)
    {
        [self.viewControllerArray addObject:[NSNull null]];
    }
    
    
    searchController=[[PGYSearchViewController alloc]init];
    [self.viewControllerArray replaceObjectAtIndex:0 withObject:searchController];
    
    myController=[[PGYMyViewController alloc]init];
    [self.viewControllerArray replaceObjectAtIndex:1 withObject:myController];
    myController.superController=self.navigationController;
    
    topListController=[[PGYTopListMusicViewController alloc]init];
    [self.viewControllerArray replaceObjectAtIndex:2 withObject:topListController];
    topListController.superController=self.navigationController;
    
    self.topMenuButtonModelArray=[NSMutableArray array];
    PGYButtonModel *modelsearch=[PGYButtonModel new];
    modelsearch.bgImageName=@"left_bar_search_h.png";
    [self.topMenuButtonModelArray addObject:modelsearch];
    PGYButtonModel *model2=[PGYButtonModel new];
    model2.title=@"我的";
    [self.topMenuButtonModelArray addObject:model2];
    PGYButtonModel *model3=[PGYButtonModel new];
    model3.title=@"淘歌";
    [self.topMenuButtonModelArray addObject:model3];
 
    
}





#pragma mark - DDScrollViewDataSource

- (NSUInteger)numberOfViewControllerInDDScrollView:(DDScrollViewController *)DDScrollView
{
    return [self.viewControllerArray count];
    
    
}

- (UIViewController*)ddScrollView:(DDScrollViewController *)ddScrollView contentViewControllerAtIndex:(NSUInteger)index
{
    return [self.viewControllerArray objectAtIndex:index];
}


- (NSMutableArray *)topMenuButtonModelArrayInDDScrollView:(DDScrollViewController *)ddScrollView{
    return self.topMenuButtonModelArray;
}


-(void)hideViews{
    [self hideTopMenuView];

}

-(void)showViews{

    [self showTopMenuView];

}

-(void)DDScrollViewDidScroll{

    NSLog(@"scrolling");

}

@end
