//
//  ViewController.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/3/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssXMLParser.h"
@interface ViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
{

}
@property(strong, nonatomic) NSMutableArray *rssData;
@property(strong, nonatomic) NSString *rssURL;
@property(strong, nonatomic) NSString *rssName;
@property(strong, nonatomic) UIActivityIndicatorView *spinner;
@end
