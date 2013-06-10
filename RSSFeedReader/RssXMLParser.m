//
//  RssXMLParser.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/3/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "RssXMLParser.h"
@interface RssXMLParser ()

@property(strong, nonatomic) NSMutableArray *arr;
@property(strong, nonatomic) NSMutableDictionary *item;
@property(strong, nonatomic) NSMutableString *itemCont;

@end

@implementation RssXMLParser

@synthesize arr;
@synthesize item;
@synthesize itemCont;

- (void) parseRssXML:(NSData *)xmldata
{
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmldata];
    [xmlParser setDelegate:self];
    [xmlParser setShouldResolveExternalEntities:NO];
    item = [[NSMutableDictionary alloc] init];
    itemCont = [[NSMutableString alloc] init];
    arr = [NSMutableArray array];
    [xmlParser parse];
}
- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"title"])
    {
        [item setObject:itemCont forKey:elementName];
    }else if([elementName isEqualToString:@"link"])
    {
        [item setObject:itemCont forKey:elementName];
    }else if([elementName isEqualToString:@"description"])
    {
        [item setObject:itemCont forKey:elementName];
    }else if ([elementName isEqualToString:@"media:content"])
    {
        [item setObject:[attributeDict objectForKey:@"url"] forKey:@"image"];
    }else if([elementName isEqualToString:@"link"])
    {
        [item setObject:itemCont forKey:elementName];
    }else
    {
    
    }
}
+ (NSMutableArray *)feedItemsWithRSSData:(NSData *)rssData
{
    RssXMLParser *xmlparser = [[RssXMLParser alloc] init];
    [xmlparser parseRssXML:rssData];
    return xmlparser->arr;
}
- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if( [elementName isEqualToString:@"rss"] )
    {
        NSLog(@"xxxxx");
    }else if([elementName isEqualToString:@"item"])
    {
        [arr addObject:item];
        item = [[NSMutableDictionary alloc] init];
    }else if([elementName isEqualToString:@"pubDate"])
    {
        NSString *string = itemCont;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss Z"];
        //NSLocale *enLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
        //[formatter setLocale:enLocale];
        NSDate *date = [formatter dateFromString:string];
        [item setObject:date forKey:elementName];
        
    }
    itemCont = [[NSMutableString alloc] init];
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [itemCont appendString:string];
}



@end
