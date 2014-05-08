//
//  PGyTopButtonView.m
//  EmptyProject
//
//  Created by apple0 on 14-4-26.
//  Copyright (c) 2014年 ccav.com. All rights reserved.
//

#import "PGYTopMenuView.h"
#import "PGYButtonModel.h"
#import "PGYTopMenuButton.h"
#import "PGYButtonModel.h"
@interface PGYTopMenuView()
/**
 *  用来接受传递的按钮模型
 */
@property (nonatomic,strong) NSArray *buttons;
@property (nonatomic,strong) UIView *slidView;
@property (nonatomic,strong) NSArray   * buttonModelArray;
@property (nonatomic,strong) NSMutableArray *buttonArray;
@property (nonatomic,assign) NSInteger  selectIndex;



@end
@implementation PGYTopMenuView




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame  WithButtonModelArray:(NSArray *)buttonModelArray WithSelectIndex:(NSInteger)selectIndex{
    self =[super initWithFrame:frame];
    if (self) {
        _buttonModelArray=buttonModelArray;
        _selectIndex=selectIndex;
        [self setUpViews];
        
        
    }

    return self;
}


-(void) setUpViews{
//    [self setBackgroundColor:[UIColor redColor]];
    
    float buttonH=self.frame.size.height;
    float buttonW=self.frame.size.width/_buttonModelArray.count;
    
    
    _slidView=[[UIView alloc]initWithFrame:CGRectMake((buttonW*(int)_selectIndex), buttonH-2, buttonW, 2)];
    [_slidView setBackgroundColor:[UIColor whiteColor]];
    _slidView.alpha=0.6;
    
    [self addSubview:_slidView];
    
 
    _buttonArray=[NSMutableArray array];
    for (int i=0; i<_buttonModelArray.count; i++) {
        PGYButtonModel *model=[_buttonModelArray objectAtIndex:i];
        PGYTopMenuButton * btn=[[PGYTopMenuButton alloc]initWithFrame:CGRectMake(i*buttonW, 0, buttonW, buttonH) WithModel:model];
        btn.tag=i;
        [btn addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonArray arrayByAddingObject:btn];
        [self addSubview:btn];
    }
    
    
    
    

}


-(void)menuButtonClick:(UIButton *)btn{
//    if (_selectIndex==btn.tag) return;
    _selectIndex=btn.tag;
    [_delegate selectFinishIndex:btn.tag];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect=_slidView.frame;
        rect.origin.x=btn.tag*rect.size.width;
        _slidView.frame=rect;
    } completion:^(BOOL finished) {
        
    }];



}

- (void)updateSlideViewWithProgress:(NSInteger)slideProgress {
    
    
    
    float buttonW=self.frame.size.width/_buttonModelArray.count;
    float pointX=buttonW*slideProgress*0.01;
    CGRect rect=_slidView.frame;
    rect.origin.x=pointX;
    _slidView.frame=rect;
    
}


- (void)updateSlideViewWithProgress:(NSInteger)slideProgress FromViewIndex:(NSInteger)fromIndex ToViewIndex:(NSInteger)toIndex{
    
    
    
    float buttonW=self.frame.size.width/_buttonModelArray.count;
    float pointX=fromIndex*buttonW+(toIndex-fromIndex)*buttonW*slideProgress*0.01;
    CGRect rect=_slidView.frame;
    rect.origin.x=pointX;
    _slidView.frame=rect;





}



//+(instancetype)viewWithButtonArray:(NSArray *)buttons
//{
//    for (int i = 0; i < buttons.count; i++) {
//        NSLog(@"121");
//    }
//    return nil;
//}
//-(instancetype)viewWithButtonArray:(NSArray *)buttons
//{
//    PGyTopButtonChangeView *topView =[[PGyTopButtonChangeView alloc]init];
//    topView.frame = CGRectMake(0, 60, 320, 30);
//    //NSLog(@"%@",buttons);
//    for (int i = 0; i <buttons.count; i ++) {
//       PGyButton *button = [self addButtonToView:buttons[i]];
//    
//        CGFloat buttonW = 320/buttons.count;
//        CGFloat buttonX = buttonW * i;
//        CGFloat buttonY = 0;
//        CGFloat buttonH = topView.frame.size.height;
//        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
//        
//        [topView addSubview:button];
//    }
//    
//    return topView;
//}

//-(PGyButton *)addButtonToView:(PGyTopButtonModel *)PGybutton
//{
//    
//    
//    PGyButton *button = [PGyButton buttonWithTitle:PGybutton.title backImg:PGybutton.backImg];
//    button.font = [UIFont systemFontOfSize:PGybutton.font];
//    [button setTitleColor:PGybutton.color forState:UIControlStateNormal];
//    //NSLog(@"%@",PGybutton.title);
//    return button;
//}
@end
