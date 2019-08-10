//
//  SLBaseView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseView.h"

@implementation SLBaseView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initData];
        [self createSubviews];
        
    }
    return self;
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
