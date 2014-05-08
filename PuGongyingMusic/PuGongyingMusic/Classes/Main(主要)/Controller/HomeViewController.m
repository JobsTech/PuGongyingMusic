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

@interface HomeViewController ()
@property (nonatomic, strong) NSMutableArray* viewControllerArray;
@property   (nonatomic,strong)NSMutableArray *topMenuButtonModelArray;


@end

@implementation HomeViewController

PGYSearchViewController *searchController;

PGYMyViewController *myController;

UITableViewController *controller1;
- (void)viewDidLoad
{
    self.dataSource = self;
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
    
    
    controller1=[[UITableViewController alloc]init];
    [self.viewControllerArray replaceObjectAtIndex:2 withObject:controller1];
    
    
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
    NSLog(@"%d",[self.viewControllerArray count]);
    return [self.viewControllerArray count];
}

- (UIViewController*)ddScrollView:(DDScrollViewController *)ddScrollView contentViewControllerAtIndex:(NSUInteger)index
{
    return [self.viewControllerArray objectAtIndex:index];
}


- (NSMutableArray *)topMenuButtonModelArrayInDDScrollView:(DDScrollViewController *)ddScrollView{
    return self.topMenuButtonModelArray;
}




@end
