//
//  ChartInfoParser.m
//  Enabler
//
//  Created by 吕麟 on 13-8-30.
//  Copyright (c) 2013年 sitech. All rights reserved.
//

#import "ChartInfoParser.h"

@implementation ChartInfoParser


- (id)init
{
	if ((self = [super init]))
	{
		self.entityList = [NSMutableArray array];
    }
    return self;
}
- (NSMutableArray *)arrayWithParseData:(NSData *)data{
    [self.entityList removeAllObjects];
    self.currentString = [NSMutableString string];
	NSXMLParser *XMLParser = [[NSXMLParser alloc] initWithData:data];
    XMLParser.delegate = self;
	[XMLParser parse];
    return self.entityList;

}

- (NSMutableArray *)arrayAppendArray:(NSMutableArray *)chartInfoEntityArray WithParseData:(NSData *)data{
    self.entityList=chartInfoEntityArray;
    self.currentString = [NSMutableString string];
	NSXMLParser *XMLParser = [[NSXMLParser alloc] initWithData:data];
    XMLParser.delegate = self;
	[XMLParser parse];
    return self.entityList;
}


- (void)insertEntityToList:(ChartInfoEntity *)entity
{
    [self.entityList addObject:entity];
}

- (void)startParse:(NSData *)data
{
	
	
}


#pragma mark NSXMLParser Parsing Callbacks

static NSString *kChartInfo = @"ChartInfo";
static NSString *kchartCode = @"chartCode";
static NSString *kchartName = @"chartName";
static NSString *kresCode = @"resCode";
static NSString *kresCounter = @"resCounter";                          
static NSString *kresMsg = @"resMsg";

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *) qualifiedName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:kChartInfo])
    {
        self.entity = [[ChartInfoEntity alloc] init];
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kchartCode])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kchartName])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kresCode])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kresCounter])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kresMsg])
    {
        [self.currentString setString:@""];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:kChartInfo])
    {
        [self insertEntityToList:self.entity];
    }
    else if ([elementName isEqualToString:kchartCode])
    {
        self.entity.chartCode = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kchartName])
    {
        self.entity.chartName = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kresCode])
    {
        self.resCode = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kresCounter])
    {
        self.resCounter = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kresMsg])
    {
        self.resMsg = [NSString stringWithFormat:@"%@", self.currentString];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	[self.currentString appendString:string];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	
}

@end
