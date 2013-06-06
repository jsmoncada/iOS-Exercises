//
//  ArticleViewController.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/6/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property (strong,nonatomic) NSString *pagetitle;
@property (strong,nonatomic) NSMutableDictionary *articleinfo;
@end
