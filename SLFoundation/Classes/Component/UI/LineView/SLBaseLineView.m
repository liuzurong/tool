//
//  SLBaseLineView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseLineView.h"

@implementation SLBaseLineView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        mClientRect = frame;
    }
    return self;
}

#pragma mark - overrided method
-(void)drawBorder:(CGRect)rect color:(UIColor *)color
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5f);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokeRect(context, rect);
}

-(void)drawHDash:(CGRect)rect color:(UIColor *)color count:(NSInteger)count
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    CGPoint points[2];
    CGPoint pt0, pt1;
    CGFloat arrLength[] = {2,2};
    
    CGContextSetLineDash(context, 0, arrLength, 2);
    CGFloat fStep = rect.size.height/(count + 1);
    for (int i = 1; i < count + 1; ++i) {
        pt0.x = rect.origin.x;
        pt0.y = rect.origin.y + i * fStep;
        
        pt1.x = CGRectGetMaxX(rect);
        pt1.y = pt0.y;
        
        points[0] = pt0;
        points[1] = pt1;
        CGContextAddLines(context, points, 2);
        CGContextStrokePath(context);
    }
    
    CGContextSetLineDash(context, 0, NULL, 0);
}

-(void)drawVDash:(CGRect)rect color:(UIColor *)color count:(NSInteger)count
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    CGPoint points[2];
    CGPoint pt0, pt1;
    CGFloat arrLength[] = {2,2};
    
    CGContextSetLineDash(context, 0, arrLength, 2);
    CGFloat fStep = rect.size.width/(count + 1);
    for (int i = 1; i < count + 1; ++i) {
        pt0.x = rect.origin.x + i * fStep;
        pt0.y = rect.origin.y;
        
        pt1.x = pt0.x;
        pt1.y = CGRectGetMaxY(rect);
        
        points[0] = pt0;
        points[1] = pt1;
        CGContextAddLines(context, points, 2);
        CGContextStrokePath(context);
    }
    
    CGContextSetLineDash(context, 0, NULL, 0);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
