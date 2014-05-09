//
//  ChartInfoEntity.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "ChartInfoEntity.h"

@implementation ChartInfoEntity



#pragma mark -
#pragma mark Intilization Methods
#pragma mark -
- (id) init
{
	if (!(self = [super init]))
		return nil;
	
	_chartCode = nil;
    _chartName = nil;
    _chartDes = nil;
    _chartPic = nil;
	
	return self;
}

- (void) dealloc
{
	
}

#pragma mark -
#pragma mark NSCoding OR NSCopying Methods
#pragma mark -
- (void) encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:self.chartCode forKey:@"chartCode"];
    [coder encodeObject:self.chartName forKey:@"chartName"];
    [coder encodeObject:self.chartDes forKey:@"chartDes"];
    [coder encodeObject:self.chartPic forKey:@"chartPic"];
}

- (id) initWithCoder:(NSCoder *)decoder
{
	if (self = [super init])
	{
		self.chartCode = [decoder decodeObjectForKey:@"chartCode"];
        self.chartName = [decoder decodeObjectForKey:@"chartName"];
        self.chartDes = [decoder decodeObjectForKey:@"chartDes"];
        self.chartPic = [decoder decodeObjectForKey:@"chartPic"];
	}
	
	return self;
}

- (id) copyWithZone:(NSZone *)zone
{
	ChartInfoEntity* entity = [[[self class] allocWithZone:zone] init];
	entity.chartCode = self.chartCode;
    entity.chartName = self.chartName;
    entity.chartDes = self.chartDes;
    entity.chartPic = self.chartPic;
	
	return entity;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@,%@,%@,%@",self.chartCode,self.chartName,self.chartDes,self.chartPic];


}



@end
