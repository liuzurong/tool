//
//  SLBaseCell.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Util.h"
#import "Colors.h"
#import "Macros.h"

@interface SLBaseCell : UITableViewCell
@property (nonatomic, strong) UIView *lineView;

+(CGFloat)getCellHeight;
+(CGFloat)getCellHeightWithData:(id)data;
+(instancetype)constructorCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
//-(void)createSubviews;
//-(UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;

-(void)configureCell:(id)object;
@end
