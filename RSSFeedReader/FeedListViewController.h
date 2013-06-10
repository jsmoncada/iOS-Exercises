//
//  FeedListViewController.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/6/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@interface FeedListViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,SecondDelegate>

@property(strong, nonatomic) NSMutableArray *feedList;
@property (strong,nonatomic) NSMutableDictionary *item;
@property (strong,nonatomic) NSMutableArray *outList;
@end
