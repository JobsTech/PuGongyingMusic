//
//  PGyMyDB.h
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-29.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGyMyDB : NSObject

+(NSManagedObjectContext *) contextWithOpenDBUseCoreData;

@end
