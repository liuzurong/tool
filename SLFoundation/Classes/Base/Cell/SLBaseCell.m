//
//  SLBaseCell.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseCell.h"

@implementation SLBaseCell
    
-(void)dealloc {
    _lineView = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)getCellHeight
{
    return 44.f;
}

+(CGFloat)getCellHeightWithData:(id)data
{
    return 44.f;
}

+(instancetype)constructorCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([self class]);
    SLBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = WhiteBackGroundColor;
    }
    return cell;
}

//-(UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment
//{
//    UILabel *label = [[UILabel alloc] init];
//    label.font = font;
//    label.textColor = color;
//    label.textAlignment = textAlignment;
//    label.clipsToBounds = YES;//ios 8以后会出现中文像素混合问题
//    label.text = @"--";
//    [self addSubview:label];
//    return label;
//}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}
    
-(void)createSubviews
{
    _lineView = [UIView new];
    _lineView.backgroundColor = MainBackGroundColor;
    [self addSubview:_lineView];
}
    
-(void)layoutSubviews {
    [super layoutSubviews];
    [self bringSubviewToFront:_lineView];
    [_lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}

-(void)configureCell:(id)object
{
    
}

@end
