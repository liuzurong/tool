//
//  SLCloseLineView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLCloseLineView.h"
#import "NSArray+NumberGetter.h"
#import "NSDate+Formatter.h"
#import "SLCloseLineCurrentPriceView.h"

#define kTopPadding AdaptHeightByIp6(10)
#define kRightPadding 10.f
#define kLeftLabelWidth 45.f
#define kBottomLabelHeight AdaptHeightByIp6(20)

@interface SLCloseLineView ()

@property (nonatomic, copy) NSArray *leftLabels;
@property (nonatomic, copy) NSArray *bottomLabels;
@property (nonatomic, copy) NSArray *kLineDatas;
@property (nonatomic, strong) SLCloseLineCurrentPriceView *priceView;
@property (nonatomic, strong) UIView *cursorVerLine;
@end
@implementation SLCloseLineView

+(CGFloat)getViewHeight
{
    return AdaptHeightByIp6(180.f);
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        mClientRect = CGRectMake(kLeftLabelWidth, kTopPadding, frame.size.width - kLeftLabelWidth - kRightPadding, frame.size.height - kTopPadding - kBottomLabelHeight);
        [self initView];
        
        _cursorVerLine = [[UIView alloc] initWithFrame:CGRectMake(mClientRect.origin.x + 10, mClientRect.origin.y, 1, mClientRect.size.height)];
        _cursorVerLine.backgroundColor = GrayBackGroundColor;
        _cursorVerLine.hidden = YES;
        [self addSubview:_cursorVerLine];
        
        _priceView = [[SLCloseLineCurrentPriceView alloc] initWithFrame:CGRectMake(mClientRect.origin.x + 10, mClientRect.origin.y + 10, 100, 20)];
        _priceView.hidden = YES;
        [self addSubview:_priceView];
    }
    return self;
}

-(void)initView
{
    [self addLeftLabels];
    [self addBottomLabels];
}

-(void)addLeftLabels
{
    float fStep = mClientRect.size.height/4.;
    float fLabelHeight = AdaptHeightByIp6(20);
    float fOriginY = mClientRect.origin.y - fLabelHeight/2.f;
    NSMutableArray *leftLabels = [NSMutableArray new];
    
    for (int i = 0; i < 5; ++i) {
        UILabel *label = [self createLabelWithFont:FontWithSize(9.f) textColor:TextLightGrayColor textAlignment:NSTextAlignmentCenter];
        label.frame = CGRectMake(0, fOriginY + i * fStep, kLeftLabelWidth, fLabelHeight);
        [leftLabels addObject:label];
    }
    
    self.leftLabels = leftLabels;
}

-(void)addBottomLabels
{
    float fWidth = mClientRect.size.width/5;
    float fOriginX = mClientRect.origin.x;
    float fOriginY = CGRectGetMaxY(mClientRect);
    NSMutableArray *bottomLabels = [NSMutableArray new];
    
    for (int i = 0; i < 5; ++i) {
        UILabel *label = [self createLabelWithFont:FontWithSize(9.f) textColor:TextLightGrayColor textAlignment:NSTextAlignmentCenter];
        label.frame = CGRectMake(fOriginX + i * fWidth, fOriginY, fWidth, kBottomLabelHeight);
        [bottomLabels addObject:label];
    }
    
    self.bottomLabels = bottomLabels;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    mClientRect = CGRectMake(kLeftLabelWidth, kTopPadding, self.frame.size.width - kLeftLabelWidth - kRightPadding, self.frame.size.height - kTopPadding - kBottomLabelHeight);
    _cursorVerLine.frame = CGRectMake(mClientRect.origin.x + 10, mClientRect.origin.y, 1, mClientRect.size.height);
    _priceView.frame = CGRectMake(mClientRect.origin.x + 10, mClientRect.origin.y + 10, 100, 20);
    
    float fWidth = mClientRect.size.width/5;
    float fOriginX = mClientRect.origin.x;
    float fOriginY = CGRectGetMaxY(mClientRect);
    
    for (int i = 0; i < 5 && i < self.bottomLabels.count; ++i) {
        UILabel *label = self.bottomLabels[i];
        label.frame = CGRectMake(fOriginX + i * fWidth, fOriginY, fWidth, kBottomLabelHeight);
    }
    
    float fStep = mClientRect.size.height/4.;
    float fLabelHeight = AdaptHeightByIp6(20);
    fOriginY = mClientRect.origin.y - fLabelHeight/2.f;
    for (int i = 0; i < 5; ++i) {
        UILabel *label = self.leftLabels[i];
        label.frame = CGRectMake(0, fOriginY + i * fStep, kLeftLabelWidth, fLabelHeight);
    }
}

