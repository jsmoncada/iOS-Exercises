//
//  FeedListViewController.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/6/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "FeedListViewController.h"
#import "ViewController.h"
#import "ModalViewController.h"


@interface FeedListViewController ()

@end

@implementation FeedListViewController
@synthesize feedList;
@synthesize item;
@synthesize outList;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    feedList = [NSMutableArray array];
    outList = [NSMutableArray array];
    self.title = @"Feed List";
    self.view = tableView;
    item = [[NSMutableDictionary alloc] init];
    [item setObject:@"Yahoo Entertainment" forKey:@"sitename"];
    [item setObject:@"http://news.yahoo.com/rss/entertainment" forKey:@"siteURL"];
    [item setObject:@"ON" forKey:@"isOn"];
    [feedList addObject:item];
    item = [[NSMutableDictionary alloc] init];
    [item setObject:@"Yahoo Sports" forKey:@"sitename"];
    [item setObject:@"http://news.yahoo.com/rss/sports" forKey:@"siteURL"];
    [item setObject:@"ON" forKey:@"isOn"];
    [feedList addObject:item];
    item = [[NSMutableDictionary alloc] init];
    [item setObject:@"National Geographic" forKey:@"sitename"];
    [item setObject:@"http://news.nationalgeographic.com/index.rss" forKey:@"siteURL"];
    [item setObject:@"ON" forKey:@"isOn"];
    [feedList addObject:item];
    
}
- (void)secondViewControllerDismissed:(NSMutableArray*)returnArray
{
    feedList = [NSMutableArray array];
    feedList = returnArray;
    outList = [NSMutableArray array];
    int ctr = 0;
    while (ctr < [feedList count]){
        item = [feedList objectAtIndex:ctr];
        NSString *text = [item objectForKey:@"isOn"];
        if([text isEqualToString:@"ON"]){
            [outList addObject:item];
        }
        ctr++;
    }
    [self.tableView reloadData];
}
-(void) subFeed
{
    ModalViewController *mv = [[ModalViewController alloc]
                                            initWithNibName:@"ModalViewController"
                                            bundle:nil];
    [mv setFeedList:feedList];
    mv.myDelegate = self;
    // Create a Navigation controller
    UINavigationController *navController = [[UINavigationController alloc]
                                             initWithRootViewController:mv];
    
    // show the navigation controller modally
    [self presentViewController:navController animated:YES completion:nil];

}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *subscribe = [[UIBarButtonItem alloc] initWithTitle:@"Subscribe"
                                                                    style:UIBarButtonItemStylePlain target:self action:@selector(subFeed)];
    self.navigationItem.rightBarButtonItem = subscribe;
    
    int ctr = 0;
    while (ctr < [feedList count]){
        item = [feedList objectAtIndex:ctr];
        
        NSString *text = [item objectForKey:@"isOn"];
        if([text isEqualToString:@"ON"]){
            [outList addObject:item];
        }
        ctr++;
    }

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [outList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell.textLabel setText:[[outList objectAtIndex:indexPath.row] objectForKey:@"sitename"]];
    }

    [cell.textLabel setText:[[outList objectAtIndex:indexPath.row] objectForKey:@"sitename"]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     ViewController *newViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    newViewController.rssName = [[outList objectAtIndex:indexPath.row] objectForKey:@"sitename"];
    newViewController.rssURL = [[outList objectAtIndex:indexPath.row] objectForKey:@"siteURL"];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:newViewController animated:YES];
     
}

@end
