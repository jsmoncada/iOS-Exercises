//
//  RssXMLParser.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/3/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "RssXMLParser.h"

@implementation RssXMLParser
NSMutableArray *arr;
NSMutableDictionary *item;
NSMutableString *itemCont;

- (void) parseRssXML:(NSData *)xmldata
{
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmldata];
    [xmlParser setDelegate:self];
    [xmlParser setShouldResolveExternalEntities:NO];
    item = [[NSMutableDictionary alloc] init];
    arr = [NSMutableArray array];
    [xmlParser parse];
}
- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    itemCont = [[NSMutableString alloc] init];
    if([elementName isEqualToString:@"title"])
    {
        [item setObject:itemCont forKey:elementName];
    }else if([elementName isEqualToString:@"link"])
    {
        [item setObject:itemCont forKey:elementName];
    }else if([elementName isEqualToString:@"description"])
    {
        [item setObject:itemCont forKey:elementName];
    }else if([elementName isEqualToString:@"pubDate"])
    {
        [item setObject:itemCont forKey:elementName];
        [arr addObject:item];
        item = [[NSMutableDictionary alloc] init];
    }
}
+ (NSMutableArray *)feedItemsWithRSSData:(NSData *)rssData
{
    RssXMLParser *xmlparser = [[RssXMLParser alloc] init];
    [xmlparser parseRssXML:rssData];
    return arr;
}
- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if( [elementName isEqualToString:@"rss"] )
    {
        NSLog(@"xxxxx");
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [itemCont appendString:string];
}



@end
