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
#import "CustomCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize rssData;
@synthesize rssURL;
@synthesize rssName;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    
    self.title = rssName;
    self.view = tableView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *err = nil;
    //rssURL = @"http://news.yahoo.com/rss/entertainment";
    //rssURL = @"http://news.nationalgeographic.com/index.rss";
    NSData *theFeed = [NSURLConnection sendSynchronousRequestWithString:rssURL error:err];
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
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.primaryLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [cell.primaryLabel setNumberOfLines:0];
    }
    
    [cell.primaryLabel setText:[[rssData objectAtIndex:indexPath.row ] objectForKey:@"title"]];
    [cell.secondaryLabel setText:[[rssData objectAtIndex:indexPath.row ] objectForKey:@"pubDate"]];
    
    CGSize constraint = CGSizeMake(210, 20000.0f);
    
    CGSize size = [cell.primaryLabel.text sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    [cell.primaryLabel setFrame:CGRectMake(cell.contentView.bounds.origin.x + 80, 5,210,height)];
    [cell.secondaryLabel setFrame:CGRectMake(cell.contentView.bounds.origin.x + 80, CGRectGetMaxY(cell.primaryLabel.frame) + 5,200,25)];
    [cell.myImageView setFrame:CGRectMake(cell.contentView.bounds.origin.x + 5, 10,70,height+15)];
    NSString *path = [[rssData objectAtIndex:indexPath.row ] objectForKey:@"image"];
    NSURL *imgurl = [NSURL URLWithString:path];
    UIImage *image = [UIImage imageWithData:[[NSData alloc] initWithContentsOfURL:imgurl]];
    if (image == nil) {
        image = [UIImage imageNamed:@"default.jpg"];
    }
    cell.myImageView.image = image;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *txt = [[rssData objectAtIndex:[indexPath row]] objectForKey:@"title"];
    
    CGSize constraint = CGSizeMake(210, 20000.0f);
    
    CGSize size = [txt sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    return height + 35;
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
