//
//  SLBaseTableHeaderFooterView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseTableHeaderFooterView.h"

@interface SLBaseTableHeaderFooterView ()

@end

@implementation SLBaseTableHeaderFooterView
-(void)dealloc {
    _lineView = nil;
}

+(CGFloat)getViewHeight
{
    return 44.f;
}
    
+(CGFloat)getViewHeightWithData:(id)data
{
    return 44.f;
}
    
+(instancetype)constructorView:(UITableView *)tableView section:(NSInteger)section
{
    NSString *identifier = NSStringFromClass([self class]);
    SLBaseTableHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (nil == header) {
        header = [[self alloc] initWithReuseIdentifier:identifier];
        header.backGroundView.backgroundColor = LightGrayBackGroundColor;
    }
    return header;
}
    
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _backGroundView = [UIView new];
        [self addSubview:_backGroundView];
        [self createSubviews];
    }
    return self;
}
    
-(void)createSubviews {
    _lineView = [UIView new];
    _lineView.backgroundColor = LightGrayBackGroundColor;
    [self addSubview:_lineView];
}

-(void)layoutSubviews
{
    [_backGroundView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.bottom.equalTo(@-0.5);
    }];
    
    [_lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
