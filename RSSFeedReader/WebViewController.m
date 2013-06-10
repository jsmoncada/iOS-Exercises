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
@synthesize webView;
@synthesize hud;

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

- (void)webViewDidFinishLoad:(UIWebView *)web
{
    [hud hide:YES];
    
}
-(void) viewDidAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        CGRect webFrame = CGRectMake(0.0, 0.0, 320.0, 460.0);
    webView = [[UIWebView alloc] initWithFrame:webFrame];
    webView.delegate = self;
    self.view=webView;
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:path];
    
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading";
    [webView loadRequest:requestObj];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
