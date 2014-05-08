//
//  PGyTopButtonModel.h
//  EmptyProject
//
//  Created by apple0 on 14-4-26.
//  Copyright (c) 2014年 ccav.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGYButtonModel : NSObject

/**
 *  按钮的显示信息
 */
@property (nonatomic, copy) NSString *title;
/**
 *  按钮的背景图片的名字
 */
@property (nonatomic, copy) UIImage *backImg;
///**
// *  按钮的图片
// */
//@property (nonatomic, copy) NSString *image;
///**
// *  按钮文字的字体
// */
@property (nonatomic,assign) CGFloat font;
///**
// *  按钮文字的颜色
// */
@property (nonatomic, weak) UIColor *color;

@property (nonatomic,strong) NSString *bgImageName;

@end
