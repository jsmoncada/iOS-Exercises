//
//  NSURLConnection+sendSynchronousRequestWithString.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/4/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "NSURLConnection+sendSynchronousRequestWithString.h"

@implementation NSURLConnection (sendSynchronousRequestWithString)
+ (NSData *)sendSynchronousRequestWithString:(NSString*)urlString error:(NSError *)error
{
    NSURL *urlRef = [NSURL URLWithString:urlString];
    NSURLRequest *rssRequest = [NSURLRequest requestWithURL:urlRef];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:rssRequest returningResponse:&response error:&error];
    return data;
}
@end
