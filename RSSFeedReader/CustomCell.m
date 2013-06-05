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
        CGRect contentRect = self.contentView.bounds;
        CGFloat boundsX = contentRect.origin.x;
        // Initialization code
        primaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(boundsX+70 ,5, 200, 15)];
        //primaryLabel.textAlignment = UITextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:16];
        CGFloat pLabelY = CGRectGetMaxY(primaryLabel.frame);
        secondaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(boundsX+70 ,pLabelY + 5, 200, 25)];
        //secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:12];
        myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(boundsX+10 ,0, 50, 50) ];
        myImageView.contentMode = UIViewContentModeScaleAspectFit;
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
/*
- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame= CGRectMake(boundsX+10 ,0, 50, 50);
    myImageView.frame = frame;
    
    frame= CGRectMake(boundsX+70 ,5, 200, 25);
    primaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+70 ,30, 100, 15);
    secondaryLabel.frame = frame;
}*/

-(CGFloat) heightOfPLabel
{
    CGSize constraint = CGSizeMake(200, 20000.0f);
    
    CGSize size = [primaryLabel.text sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    return height;
}

@end
