//
//  ModalViewController.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/7/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSMutableArray *feedList;

@end
