//
//  DDScrollViewController.m
//  
//
//  Created by Hirat on 13-11-8.
//
//

#import "DDScrollViewController.h"
#import "PGYCusScrollView.h"
#import "PGYTabBarController.h"
#import "PGYTopMenuView.h"
#import "PGYButtonModel.h"
@interface DDScrollViewController () <UIScrollViewDelegate,PGYTopMenuViewDelegate>
@property PGYCusScrollView *scrollView;
@property NSMutableArray *contents;
@property (nonatomic) CGFloat offsetRadio;
@property (nonatomic) NSInteger activeIndex;
@property (nonatomic) BOOL isShowRighting;
@property(nonatomic,strong)UIView *topBgView;
@property  (nonatomic,strong)PGYTopMenuView * topMenuView;

@end

@implementation DDScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpViews];
    
    [self initControl];
    
    [self reloadData];
    
    
}


-(void)setUpViews{
    

}






- (void)initControl
{
    self.contents = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self numberOfControllers]; i ++)
    {
        [self.contents addObject:[NSNull null]];
    }
    
    self.scrollView = [[PGYCusScrollView alloc] initWithFrame: self.view.bounds];
    [self.scrollView.panGestureRecognizer addTarget:self action:@selector(handleScrollViewPan:)];
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * ([self numberOfControllers]), CGRectGetHeight(self.view.frame));
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.bounces=NO;
    [self.view addSubview: self.scrollView];
    
    
    _topBgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,60)];
    [_topBgView setBackgroundColor:[UIColor blackColor]];
    
    _topBgView.alpha=0.1;
    
    [self.view addSubview:_topBgView];
    if ([self topMenuButtonModelArray]&&[self topMenuButtonModelArray].count>0) {
        _topMenuView=[[PGYTopMenuView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40) WithButtonModelArray:[self topMenuButtonModelArray] WithSelectIndex:1];
        _topMenuView.delegate=self;
        [self.view addSubview:_topMenuView];
    }
    
}



#pragma mark -

- (void)reloadData
{
  
    NSArray *subViews = [self.scrollView subviews];
    if([subViews count] != 0)
    {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    for (int i = 0; i < [self numberOfControllers]; i ++)
    {
        NSInteger thisPage = [self validIndexValue: self.activeIndex  + i];
        [self.contents replaceObjectAtIndex: i withObject:[self.dataSource ddScrollView:self contentViewControllerAtIndex:thisPage]];
    }

    for (int i = 0; i < [self numberOfControllers]; i++)
    { 
        UIViewController* viewController = [self.contents objectAtIndex:i];
        UIView* view = viewController.view;
        view.userInteractionEnabled = YES;
        view.frame = self.view.bounds;
        view.frame = CGRectOffset(self.scrollView.frame, view.frame.size.width * i, 0);
        [self.scrollView addSubview: view];
    }
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width + self.scrollView.frame.size.width * self.offsetRadio, 0)];
    
    
}

- (NSInteger)validIndexValue:(NSInteger)value
{
    if(value == -1)
    {
        value = self.numberOfControllers - 1;
    }
    
    if(value == self.numberOfControllers)
    {
        value = 0;
    }
    
    return value;
}

- (void)setActiveIndex:(NSInteger)activeIndex
{
    if (_activeIndex != activeIndex)
    {
        _activeIndex = activeIndex;
//        [self reloadData];
    }
}

- (NSInteger)numberOfControllers
{
    return [self.dataSource numberOfViewControllerInDDScrollView:self];
}

-(NSMutableArray *)topMenuButtonModelArray{

    return [self.dataSource topMenuButtonModelArrayInDDScrollView:self];

}


- (void)setOffsetRadio:(CGFloat)offsetRadio
{
    if (_offsetRadio != offsetRadio)
    {
        _offsetRadio = offsetRadio;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width + self.scrollView.frame.size.width * offsetRadio, 0)];
        if (offsetRadio > 0.5)
        {
            _offsetRadio = offsetRadio - 1;
            self.activeIndex = [self validIndexValue: self.activeIndex + 1];
        }
        
        if (offsetRadio < -0.5)
        {
            _offsetRadio = offsetRadio + 1;
            self.activeIndex = [self validIndexValue: self.activeIndex - 1];
        }
    }
}

#pragma mark - UIScrollViewDelegate

/**
    检测是在中间的左侧还是右侧
 
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x<0) {
        [scrollView setContentOffset:CGPointMake(0,0)];
    }
    
    if (scrollView.contentOffset.x>640) {
       
      
        [scrollView setContentOffset:CGPointMake(640, 0)];
    }
    
    self.offsetRadio = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame) - 1;

    
    if (_isShowRighting) {
        [self.scrollView setContentOffset:CGPointMake(640, 0)];
    }
    
    
    [self updateMenu];
}


-(void)updateMenu{
    float  screenW=[UIScreen mainScreen].bounds.size.width;
    NSInteger slideProgress=self.scrollView.contentOffset.x/screenW*100;
    slideProgress=slideProgress>=0?slideProgress:-slideProgress;
    [_topMenuView updateSlideViewWithProgress:slideProgress];

}


-(void)handleScrollViewPan:(UIPanGestureRecognizer *)recongnizer{
   
    CGPoint movePoint=[recongnizer translationInView:self.view];
    if (recongnizer.state==UIGestureRecognizerStateBegan) {
        if (self.scrollView.contentSize.width<=self.scrollView.contentOffset.x+self.scrollView.frame.size.width) {
            if (movePoint.x<0) {
                _isShowRighting=YES;
            }
        }
    }
    
    if (_isShowRighting) {
        if ([self.tabBarController isKindOfClass:[PGYTabBarController class]]) {
            PGYTabBarController *tabBarCus=self.tabBarController;
            [tabBarCus moveTarBarControllerWithPanGestureRecognizer:recongnizer WithShow:YES];
        }
        
    }
  
    if(recongnizer.state == UIGestureRecognizerStateCancelled || recongnizer.state == UIGestureRecognizerStateEnded){
        _isShowRighting=NO;
    }
    
    
    
    
    
    
}

-(void)selectFinishIndex:(NSInteger)selectIndex{
    [UIView animateWithDuration:0.3  animations:^{
        self.scrollView.contentOffset=CGPointMake(CGRectGetWidth(self.view.frame)*selectIndex, 0);
    } completion:^(BOOL finished) {
        
    }];
    
}




-(void)showTopMenuView{
    self.topMenuView.hidden=YES;

}

-(void)hideTopMenuView{
    self.topMenuView.hidden=NO;


}


@end
