//
//  SLBaseView.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Util.h"
#import "Colors.h"
#import "Macros.h"

@interface SLBaseView : UIView
@property (nonatomic, strong) id param;

-(UIViewController *)topViewController;
@end
