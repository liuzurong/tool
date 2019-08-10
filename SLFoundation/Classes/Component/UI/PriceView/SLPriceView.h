//
//  SLPriceView.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>

@interface SLPriceView : SLBaseView

@property (nonatomic, assign) UIImage *image;
@property (nonatomic, assign) NSString *text;
@property (nonatomic, assign) UIFont *font;
@property (nonatomic, assign) UIColor *textColor;
    
-(void)setDoubleValue:(double)fValue;
-(void)showDownImage;
-(void)showUpImage;
@end
