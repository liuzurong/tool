//
//  UIViewController+Util.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "UIViewController+Util.h"
#import <Toast/UIView+Toast.h>

@implementation UIViewController (Util)

-(CGFloat)width
{
    return self.view.frame.size.width;
}

-(CGFloat)height
{
    return self.view.frame.size.height;
}

-(CGFloat)originX
{
    return self.view.frame.origin.x;
}

-(CGFloat)originY
{
    return self.view.frame.origin.y;
}

-(UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.clipsToBounds = YES;//ios 8以后会出现中文像素混合问题
    [self.view addSubview:label];
    return label;
}

-(void)makeToast:(NSString *)text {
    [self.view makeToast:text duration:3 position:CSToastPositionCenter];
}

-(UIViewController *)topViewController {
    UIViewController *topVC = nil;
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedVC = ((UITabBarController *)rootViewController).selectedViewController;
        if ([selectedVC isKindOfClass:[UINavigationController class]]) {
            topVC = ((UINavigationController *)selectedVC).topViewController;
        } else {
            topVC = selectedVC;
        }
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        topVC = ((UINavigationController *)rootViewController).topViewController;
    } else {
        topVC = rootViewController;
    }
    return topVC;
}

@end
