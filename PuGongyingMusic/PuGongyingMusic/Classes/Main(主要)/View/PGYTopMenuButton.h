//
//  PGyButton.h
//  EmptyProject
//
//  Created by apple0 on 14-4-26.
//  Copyright (c) 2014年 ccav.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGYButtonModel.h"


@interface PGYTopMenuButton : UIButton
+(instancetype)buttonWithTitle:(NSString *)title backImg:(UIImage *)image ;

- (id)initWithFrame:(CGRect)frame WithModel:(PGYButtonModel *)model;
@end
