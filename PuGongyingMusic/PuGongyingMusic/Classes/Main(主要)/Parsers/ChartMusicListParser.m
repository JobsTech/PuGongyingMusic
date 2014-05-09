//
//  ChartMusicListParser.m
//  PuGongyingMusic
//
//  Created by coderlirui on 14-5-9.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "ChartMusicListParser.h"
#import "MusicInfoEntity.h"


@implementation ChartMusicListParser



- (id)init
{
	if ((self = [super init]))
	{
		self.entityList = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc
{
   
}


- (NSMutableArray *)arrayWithParseData:(NSData *)data{
    [self.entityList removeAllObjects];
    [self startParseWithData:data];
    return self.entityList;
}

- (NSMutableArray *) arrayAppendArray:(NSMutableArray *)musicInfoEntityArray WithParseData:(NSData *)data{
    self.entityList =musicInfoEntityArray;
    [self startParseWithData:data];
    return self.entityList;
}

-(void)startParseWithData:(NSData *)data{
    self.currentString = [NSMutableString string];
	NSXMLParser *XMLParser = [[NSXMLParser alloc] initWithData:data];
    XMLParser.delegate = self;
	[XMLParser parse];
	XMLParser = nil;
    self.currentString = nil;


}



- (void)insertEntityToList:(MusicInfoEntity *)entity
{
    [self.entityList addObject:entity];
}

#pragma mark NSXMLParser Parsing Callbacks

static NSString *kMusicInfo = @"MusicInfo";
static NSString *kMusicId = @"musicId";
static NSString *kCount = @"count";
static NSString *kCrbtValidity = @"crbtValidity";
static NSString *kPrice = @"price";
static NSString *kSongName = @"songName";
static NSString *kSingerId = @"singerId";
static NSString *kSingerName = @"singerName";
static NSString *kRingValidity = @"ringValidity";
static NSString *kSongValidity = @"songValidity";
static NSString *kAlbumPicDir = @"albumPicDir";
static NSString *kSingerPicDir = @"singerPicDir";
static NSString *kCrbtListenDir = @"crbtListenDir";
static NSString *kRingListenDir = @"ringListenDir";
static NSString *kSongListenDir = @"songListenDir";
static NSString *kLrcDir = @"lrcDir";
static NSString *kresCode = @"resCode";
static NSString *kresCounter = @"resCounter";
static NSString *kresMsg = @"resMsg";

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *) qualifiedName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:kMusicInfo])
    {
        self.entity = [[MusicInfoEntity alloc] init];
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kMusicId])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kCount])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kCrbtValidity])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kPrice])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kSongName])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kSingerId])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kSingerName])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kRingValidity])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kSongValidity])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kAlbumPicDir])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kSingerPicDir])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kCrbtListenDir])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kRingListenDir])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kSongListenDir])
    {
        [self.currentString setString:@""];
    }
    else if ([elementName isEqualToString:kLrcDir])
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
    if ([elementName isEqualToString:kMusicInfo])
    {
        [self insertEntityToList:self.entity];
    }
    else if ([elementName isEqualToString:kMusicId])
    {
        self.entity.musicId = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kCount])
    {
        self.entity.count = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kCrbtValidity])
    {
        self.entity.crbtValidity = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kPrice])
    {
        self.entity.price = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kSongName])
    {
        self.entity.songName = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kSingerId])
    {
        self.entity.singerId = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kSingerName])
    {
        self.entity.singerName = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kRingValidity])
    {
        self.entity.ringValidity = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kSongValidity])
    {
        self.entity.songValidity = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kAlbumPicDir])
    {
        self.entity.albumPicDir = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kSingerPicDir])
    {
        self.entity.singerPicDir = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kCrbtListenDir])
    {
        self.entity.crbtListenDir = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kRingListenDir])
    {
        self.entity.ringListenDir = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kSongListenDir])
    {
        self.entity.songListenDir = [NSString stringWithFormat:@"%@", self.currentString];
    }
    else if ([elementName isEqualToString:kLrcDir])
    {
        self.entity.lrcDir = [NSString stringWithFormat:@"%@", self.currentString];
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

