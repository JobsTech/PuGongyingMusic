//
//  PGyMyDB.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-4-29.
//  Copyright (c) 2014年 CCAT.COM. All rights reserved.
//

#import "PGyMyDB.h"

@implementation PGyMyDB
static NSManagedObjectContext *context=nil;

+(NSManagedObjectContext *) contextWithOpenDBUseCoreData{
    
    if (nil!=context) {
        return context;
    }
    
    
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    // 2. 实例化持久化存储调度，要建立起桥梁，需要模型
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    // 3. 添加一个持久化的数据库到存储调度
    // 3.1 建立数据库保存在沙盒的URL
    NSArray *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [docs[0] stringByAppendingPathComponent:@"PGy.db"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 3.2 打开或者新建数据库文件
    // 如果文件不存在，则新建之后打开
    // 否者直接打开数据库
    NSError *error = nil;
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    
    if (error) {
        NSLog(@"打开数据库出错 - %@", error.localizedDescription);
    } else {
        NSLog(@"打开数据库成功！");
        
        context = [[NSManagedObjectContext alloc] init];
        
        context.persistentStoreCoordinator = store;
    }
    return context;
}



@end
