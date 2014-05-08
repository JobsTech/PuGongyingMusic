//
//  PGyTopButtonView.h
//  EmptyProject
//
//  Created by apple0 on 14-4-26.
//  Copyright (c) 2014年 ccav.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PGYTopMenuViewDelegate <NSObject>

-(void)selectFinishIndex:(NSInteger)selectIndex;

@end



@interface PGYTopMenuView : UIView

@property(nonatomic,strong) id<PGYTopMenuViewDelegate> delegate;
//-(instancetype)viewWithButtonArray:(NSArray *)buttons;
- (id)initWithFrame:(CGRect)frame  WithButtonModelArray:(NSArray *)buttonModelArray WithSelectIndex:(NSInteger )selectIndex;


/**
    slideProgress 进度传递0-1
 */
- (void)updateSlideViewWithProgress:(NSInteger)slideProgress FromViewIndex:(NSInteger)fromIndex ToViewIndex:(NSInteger)toIndex;


- (void)updateSlideViewWithProgress:(NSInteger)slideProgress;
@end
