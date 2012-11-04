
//
//  HTHorizonalTableCell.m
//  HorizontalTable
//
//  Created by hk0401 on 12/11/04.
//  Copyright (c) 2012年 hk41. All rights reserved.
//

#import "HTHorizontalTableCell.h"

@implementation HTHorizontalTableCell
@synthesize distance = _distance;
@synthesize numLabel = _numLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self transform];
    }
    return self;
}

- (void)transformCell {
    float rate = [self rateOfDistance];
    float transformAngle = [self angleForDistance:rate];
    float transformScale = [self scaleForistance:rate];
    
    CGAffineTransform t;
    t = CGAffineTransformMakeScale(transformScale, transformScale);
    t = CGAffineTransformRotate(t, transformAngle);
    
    _numLabel.transform = t;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (float)rateOfDistance {
    return (float)(_distance * 2.0f / self.frame.size.width);
}

- (float)scaleForistance:(float)rate {
    return (1-rate) * 1.2 + 1;
}

- (float)angleForDistance:(float)rate {
    static const float coefficient = 4.0f;
    static const float baseAngle = - M_PI/3.0f; //60 degree
    
    if (fabsf(rate) > 0.25f) {
        return copysignf(1.0f, rate) * baseAngle;
    }
    return coefficient * rate * baseAngle;
}


@end
