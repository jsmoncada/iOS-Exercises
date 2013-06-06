//
//  CustomCell.m
//  RSSFeedReader
//
//  Created by Julia Moncada on 6/5/13.
//  Copyright (c) 2013 Julia Moncada. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize primaryLabel,secondaryLabel,myImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        primaryLabel = [[UILabel alloc] init];
        primaryLabel.font = [UIFont systemFontOfSize:16];
        secondaryLabel = [[UILabel alloc] init];
        secondaryLabel.font = [UIFont systemFontOfSize:12];
        myImageView = [[UIImageView alloc] init];
        myImageView.contentMode = UIViewContentModeRedraw;
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:myImageView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
