//
//  PGYViewController.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-26.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGYTabBarController.h"
#import "HomeViewController.h"
#import "PGYTabBarButtomCusView.h"
#import "PGYTabBarMusicPlayView.h"
#import "PGYSettingView.h"
#import "UIEvent+Expand.h"
#import "PGYTabBarSettingBgView.h"
#import "PGYHomeNavigationController.h"

@interface PGYTabBarController ()<PGYTabBarMusicPlayViewDelegate>

@property (nonatomic,strong)PGYTabBarButtomCusView * buttomCusView;

@property (nonatomic,strong)PGYTabBarMusicPlayView *musicPlayView;

@property (nonatomic,strong)PGYSettingView *settingView;

@property (nonatomic,assign)CGPoint startTouchPoint;

@property (nonatomic,strong)UIPanGestureRecognizer *panTap;

@property (nonatomic,strong)UIPanGestureRecognizer *settingBgPanTap;

@property (nonatomic,strong)PGYTabBarSettingBgView *settingBgView;




@end

@implementation PGYTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.userInteractionEnabled=YES;
    
    //设置tabBar的Controllers
    [self setViewControllers];
    //移除tabBar
    [self removeTabBar];
    //添加自定义view
    [self addCusView];
    //添加监听事件
    [self addEvent];
    
    
}

-(void)addEvent{

    [self addSwipeGestureRecognizerEvent];
    //轻扫手势识别
    UISwipeGestureRecognizer *swipTap=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipTap:)];
    swipTap.direction=UISwipeGestureRecognizerDirectionUp;
    [_buttomCusView addGestureRecognizer:swipTap];

}


-(void)addSwipeGestureRecognizerEvent{
    //拖拽手势识别
//    if (nil==_panTap) {
//        _panTap=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanTap:)];
//    }
//    [self.view addGestureRecognizer:_panTap];
    
}



- (void)handlePanTap:(UIPanGestureRecognizer *)recongnizer{
//    NSLog(@"tabbarhandlePanTap");
    CGPoint movePoint=[recongnizer translationInView:self.view];
    
    
    
    float pointx=0;
    if ((movePoint.x<0)&&(self.view.frame.origin.x>-_settingView.frame.size.width)){
        pointx=movePoint.x<-_settingView.frame.size.width?-_settingView.frame.size.width:movePoint.x;
        [self moveViewWithPointX:pointx];
    }else if (movePoint.x>0&&self.view.frame.origin.x<0) {
        pointx=self.view.frame.origin.x+movePoint.x>=0?0:self.view.frame.origin.x+movePoint.x;
        [self moveViewWithPointX:pointx];
    }
//    if (!recongnizer.delaysTouchesEnded) {
//        NSLog(@"end------------------------------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
//        if (self.view.frame.origin.x<=-_settingView.frame.size.width) {
//            pointx=-_settingView.frame.size.width;
//        }else{
//            pointx=0;
//        }
//    }
    
    

    
    
//    NSLog(@"%f    %f",movePoint.x,movePoint.y);
    
}


-(void)moveViewWithPointX:(float)pointX{

    self.view.frame=CGRectMake(pointX, 0, self.view.frame.size.width, self.view.frame.size.height);

}






-(void)handleSwipTap:(UISwipeGestureRecognizer *)recognizer{
//    NSLog(@"tabbarhandleSwipTap---%hhd",recognizer.delaysTouchesEnded);
    [_musicPlayView showView];
}




-(void)setViewControllers{
    PGYHomeNavigationController *navigationController=[[PGYHomeNavigationController alloc]init];
    HomeViewController *homeViewController=[[HomeViewController alloc]init];
    [navigationController pushViewController:homeViewController animated:NO];
    [self setViewControllers:@[navigationController]];
//    [self setViewControllers:@[homeViewController]];
}


-(void)addCusView{
    
    int buttomHeight=50;
    
    _buttomCusView=[[PGYTabBarButtomCusView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-buttomHeight, self.view.frame.size.width, buttomHeight)];
    _buttomCusView.tabBarController=self;
    [self.view addSubview:_buttomCusView];
    
    _musicPlayView=[[PGYTabBarMusicPlayView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    _musicPlayView.delegate=self;
    [self.view insertSubview:_musicPlayView aboveSubview:_buttomCusView];
    
    
    _settingView=[[PGYSettingView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, 150, self.view.frame.size.height)];
    _settingView.tabBarController=self;
    [self.view addSubview:_settingView];
    
    UIImageView *bgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgView.image=[UIImage imageNamed:@"000@2x.jpg"];
    [self.view insertSubview:bgView atIndex:0];
    
    

} 


-(void)removeTabBar{
    self.tabBar.frame=CGRectMake(0, 0, 0, 0);
    [self.tabBar removeFromSuperview];

}




#pragma mark   touchesEvent

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
//    NSLog(@"touchbegin");
    _startTouchPoint=[event pointEventWithView:self.view];
    if ([self checkCanMoveMusicPlayView]) {
        [self.view removeGestureRecognizer:_panTap];
    }
//    NSLog(@"y-%lf--",_startTouchPoint.y);
    
    
}


//监听touchMoveing事件

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchmoveing..........");
    CGPoint moveTouchPoint=[event pointEventWithView:self.view];
    if ([self checkCanMoveMusicPlayView]) {
        float  pointY=self.view.frame.size.height-(_startTouchPoint.y-moveTouchPoint.y);
        pointY=self.view.frame.size.height-pointY>_buttomCusView.frame.size.height?pointY-_buttomCusView.frame.size.height:self.view.frame.size.height;
        [_musicPlayView moveViewWithPointY:pointY];
    }
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
//    NSLog(@"touchend");
    
    
    CGPoint endTouchPoint=[event pointEventWithView:self.view];
    if ([self checkCanMoveMusicPlayView]) {
        if (endTouchPoint.y>=(self.view.frame.size.height*0.5)) {
            [_musicPlayView hideViewWithDown];
        }else{
            [_musicPlayView showView];
            
        }
    }
    
}


