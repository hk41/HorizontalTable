//
//  HTHorizonalTableCell.h
//  HorizontalTable
//
//  Created by hk0401 on 12/11/04.
//  Copyright (c) 2012年 hk41. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTHorizontalTableCell : UITableViewCell {
    CGFloat distance;
}
@property (nonatomic) CGFloat distance;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

- (void)transformCell;

@end
