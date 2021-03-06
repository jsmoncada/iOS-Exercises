//
//  ArticleViewController.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/6/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "ArticleViewController.h"
#import "WebViewController.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController
@synthesize pagetitle;
@synthesize articleinfo;
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
    UIView *articleView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    articleView.backgroundColor = [UIColor whiteColor];
    self.title = pagetitle;
    self.view = articleView;
    
}
-(void) viewFull
{
    NSString *path = [articleinfo objectForKey:@"link"];
    NSURL *url = [NSURL URLWithString:path];
    //[[UIApplication sharedApplication] openURL:url];
    WebViewController *newViewController = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    newViewController.path = url;
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:newViewController animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem *fullArt = [[UIBarButtonItem alloc] initWithTitle:@"Full Article"
                                                                style:UIBarButtonItemStyleDone target:self action:@selector(viewFull)];
    self.navigationItem.rightBarButtonItem = fullArt;
    
    CGSize constraint = CGSizeMake(260, 20000.0f);
    CGSize size = [[articleinfo objectForKey:@"title"] sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat aheight = MAX(size.height, 44.0f);
    
    UILabel *aLabel = [[UILabel alloc] init];
    aLabel.LineBreakMode = NSLineBreakByWordWrapping;
    aLabel.font = [UIFont systemFontOfSize:16];
    aLabel.textAlignment = NSTextAlignmentCenter;
    [aLabel setNumberOfLines:0];
    [aLabel setFrame:CGRectMake(30, 10, 260, aheight)];
    [aLabel setText:[articleinfo objectForKey:@"title"]];
    
    UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, aheight + 15, 260, 10)];
    dLabel.font = [UIFont systemFontOfSize:10];
    dLabel.textAlignment = NSTextAlignmentCenter;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss z"];
    NSDate *date = [articleinfo objectForKey:@"pubDate"];
    NSString *dateString = [formatter stringFromDate:date];

    [dLabel setText:dateString];
    
    NSString *desc = [self stringByStrippingHTML:[articleinfo objectForKey:@"description"]];
    constraint = CGSizeMake(290, 20000.0f);
    size = [desc sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat desheight = MAX(size.height, 44.0f);
    
    UILabel *desLabel = [[UILabel alloc] init];
    desLabel.font = [UIFont systemFontOfSize:13];
    desLabel.textAlignment = NSTextAlignmentCenter;
    [desLabel setNumberOfLines:0];
    [desLabel setFrame:CGRectMake(15, aheight + 35, 290, desheight)];
    [desLabel setText:desc];
        
    [self.view addSubview:aLabel];
    [self.view addSubview:dLabel];
    [self.view addSubview:desLabel];

}
-(NSString *) stringByStrippingHTML:(NSString*)input {
    NSRange r;
    while ((r = [input rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        input = [input stringByReplacingCharactersInRange:r withString:@""];
    return input;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
