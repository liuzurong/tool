//
//  SLLineSegmentView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLLineSegmentView.h"

@interface SLLineSegmentView ()

@property (nonatomic, strong) UIButton *currentButton;
@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, copy) NSArray *buttons, *layers;
@end
@implementation SLLineSegmentView
+(CGFloat)getViewHeight
{
    return AdaptHeightByIp6(36.f);
}

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    if (self = [super initWithFrame:frame]) {
        _selectedSignal = [RACSubject subject];
        self.titles = titles;
        [self initView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame titles:@[@"月", @"季", @"半年", @"一年"]];
}

-(void)initView
{
    self.layer.cornerRadius = 4.f;
    self.clipsToBounds = YES;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = GrayBackGroundColor.CGColor;
    NSArray *titles = self.titles;
    CGFloat fLineWidth = 0.5f;
    CGFloat fItemtWidth = (self.frame.size.width - 3 * fLineWidth) /titles.count;
    CGFloat fItemHeight = self.frame.size.height;
    
    NSMutableArray *buttons = [NSMutableArray arrayWithCapacity:titles.count];
    NSMutableArray *layers = [NSMutableArray arrayWithCapacity:titles.count];
    @weakify(self);
    for (int i = 0; i < titles.count; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button.titleLabel setFont:FontWithSize(12.f)];
        [button setTitleColor:TextNormalColor forState:UIControlStateNormal];
        [button setTitleColor:TextBlueColor forState:UIControlStateSelected];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake((fItemtWidth + fLineWidth)  * i, 0, fItemtWidth, fItemHeight);
        button.layer.backgroundColor = WhiteBackGroundColor.CGColor;
        [self addSubview:button];
        [buttons addObject:button];
        
        CALayer *layer = [CALayer new];
        layer.frame = CGRectMake(CGRectGetMaxX(button.frame), 0, fLineWidth, fItemHeight);
        layer.backgroundColor = GrayBackGroundColor.CGColor;
        [self.layer addSublayer:layer];
        [layers addObject:layer];
        if (i == 3) {
            button.selected = YES;
            _currentButton = button;
        }
        
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton* x) {
            @strongify(self);
            if (self.currentButton == x) {
                return;
            }
            
            self.currentButton.selected = NO;
            x.selected = YES;
            self.currentButton = x;
            [self.selectedSignal sendNext:@(i)];
        }];
    }
    
    _buttons = buttons;
    _layers = layers;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    NSArray *titles = self.titles;
    CGFloat fLineWidth = 0.5f;
    CGFloat fItemtWidth = (self.frame.size.width - 3 * fLineWidth) /titles.count;
    CGFloat fItemHeight = self.frame.size.height;
    
    for (int i = 0; i < titles.count; ++i) {
        if (i < _buttons.count && i < _layers.count) {
            UIButton *button = _buttons[i];
            button.frame = CGRectMake((fItemtWidth + fLineWidth)  * i, 0, fItemtWidth, fItemHeight);
            CALayer *layer = _layers[i];
            layer.frame = CGRectMake(CGRectGetMaxX(button.frame), 0, fLineWidth, fItemHeight);
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