-(BOOL)checkCanMoveMusicPlayView{

    return (_startTouchPoint.y>=_buttomCusView.frame.origin.y)&&(self.view.frame.origin.x==0);
}


/**
    musicplayView隐藏后的代理方法
 
 */

-(void)finashedHideTabBarMusicPlayView{
    [self  addSwipeGestureRecognizerEvent];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveTarBarControllerWithPanGestureRecognizer:(UIPanGestureRecognizer *)recongnizer{
    [self moveTarBarControllerWithPanGestureRecognizer:recongnizer WithShow:NO];

}

-(void)moveTarBarControllerWithPanGestureRecognizer:(UIPanGestureRecognizer *)recongnizer WithShow:(BOOL)isShowSetting
{
    float settingViewW=_settingView.frame.size.width;
    CGPoint movePoint=[recongnizer translationInView:self.view];
    CGPoint point=[recongnizer velocityInView:self.view];
//    NSLog(@"point.......%lf,%lf",point.x,point.y);
    float originX=self.view.frame.origin.x;
//    if ((movePoint.x>=0&&originX>=0)||(movePoint.x<=0&&originX<=-settingViewW)) {
//        return;
//    }
    
    if(recongnizer.state ==UIGestureRecognizerStateBegan){
        if (movePoint.x<0) {
        }
    }
    
    
    
    if ([self.view.subviews indexOfObject:self.settingBgView]==NSNotFound) {
        [self.view addSubview:self.settingBgView];
        [self.settingBgView addGestureRecognizer:self.settingBgPanTap];
    }
    
    
    
    
//    NSLog(@"%lf,%lf",settingViewW,movePoint.x);
    
    if(recongnizer.state == UIGestureRecognizerStateCancelled || recongnizer.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.2 animations:^{
            float x=0;
            if (isShowSetting) {
                if (movePoint.x<0) {
                    x=movePoint.x<-settingViewW*0.5?-settingViewW:0;
                }else{
                    x=0;
                }
                
            }else{
                if (movePoint.x<0) {
                    x=-settingViewW;
                }else{
                    x=movePoint.x>settingViewW*0.5?0:-settingViewW;
                }
            }
            
            
            self.view.frame=CGRectMake(x, 0, self.view.frame.size.width,self.view.frame.size.height);
            [self.settingBgView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:fabsf(x/settingViewW*0.5)+0.2]];
        } completion:^(BOOL finished) {
            if (self.view.frame.origin.x==0) {
                [self.settingBgView removeFromSuperview];
                [self.settingBgView removeGestureRecognizer:_settingBgPanTap];
            }
            CGRect viewFrame=self.view.frame;
            float screenW=[UIScreen mainScreen].bounds.size.width;
            viewFrame.size.width=isShowSetting?screenW+self.settingView.frame.size.width:screenW;
            self.view.frame=viewFrame;
        }];
    }else{
        
        float x=0;
        
        
        if (isShowSetting) {
            
            if (movePoint.x<0) {
                
                x=movePoint.x<-settingViewW?-settingViewW:movePoint.x;
            }else{
                x=0;
            }
            
        }else{
        
            if (movePoint.x<0) {
                
                x=-settingViewW;
            }else{
                x=movePoint.x>settingViewW?0:-settingViewW+movePoint.x;
            }
        
        }
        
        self.view.frame=CGRectMake(x, 0, self.view.frame.size.width,self.view.frame.size.height);
       
        [self.settingBgView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:fabsf(x/settingViewW*0.5)+0.2]];
    }
}


/**
    拉取出设置view 时候的遮挡view
 */

-(PGYTabBarSettingBgView *)settingBgView{
    if (nil==_settingBgView) {
        self.settingBgView=[[PGYTabBarSettingBgView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.settingBgView addTarget:self action:@selector(closeSettingViews) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingBgView;

}
/**
 拉取出设置view 时候的遮挡view的滑动事件检测
 */

-(UIPanGestureRecognizer *)settingBgPanTap{
    if (nil==_settingBgPanTap) {
        _settingBgPanTap=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveTarBarControllerWithPanGestureRecognizer:)];
    }
    return _settingBgPanTap;

}


-(void)closeSettingViews{

    [UIView animateWithDuration:0.3 animations:^{
        float screenW=[UIScreen mainScreen].bounds.size.width;
        self.view.frame=CGRectMake(0, 0, screenW,self.view.frame.size.height);
        [self.settingBgView removeFromSuperview];
        [self.settingBgView removeGestureRecognizer:_settingBgPanTap];
    } completion:^(BOOL finished) {
        
    }];

}


-(void)openSettingViews{
    
    
    [self.view addSubview:self.settingBgView];
    [self.settingBgView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
    [UIView animateWithDuration:0.3 animations:^{
        float settingViewW=self.settingView.frame.size.width;
        float screenW=[UIScreen mainScreen].bounds.size.width;
        self.view.frame=CGRectMake(-settingViewW, 0, screenW+settingViewW,self.view.frame.size.height);
        [self.settingBgView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
        
    } completion:^(BOOL finished) {
        [self.settingBgView addGestureRecognizer:self.settingBgPanTap];
    }];



}

/**
    
 */


-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{

    [self closeSettingViews];
    
    [super presentViewController:viewControllerToPresent animated:flag completion:completion ];


}


@end
