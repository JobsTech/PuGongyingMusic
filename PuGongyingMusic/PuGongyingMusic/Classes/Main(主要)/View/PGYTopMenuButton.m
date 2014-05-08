//
//  PGyButton.m
//  EmptyProject
//
//  Created by apple0 on 14-4-26.
//  Copyright (c) 2014年 ccav.com. All rights reserved.
//

#import "PGYTopMenuButton.h"
#import "PGYButtonModel.h"

@implementation PGYTopMenuButton



- (id)initWithFrame:(CGRect)frame WithModel:(PGYButtonModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
        self.alpha=1;
        if (nil!=model.title) {
            [self setTitle:model.title forState:UIControlStateNormal];
        }
        if (nil!=model.bgImageName) {
            UIImage *image=[UIImage imageNamed:model.bgImageName];
//            [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, (self.frame.size.width-self.frame.size.height)*0.5, 10, (self.frame.size.width-self.frame.size.height)*0.5)];
            self.imageView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            self.imageView.image=image;
            self.imageView.contentMode=UIViewContentModeCenter;
            self.imageView.hidden=NO;
        }
    }
    return self;
}


/**
 *  覆盖方法让按钮不显示高亮的状态
 */

-(void)setHighlighted:(BOOL)highlighted
{
    
    
}


-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [self setBackgroundColor:[UIColor colorWithRed:250 green:250 blue:250 alpha:0.2]];
    return YES;
}


-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
}




+(instancetype)buttonWithTitle:(NSString *)title backImg:(UIImage *)image
{
    PGYTopMenuButton *button  = [[self alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    return button;
}
@end
