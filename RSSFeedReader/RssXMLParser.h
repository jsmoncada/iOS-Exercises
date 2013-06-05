//
//  RssXMLParser.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/3/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface RssXMLParser : NSObject <NSXMLParserDelegate>

+ (NSMutableArray *)feedItemsWithRSSData:(NSData *)rssData;

@end
