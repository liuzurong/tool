//
//  DDXSegmentView.m
//  DDXStockGuard
//
//  Created by DDX-A2 on 16/1/9.
//  Copyright © 2016年 tongtao. All rights reserved.
//

#import "DDXSegmentView.h"

#define kDevisionLineWidth 0.3f

@interface DDXSegmentView ()
{
    NSInteger _iSelectIndex;
    UIImageView *_indicatorView,*_underLineView;
    NSMutableArray *_arrButtons;
    float _fItemWidth;
    UIView *verticalLineView;
    NSMutableArray *_lineArrays;
}

@end

@implementation DDXSegmentView

-(void)dealloc
{
    
}

-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles
{
    return [self initWithFrame:frame selectIndex:index titles:arrTitles segmentStyle:SegmentStyleBorder];
}

-(instancetype)initUnderLineWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles
{
    return [self initWithFrame:frame selectIndex:index titles:arrTitles segmentStyle:SegmentStyleUnderLine];
}

-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles segmentStyle:(SegmentStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectedIndex = index;
        _arrButtons = [NSMutableArray array];
        _lineArrays =  [NSMutableArray array];
        float fItemWidth = frame.size.width/arrTitles.count;
        
        float fOffset = 10.f;
        fItemWidth = (frame.size.width - fOffset * 2)/arrTitles.count;
        
        _fItemWidth = fItemWidth;
        
        NSInteger iCount = arrTitles.count;
        NSMutableArray *arrSignals = [NSMutableArray array];
        for (int i = 0; i < iCount; ++i) {
            DDXSegmentButton *button = [[DDXSegmentButton alloc] initWithFrame:CGRectMake(i * fItemWidth + fOffset, 0, fItemWidth, frame.size.height) title:arrTitles[i] image:nil];
            [button setTitleFont:[UIFont systemFontOfSize:frame.size.height * 1/2]];
            [self addSubview:button];
            button.layer.borderWidth = 0;
            [_arrButtons addObject:button];
            button.tag = i;
            [arrSignals addObject:[button rac_signalForControlEvents:UIControlEventTouchUpInside]];
            if (style == SegmentStyleBorder) {
                
                if (i != iCount - 1) {
                    UIView *devisionView = [[UIView alloc] initWithFrame:CGRectMake((i + 1) * fItemWidth + fOffset - 0.5, frame.size.height/4, kDevisionLineWidth, frame.size.height/2)];
                    devisionView.backgroundColor = TextNormalColor;
                    [self addSubview:devisionView];
                }
                if (i == 0) {
                    //                    button.titleEdgeInsets = UIEdgeInsetsMake(0, -60, 0, 0);
                }
            }
        }
        
        self.selectedSignal = [RACSignal merge:arrSignals];
        @weakify(self);
        [self.selectedSignal subscribeNext:^(UIButton* button) {
            @strongify(self);
            if (self.selectedIndex == button.tag) {
                return;
            }
            CGRect rect = self->_indicatorView.frame;
            rect.origin.x = button.tag * fItemWidth + fOffset + (fItemWidth - rect.size.width)/2;
            [UIView animateWithDuration:0.3f animations:^{
                self->_indicatorView.frame = rect;
            }];
        }];
        
        if (style == SegmentStyleUnderLine) {
            _underLineView = [[UIImageView alloc] initWithFrame:CGRectMake(fOffset, frame.size.height - 1, frame.size.width - 1 * fOffset, 1)];
            [self addSubview:_underLineView];
            
            _indicatorView = [[UIImageView alloc] initWithFrame:CGRectMake(index * fItemWidth + fOffset, frame.size.height - 2, fItemWidth -2, 2)];
            [self addSubview:_indicatorView];
        }
        else
        {
        }
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles images:(NSArray *)arrImages showDevision:(BOOL)show {
    self = [super initWithFrame:frame];
    if (self) {
        _iSelectIndex = index;
        self.selectedIndex = index;
        _arrButtons = [NSMutableArray array];
        float fItemWidth = frame.size.width/arrTitles.count;
        
        float fOffset = 10.f;
        fItemWidth = (frame.size.width - fOffset * 2)/arrTitles.count;
        
        NSInteger iCount = arrTitles.count;
        NSMutableArray *arrSignals = [NSMutableArray array];
        for (int i = 0; i < iCount; ++i) {
            DDXSegmentButton *button = [[DDXSegmentButton alloc] initWithFrame:CGRectMake(i * fItemWidth + fOffset, 0, fItemWidth, frame.size.height) title:arrTitles[i] image:arrImages[i]];
            [button setTitleFont:[UIFont systemFontOfSize:frame.size.height * 1/2]];
            [self addSubview:button];
            button.tag = i;
            [arrSignals addObject:[button rac_signalForControlEvents:UIControlEventTouchUpInside]];
            [_arrButtons addObject:button];
            if (show && i != iCount - 1) {
                UIView *devisionView = [[UIView alloc] initWithFrame:CGRectMake((i + 1) * fItemWidth + fOffset - 0.5, frame.size.height/4, kDevisionLineWidth, frame.size.height/2)];
                devisionView.backgroundColor = TextLightGrayDEColor;
                [self addSubview:devisionView];
            }
        }
        
        _underLineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5)];
        _underLineView.backgroundColor = LightGrayBackGroundColor;
        [self addSubview:_underLineView];
        
        self.selectedSignal = [RACSignal merge:arrSignals];
        @weakify(self);
        [self.selectedSignal subscribeNext:^(UIButton* button) {
            @strongify(self);
            if (self.selectedIndex == button.tag) {
                return;
            }
            CGRect rect = self->_indicatorView.frame;
            rect.origin.x = button.tag * fItemWidth + fOffset;
            [UIView animateWithDuration:0.3f animations:^{
                self->_indicatorView.frame = rect;
            }];
        }];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles images:(NSArray *)arrImages
{
    return [self initWithFrame:frame selectIndex:index titles:arrTitles images:arrImages showDevision:NO];
}


-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorView.backgroundColor = indicatorColor;
}

