//
//  UIColor+hexStr.h
//  SLFoundation
//
//  Created by liuzurong on 2018/3/12.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexStr)
+ (UIColor *)colorHex:(NSString *)hexString;

+ (UIColor *)colorHex:(NSString *)hexString alpha:(CGFloat)alpha;
@end
