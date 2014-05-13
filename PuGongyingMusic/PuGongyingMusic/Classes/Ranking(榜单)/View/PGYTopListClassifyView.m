//
//  PGYTopListClassifyView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-12.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListClassifyView.h"


@interface PGYTopListClassifyView()

@property(nonatomic,strong)NSMutableArray *classifyTitleArray;


@end


@implementation PGYTopListClassifyView



-(id)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    
    if (self) {
        
        [self setUpViews];
    }
    return self;
}


-(void)setUpViews{

    [self setTopView];
    [self setContentView];



}

-(void)setTopView{
    
    float topViewX=0;
    float topViewY=0;
    float topViewW=0;
    float topViewH=0;
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(topViewX, topViewY, topViewW, topViewH)];
    
    float topViewTitleX=0;
    float topViewTitleY=0;
    float topViewTitleW=topViewW;
    float topViewTitleH=topViewH;
    UITextField *topViewTitle=[[UITextField alloc]initWithFrame:CGRectMake(topViewTitleX, topViewTitleY, topViewTitleW, topViewTitleH)];
    [topView addSubview:topViewTitle];
    [self addSubview:topView];
}
-(void)setContentView{
    
    float contentW=self.frame.size.width;
    float contentH=self.frame.size.height;
    UIView *contentView=[[UIView alloc]initWithFrame:CGRectMake(0, 30, contentW, contentH)];
    float splitWH=10;
    float contentBtnWH=(contentW-10*4)/3;
    for (int i=0; i<[self.classifyTitleArray count]; i++) {
        int cel=i%3; //列
        int row=i/3;    //行
        float contentBtnX=cel*(contentBtnWH+splitWH)+splitWH;
        float contentBtnY=row*(contentBtnWH+splitWH)+splitWH;
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(contentBtnX,contentBtnY, contentBtnWH, contentBtnWH)];
        [btn setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.4]];
        [btn setTitle:[self.classifyTitleArray objectAtIndex:i] forState:UIControlStateNormal];
        [contentView addSubview:btn];
    }

    

    [self addSubview:contentView];
}


-(NSMutableArray *)classifyTitleArray{
    
    if (nil==_classifyTitleArray) {
        _classifyTitleArray=[NSMutableArray array];
        [_classifyTitleArray addObject:@"摇滚"];
        [_classifyTitleArray addObject:@"爵士"];
        [_classifyTitleArray addObject:@"小清新"];
        [_classifyTitleArray addObject:@"飞人"];
        [_classifyTitleArray addObject:@"老歌曲"];
        [_classifyTitleArray addObject:@"流行歌曲"];
        [_classifyTitleArray addObject:@"欧美"];
        [_classifyTitleArray addObject:@"中国风"];
        [_classifyTitleArray addObject:@"happy"];
        [_classifyTitleArray addObject:@"not"];
        [_classifyTitleArray addObject:@"quick"];
        
        
    }
    


    return _classifyTitleArray;

}

@end