-(void)setIndicatorImage:(UIImage *)image
{
    _indicatorView.image = image;
    CGRect frame = _indicatorView.frame;
    frame.size = image.size;
    frame.origin.y = frame.origin.y - image.size.height + 2;
    frame.origin.x = frame.origin.x + (_fItemWidth - frame.size.width)/2;
    _indicatorView.frame = frame;
}

-(void)setIndicatoPosition:(NSInteger)position
{
    DDXSegmentButton *button = _arrButtons[position];
    CGRect rect = self->_indicatorView.frame;
    rect.origin.x = position * CGRectGetWidth(button.frame) + 10 + (button.frame.size.width - rect.size.width)/2;
    [UIView animateWithDuration:0.3f animations:^{
        self->_indicatorView.frame = rect;
    }];
}

-(void)setIndicatorHeight:(CGFloat)height
{
    CGRect frame = _indicatorView.frame;
    frame.size.height = height;
    frame.origin.y = self.frame.size.height - height;
    _indicatorView.frame = frame;
    
    frame = _underLineView.frame;
    frame.origin.y = self.frame.size.height - height/2.f - 0.5;
    _underLineView.frame = frame;
}

-(void)setIndicatorWidth:(CGFloat)width
{
    CGRect frame = _indicatorView.frame;
    frame.size.width = width;
    frame.origin.x = frame.origin.x + (_fItemWidth - width)/2;
    _indicatorView.frame = frame;
}

-(void)setUnderlineColor:(UIColor *)underlineColor

{
    _underLineView.backgroundColor = underlineColor;
}

-(void)setUnderlinePadding:(float)padding
{
    CGRect frame = _underLineView.frame;
    frame.origin.x = padding;
    frame.size.width = self.frame.size.width - 2 * padding;
    _underLineView.frame = frame;
}

-(void)setTextAligment:(SegmentTitleAlignment)segmentAligment atIndex:(NSInteger)index
{
    if (index >= _arrButtons.count) {
        return;
    }
    DDXSegmentButton *button = _arrButtons[index];
    [button setTitleAligment:segmentAligment];
}

-(void)setTextPostion:(SLSegmentTitlePositon)titlePositon atIndex:(NSInteger)index{
    if (index >= _arrButtons.count) {
        return;
    }
    DDXSegmentButton *button = _arrButtons[index];
    [button setSegmentTitlePositon:titlePositon];
}


-(void)setTextColor:(UIColor *)color
{
    for (DDXSegmentButton* button in _arrButtons) {
        [button setTitleColor:color];
    }
}

-(void)setTextColor:(UIColor *)color atIndex:(NSInteger)index
{
    if (index >= _arrButtons.count) {
        return;
    }
    DDXSegmentButton *button = _arrButtons[index];
    [button setTitleColor:color];
}

-(void)setText:(NSString *)text atIndex:(NSInteger)index
{
    if (index >= _arrButtons.count) {
        return;
    }
    DDXSegmentButton *button = _arrButtons[index];
    [button setTitle:text];
}

-(NSString *)getTextAtIndex:(NSInteger)index
{
    if (index >= _arrButtons.count) {
        return @"";
    }
    DDXSegmentButton *button = _arrButtons[index];
    
    return [button getTitle];
}

-(void)setTextFont:(UIFont *)font atIndex:(NSInteger)index
{
    if (index >= _arrButtons.count) {
        return;
    }
    DDXSegmentButton *button = _arrButtons[index];
    [button setTitleFont:font];
}

-(void)setTextFont:(UIFont *)font
{
    for (DDXSegmentButton *button in _arrButtons) {
        [button setTitleFont:font];
    }
}

-(void)setImage:(UIImage *)image atIndex:(NSInteger)index
{
    if (index >= _arrButtons.count) {
        return;
    }
    DDXSegmentButton *button = _arrButtons[index];
    [button setImage:image];
}

-(void)setBackGroundColor:(UIColor *)color atIndex:(NSInteger)index
{
    if (index >= _arrButtons.count) {
        return;
    }
    DDXSegmentButton *button = _arrButtons[index];
    [button setBackgroundColor:color];
}

-(void)setunderlineLeftOffset:(float)offset
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
