//
//  NSURLConnection+sendSynchronousRequestWithString.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/4/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (sendSynchronousRequestWithString)
+ (NSData *)sendSynchronousRequestWithString:(NSString*)urlString error:(NSError *)error;
@end
