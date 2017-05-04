//
//  RightView.m
//  Muslims
//
//  Created by David Tong on 5/5/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "RightView.h"

@implementation RightView

- (void) awakeFromNib {
    _badgeNumberView.layer.masksToBounds = TRUE;
    _badgeNumberView.layer.cornerRadius = _badgeNumberView.frame.size.height/2;
    [super awakeFromNib];
}

@end
