//
//  SLCloseLineMainView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLCloseLineMainView.h"
#import "SLLineSegmentView.h"
#import "SLCloseLineView.h"
#import "SLCloseLineVM.h"

@interface SLCloseLineMainView ()
@property (nonatomic, strong) SLCloseLineVM *viewModel;
@property (nonatomic, strong) SLCloseLineView *lineView;
@property (nonatomic, strong) SLLineSegmentView *segmentView;
@property (nonatomic, assign) NSInteger dateType;
@property (nonatomic, copy) NSString *code;
@end
@implementation SLCloseLineMainView
+(CGFloat)getViewHeight
{
    return [SLLineSegmentView getViewHeight] + [SLCloseLineView getViewHeight] + AdaptHeightByIp6(50.f);
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self bindSubscriber];
        _viewModel = [SLCloseLineVM new];
        self.backgroundColor = WhiteBackGroundColor;
    }
    return self;
}

-(void)createSubviews
{
    self.dateType = 3;
    _lineView = [[SLCloseLineView alloc] initWithFrame:CGRectMake(0, 0, self.width, [SLCloseLineView getViewHeight])];
    [self addSubview:_lineView];
    
    _segmentView = [[SLLineSegmentView alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_lineView.frame) + AdaptHeightByIp6(20), kScreenWidth - 80, [SLLineSegmentView getViewHeight]) titles:@[@"月", @"季", @"半年", @"一年"]];
    [self addSubview:_segmentView];
    
    @weakify(self);
    [RACObserve(_lineView, showCursor) subscribeNext:^(id x) {
        @strongify(self);
        self.showCursor = [x boolValue];
    }];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _lineView.frame = CGRectMake(0, 0, self.width, [SLCloseLineView getViewHeight]);
    _segmentView.frame = CGRectMake(40, CGRectGetMaxY(_lineView.frame) + AdaptHeightByIp6(20), kScreenWidth - 80, [SLLineSegmentView getViewHeight]);
}

-(void)bindSubscriber
{
    @weakify(self);
    [_segmentView.selectedSignal subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.dateType = x.integerValue;
        [self getKlineData];
    }];
}

-(NSInteger)getkLineCount
{
    switch (self.dateType) {
        case 0:
            return 30;
            break;
        case 1:
            return 60;
        case 2:
            return 180;
        case 3:
            return 360;
        default:
            break;
    }
    
    return 30;
}

-(void)refreshkLineViewWithCode:(NSString *)code
{
    self.code = code;
    [self getKlineData];
}

-(void)getKlineData
{
    @weakify(self);
    [[self.viewModel getKlineByIndexCode:self.code count:[self getkLineCount]] subscribeNext:^(id x) {
        @strongify(self);
        [self.lineView refreshKlineWithDatas:x];
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
