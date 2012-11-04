//
//  HTViewController.m
//  HorizontalTable
//
//  Created by hk0401 on 12/11/04.
//  Copyright (c) 2012年 hk41. All rights reserved.
//

#import "HTViewController.h"
#import "HTHorizontalTableView.h"
#import "HTHorizontalTableCell.h"

@interface HTViewController ()
@property (weak, nonatomic) IBOutlet HTHorizontalTableView *tableView;
- (void)initialize;
@end

@implementation HTViewController
@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initialize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [rowset count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    HTHorizontalTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI_2);
    cell.transform = rotate;
    cell.numLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    [cell transformCell];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [(HTHorizontalTableView *)scrollView transformView];
}

#pragma mark - private method

- (void)initialize {
    rowset = [NSMutableArray array];
    for (int i=0; i<12; i++) {
        [rowset addObject:[NSString stringWithFormat:@"%d", i]];
    }
    [_tableView reloadData];
    [_tableView transformView];
}

@end
