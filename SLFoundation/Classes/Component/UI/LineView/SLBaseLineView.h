//
//  SLBaseLineView.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>

@interface SLBaseLineView : SLBaseView
{
    CGRect mClientRect;
    double mMaxValue, mMinValue;
    double mPerHeight, mPerWidth;
}
@property (nonatomic, assign) BOOL showCursor;

-(void)drawBorder:(CGRect)rect color:(UIColor *)color;
-(void)drawVDash:(CGRect)rect color:(UIColor *)color count:(NSInteger)count;
-(void)drawHDash:(CGRect)rect color:(UIColor *)color count:(NSInteger)count;
@end
