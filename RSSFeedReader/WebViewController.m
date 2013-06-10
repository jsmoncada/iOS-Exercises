//
//  WebViewController.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/10/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "WebViewController.h"
#import "MBProgressHUD.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize path;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)loadView
{

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CGRect webFrame = CGRectMake(0.0, 0.0, 320.0, 460.0);
    UIWebView *webView = [[UIWebView alloc] initWithFrame:webFrame];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:path];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        [webView loadRequest:requestObj];
        self.view=webView;
        dispatch_async(dispatch_get_main_queue(), ^{
            //[spinner stopAnimating];
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //[spinner removeFromSuperview];
        });
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
