//
//  UIViewController+Util.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Util)

-(CGFloat)width;
-(CGFloat)height;
-(CGFloat)originX;
-(CGFloat)originY;

-(UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;
-(void)makeToast:(NSString *)text;

-(UIViewController *)topViewController;
@end
