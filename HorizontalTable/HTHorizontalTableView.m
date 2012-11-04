//
//  HTHorizontalTableView.m
//  HorizontalTable
//
//  Created by hk0401 on 12/11/04.
//  Copyright (c) 2012年 hk41. All rights reserved.
//

#import "HTHorizontalTableView.h"
#import "HTHorizontalTableCell.h"

@implementation HTHorizontalTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        CGAffineTransform t = CGAffineTransformMakeRotation(-M_PI_2);
        self.transform = t;
        self.scrollsToTop = NO;
        self.bounces = NO;
    }
    return self;
}

- (void)transformView {
    NSMutableArray *cells = [NSMutableArray array];
    NSArray *indexPaths = [self indexPathsForVisibleRows];
    
    for (NSIndexPath *indexPath in indexPaths) {
        HTHorizontalTableCell *cell = (HTHorizontalTableCell *)[self cellForRowAtIndexPath:indexPath];
        cell.distance = [self distanceFromCenter:indexPath];
        [cells addObject:cell];
    }
    for (HTHorizontalTableCell *cell in cells) {
        [cell transformCell];
    }
}

- (CGFloat)distanceFromCenter:(NSIndexPath *)indexPath {
    CGRect rect = [self rectForRowAtIndexPath:indexPath];
    CGFloat centerCellOffset = rect.origin.y+rect.size.height/2;
    CGFloat offset = self.contentOffset.y;
    CGFloat centerOffset = (self.bounds.size.height/2)+offset;
    return (centerCellOffset - centerOffset);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
