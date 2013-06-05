//
//  ViewController.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/3/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "ViewController.h"
#import "RssXMLParser.h"
#import "NSURLConnection+sendSynchronousRequestWithString.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize rssData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
-(NSData *)getRSSContent:(NSString *)url
{
    NSURL *urlRef = [NSURL URLWithString:url];
    NSURLRequest *rssRequest = [NSURLRequest requestWithURL:urlRef];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:rssRequest returningResponse:&response error:&error];
    return data;
}*/

- (void)loadView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    
    self.title = @"RSS Feed";
    self.view = tableView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //NSData *theFeed = [self getRSSContent:@"http://news.yahoo.com/rss/entertainment"];
    NSError *err = nil;
    NSData *theFeed = [NSURLConnection sendSynchronousRequestWithString:@"http://news.yahoo.com/rss/entertainment" error:err];
    rssData = [RssXMLParser feedItemsWithRSSData:theFeed];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rssData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    [cell.textLabel setText:[[rssData objectAtIndex:indexPath.row ] objectForKey:@"title"]];
    [cell.detailTextLabel setText:[[rssData objectAtIndex:indexPath.row ] objectForKey:@"pubDate"]];
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