#pragma mark - Refresh View
-(void)refreshKlineWithDatas:(NSArray *)datas
{
    self.kLineDatas = datas;
    [self setNeedsDisplay];
}

-(void)refreshLeftLabels
{
    double fValuesSpace = (mMaxValue - mMinValue) / 4;
    for (int i = 0; i < 5; ++i) {
        UILabel *label = self.leftLabels[i];
        label.text = [NSString stringWithFormat:@"%0.2f", mMaxValue - fValuesSpace * i];
    }
}

-(void)refreshBottomLabels
{
    double fStep = self.kLineDatas.count/5.f;
    for (NSInteger i = 0; i < 5; ++i) {
        NSInteger index = (NSInteger)(i * fStep);
        NSArray *datas = self.kLineDatas[index];
        UILabel *label = self.bottomLabels[i];
        label.text = [NSDate formatStringWithtimeInterVal:[datas[0] longLongValue] toFromat:@"MM-dd"];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, WhiteBackGroundColor.CGColor);
    CGContextFillRect(context, rect);
    
    [self drawBorder:mClientRect color:GrayBackGroundColor];
    [self drawHDash:mClientRect color:LightGrayBackGroundColor count:3];
    [self drawVDash:mClientRect color:LightGrayBackGroundColor count:4];
    
    if (self.kLineDatas.count <= 0) {
        return;
    }
    [self getKlineMaxValue:&mMaxValue minValue:&mMinValue];
    if (self.kLineDatas.count == 1) {
        mPerWidth = mClientRect.size.width;
        mPerHeight = 1/mMaxValue;
    } else {
        mPerHeight = mClientRect.size.height/(mMaxValue - mMinValue);
        mPerWidth = mClientRect.size.width/(self.kLineDatas.count - 1);
    }
    
    [self refreshLeftLabels];
    [self refreshBottomLabels];
    [self drawKline:mClientRect];
}

-(void)drawKline:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.f);
    CGContextSetStrokeColorWithColor(context, BlueBackGroundColor.CGColor);
    CGContextSaveGState(context);
    
    NSArray *datas = nil;
    NSInteger drawCount = self.kLineDatas.count == 1? 2 : self.kLineDatas.count;
    CGPoint points[drawCount];
    CGPoint pt;
    
    float fOriginX = rect.origin.x, fOriginY = CGRectGetMaxY(rect);
    NSInteger iStart = 0;//self.kLineDatas.count - self.chartLineDatas.count;
    CGContextMoveToPoint(context, rect.origin.x, CGRectGetMaxY(rect));
    
    if (self.kLineDatas.count == 1) {
        pt.x = fOriginX;
        pt.y = CGRectGetMidY(rect);
        points[0] = pt;
        pt.x = CGRectGetMaxX(rect);
        points[1] = pt;
    } else {
        for (NSInteger i = iStart; i < drawCount; ++i) {
            datas = self.kLineDatas[i];
            float fClosePrice = [datas getDoubleAtIndex:4];
            pt.x = fOriginX + (i - iStart) * mPerWidth;
            pt.y = fOriginY - (fClosePrice - mMinValue) * mPerHeight;
            points[i - iStart] = pt;
        }
    }
    
    CGContextAddLines(context, points, drawCount);
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextAddLineToPoint(context, rect.origin.x, CGRectGetMaxY(rect));
    CGContextClip(context);
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        0,(8 * 16 + 15)/255.f ,1.f, 1.00,
        1,1,1, 0
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    
    CGContextDrawLinearGradient(context, gradient,rect.origin ,CGPointMake(rect.origin.x,CGRectGetMaxY(rect)),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);//
    
    CGContextAddLines(context, points, drawCount);
    CGContextStrokePath(context);
}


