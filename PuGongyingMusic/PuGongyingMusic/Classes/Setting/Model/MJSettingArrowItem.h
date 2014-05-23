//
//  MJSettingArrowItem.h
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJSettingItem.h"

//typedef enum {
//    MJSettingArrowItemVcShowTypePush,
//    MJSettingArrowItemVcShowTypeModal
//} MJSettingArrowItemVcShowType;

@interface MJSettingArrowItem : MJSettingItem
/**
 *  点击这行cell需要跳转的控制器
 */
@property (nonatomic, assign) Class destVcClass;

//@property (nonatomic, assign)  MJSettingArrowItemVcShowType  vcShowType;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
@end
