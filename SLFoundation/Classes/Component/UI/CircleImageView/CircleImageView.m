//
//  CircleImageView.m
//  SLFoundation
//
//  Created by tgtao on 2018/1/4.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView

-(void)setImage:(UIImage *)image {
    [super setImage:[image circleImage]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
