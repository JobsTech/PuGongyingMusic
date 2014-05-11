//
//  PGYTopListMusicTableView.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "PGYTopListMusicTableView.h"
#import "PGYTopListMusicTableViewCell.h"


@interface PGYTopListMusicTableView()<UITableViewDataSource,UITableViewDelegate>

@end




@implementation PGYTopListMusicTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.dataSource =self;
        self.delegate=self;
        
    }
    return self;
}







@end
