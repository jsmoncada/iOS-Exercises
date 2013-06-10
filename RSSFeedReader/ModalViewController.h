//
//  ModalViewController.h
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/7/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondDelegate <NSObject>
-(void) secondViewControllerDismissed:(NSMutableArray*)returnArray;
@end

@interface ModalViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    __unsafe_unretained id myDelegate;
}

@property (nonatomic, assign) id<SecondDelegate>    myDelegate;
@property(strong, nonatomic) NSMutableArray *feedList;

@end