-(void)getKlineMaxValue:(double *)maxValue minValue:(double *)minValue
{
    double fValue = 0, fMaxValue = 0, fMinValue = 100000;
    NSArray *datas = nil;
    NSInteger iStart = 0;//self.kLineDatas.count - self.chartLineDatas.count;
    for (NSInteger i = iStart; i < self.kLineDatas.count; ++i) {
        datas = self.kLineDatas[i];
        fValue = [datas getDoubleAtIndex:4];
        if (fValue > fMaxValue) {
            fMaxValue = fValue;
        }
        
        if (fValue < fMinValue) {
            fMinValue = fValue;
        }
    }
    
    //    fMaxValue = 1.2 * fMaxValue;
    //    fMinValue = 0.8 * fMinValue;
    
    *maxValue = fMaxValue;
    *minValue = fMinValue;
}

-(void)showCursor:(BOOL)bShow
{
    _cursorVerLine.hidden = !bShow;
    _priceView.hidden = !bShow;
}

-(void)setCursorPosition:(CGPoint)point
{
    if (self.kLineDatas.count == 0) {
        return;
    }
    CGRect vRect = _cursorVerLine.frame;
    CGRect pRect = _priceView.frame;
    
    //    CGPoint movePoint = point;
    float xsetp = mPerWidth;//((float)(mClientRect.size.width) / self.chartLineDatas.count);
    int index = (point.x - mClientRect.origin.x)/xsetp;
    if (point.x > index * mPerWidth + mClientRect.origin.x + mPerWidth/2.) {
        index = index + 1;
    }
    NSArray *datas = nil;
    if (self.kLineDatas.count > index) {
        datas = self.kLineDatas[index];
    }
    else
    {
        index = (int)self.kLineDatas.count - 1;
        datas = [self.kLineDatas lastObject];
    }
    
    vRect.origin.x = index * xsetp + mClientRect.origin.x;
    
    _cursorVerLine.frame = vRect;
    
    if (CGRectGetMaxX(mClientRect) - CGRectGetMaxX(vRect) <= 120.f) {
        _priceView.alignment = 1;
        pRect.origin.x = CGRectGetMaxX(vRect) - pRect.size.width;
    }
    else
    {
        _priceView.alignment = 0;
        pRect.origin.x = CGRectGetMaxX(vRect);
    }
    
    _priceView.frame = pRect;
    
    [_priceView setDateString:[NSDate formatStringWithtimeInterVal:[datas[0] longLongValue] toFromat:@"MM-dd"]];
    [_priceView setPriceText:[NSString stringWithFormat:@"收盘价%0.2f",[datas getDoubleAtIndex:4]]];
}

#pragma mark - TouchEvent

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(mClientRect, currentTouchPoint)) {
        self.showCursor = YES;
        [self showCursor:YES];
        [self setCursorPosition:currentTouchPoint];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPoint = [touch locationInView:self];
    if (self.showCursor) {
        if (CGRectContainsPoint(mClientRect, currentTouchPoint)) {
            //            [self showCursor:YES];
            [self setCursorPosition:currentTouchPoint];
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.showCursor = NO;
    [self showCursor:NO];
    //    UITouch *touch = [touches anyObject];
    //    CGPoint currentTouchPoint = [touch locationInView:self];
    if (self.kLineDatas.count) {
        //        NSArray *arrData = [self.dataSource lastObject];
        //        _turnoverLabel.text = [NSString stringWithFormat:@"成交量%@手",[CustomUserDefault getFormateStringByValue:[arrData getLongLongAtIndex:2]/100]];
    }
    
    //    if (CGRectContainsPoint(_VolRect, currentTouchPoint)) {
    //        [self changeTechIndicator];
    //    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.showCursor = NO;
    [self showCursor:NO];
    if (self.kLineDatas.count) {
        //        NSArray *arrData = [self.dataSource lastObject];
        //        _turnoverLabel.text = [NSString stringWithFormat:@"成交量%@手",[CustomUserDefault getFormateStringByValue:[arrData getLongLongAtIndex:2]/100]];
    }
}
@end
