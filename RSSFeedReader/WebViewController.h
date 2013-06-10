//
//  WebViewController.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/10/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSURL *path;
@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) MBProgressHUD *hud;

@end
