//
//  SLBaseTableHeaderFooterView.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Util.h"

@interface SLBaseTableHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UIView *lineView;
    
+(CGFloat)getViewHeight;
+(CGFloat)getViewHeightWithData:(id)data;
+(instancetype)constructorView:(UITableView *)tableView section:(NSInteger)section;
@end
