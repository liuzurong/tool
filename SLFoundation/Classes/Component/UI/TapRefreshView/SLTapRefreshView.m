//
//  SLTapRefreshView.m
//  SLSaid
//
//  Created by liuzurong on 2017/11/28.
//  Copyright © 2017年 liuzu. All rights reserved.
//

#import "SLTapRefreshView.h"

@interface SLTapRefreshView ()
{
    UIImageView *_refreshStateView;
    UILabel *_tipLabel;
    UILabel *_retryLabel;
}

@property (nonatomic, weak) UIButton *backBtn;

@property (nonatomic, strong) NSMutableDictionary *statusTips;

@property (nonatomic, strong) NSMutableDictionary *supplement;

@property (nonatomic, strong) NSMutableDictionary *test;

@end

@implementation SLTapRefreshView
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _imgScale = 1;
        [self prepare];
        [self layout];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imgScale = 1;
        [self prepare];
        [self layout];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame andImgScale:(CGFloat)scale delegate:(id)delegate{
    self = [super initWithFrame:frame];
    if (self) {
        NSAssert(scale > 0, @"error scale");
        _delegate = delegate;
        _imgScale = scale;
        [self prepare];
        [self layout];
    }
    return self;
}

-(void)prepare{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapTheView)];
    [self addGestureRecognizer:tap];
    self.backgroundColor = [UIColor clearColor];
    
    [self refreshStateView];
    [self tiplabel];
    [self retryLabel];
    [self statusTips];
    [self supplement];
    
    if ([_delegate respondsToSelector:@selector(tapRefreshViewPrepare:)]) {
        [_delegate tapRefreshViewPrepare:self];
    }
    
    NSAssert(_refreshStateView.constraints.count == 0, @"make refreshStateView's constraints in method \"tapRefreshViewLayoutSubviews:\"");
    NSAssert(_tipLabel.constraints.count == 0, @"make tipLabel's constraints in method \"tapRefreshViewLayoutSubviews:\"");
    NSAssert(_retryLabel.constraints.count == 0,@"make retryLabel's constraints in method \"tapRefreshViewLayoutSubviews:\"");
}

-(void)layout{
    
    [_refreshStateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-50);
        make.width.mas_equalTo(90 * _imgScale);
        make.height.mas_equalTo(135 * _imgScale);
    }];
    
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_refreshStateView.mas_bottom).offset(15);
    }];
    
    [_retryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_tipLabel.mas_bottom).offset(10);
    }];
    
    if ([_delegate respondsToSelector:@selector(tapRefreshViewLayoutSubviews:)]) {
        [_delegate tapRefreshViewLayoutSubviews:self];
    }
}

- (void)setStatusTips:(NSString *)tips forState:(TapRefreshViewState)state{
    _statusTips[@(state)] = tips ? tips : @"";
}

- (void)setSupplemet:(NSString *)tips forState:(TapRefreshViewState)state{
    _supplement[@(state)] = tips ? tips : @"";
}

- (void)tapTheView
{
    if (_state == TapRefreshViewStateFailure || _state == TapRefreshViewStateNoData) {
        self.state = TapRefreshViewStateLoading;
        if ([_delegate respondsToSelector:@selector(tapRefreshViewToRequestData)]) {
            [_delegate tapRefreshViewToRequestData];
        }
    }
}

-(void)tapRefreshViewStateLoading
{
    
    _tipLabel.textColor = RGB_HEX(0x999999);//[UIColor colorHex:@"#999999"];
    [_refreshStateView startAnimating];
    [_refreshStateView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(90 * _imgScale);
        make.height.mas_equalTo(135 * _imgScale);
    }];
    
    if ([_delegate respondsToSelector:@selector(tapRefreshViewStateLoading:)]) {
        [_delegate tapRefreshViewStateLoading:self];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)tapRefreshViewStateError
{
    _tipLabel.textColor = RGB_HEX(0x666666);//[UIColor colorHex:@"#666666"];
    if (_refreshStateView.isAnimating) {
        [_refreshStateView stopAnimating];
    }
    _refreshStateView.image = [UIImage bundleImageWithName:@"network_busy"];
    [_refreshStateView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(113 * _imgScale);
        make.height.mas_equalTo(113 * _imgScale);
    }];
    if ([_delegate respondsToSelector:@selector(tapRefreshViewStateError:)]) {
        [_delegate tapRefreshViewStateError:self];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)tapRefreshViewStateSuccess
{
    [self removeFromSuperview];
    if ([_delegate respondsToSelector:@selector(tapRefreshViewStateSuccess:)]) {
        [_delegate tapRefreshViewStateSuccess:self];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)tapRefreshViewStateNodata
{
    _tipLabel.textColor = RGB_HEX(0x999999);//[UIColor colorHex:@"#999999"];
    _refreshStateView.image = [UIImage bundleImageWithName:@"no_content"];
    [_refreshStateView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(113 * _imgScale);
        make.height.mas_equalTo(113 * _imgScale);
    }];
    if (_refreshStateView.isAnimating) {
        [_refreshStateView stopAnimating];
    }
    
    if ([_delegate respondsToSelector:@selector(tapRefreshViewStateNodata:)]) {
        [_delegate tapRefreshViewStateNodata:self];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)tapRefreshViewStateErrorTextColor
{
    _tipLabel.textColor = RGB_HEX(0x2896f0);//[UIColor colorHex:@"#2896f0" alpha:0.8];
    _retryLabel.textColor = RGB_HEX(0x666666);//[UIColor colorHex:@"#666666" alpha:0.8];
}

-(void)setState:(TapRefreshViewState)state{
    _state = state;
    _tipLabel.text = _statusTips[@(state)];
    [_tipLabel sizeToFit];
    
    _retryLabel.text = _supplement[@(state)];
    [_retryLabel sizeToFit];
    
    switch (state) {
        case TapRefreshViewStateLoading:
            [self tapRefreshViewStateLoading];
            break;
            
        case TapRefreshViewStateSuccess:
            [self tapRefreshViewStateSuccess];
            break;
            
        case TapRefreshViewStateFailure:
            [self tapRefreshViewStateError];
            break;
            
        case TapRefreshViewStateNoData:
            [self tapRefreshViewStateNodata];
        default:
            break;
    }
}

-(NSMutableDictionary *)statusTips{
    if (!_statusTips) {
        _statusTips = [NSMutableDictionary dictionaryWithCapacity:3];
        _statusTips[@(TapRefreshViewStateNoData)] = @"暂无数据";
        _statusTips[@(TapRefreshViewStateLoading)] = @"努力加载中...";
        _statusTips[@(TapRefreshViewStateFailure)] = @"糟糕，加载失败...";
        _statusTips[@(TapRefreshViewStateSuccess)] = @"加载成功";
    }
    return _statusTips;
}

- (NSMutableDictionary *)supplement{
    if (!_supplement) {
        _supplement = [NSMutableDictionary dictionaryWithCapacity:3];
        _supplement[@(TapRefreshViewStateLoading)] = @"";
        _supplement[@(TapRefreshViewStateLoading)] = @"";
        _supplement[@(TapRefreshViewStateFailure)] = @"请点击屏幕，重新加载";
        _supplement[@(TapRefreshViewStateSuccess)] = @"";
    }
    return _supplement;
}

- (UIImageView *)refreshStateView{
    if (!_refreshStateView) {
        _refreshStateView = [[UIImageView alloc] initWithImage:[UIImage bundleImageWithName:@"network_busy"]];
        NSMutableArray * array = [[NSMutableArray alloc]init];
        for (NSInteger index = 0; index<25; index++) {
            NSString *str = [NSString stringWithFormat:@"loading_%zd",index];
            UIImage *image = [UIImage bundleImageWithName:str];
            if (image) {
              [array addObject: image];
            }
        }
      
        _refreshStateView.animationImages = array;
        _refreshStateView.animationDuration = _refreshStateView.animationImages.count * 0.04;
        _refreshStateView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview: _refreshStateView];
    }  //refresh_failed
    return _refreshStateView;
}

- (UILabel *)tiplabel{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.font = [UIFont systemFontOfSize:14.0f];
        _tipLabel.textColor = RGB_HEX(0x666666);//[UIColor colorHex:@"#666666"];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLabel];
    }
    return _tipLabel;
}

- (UILabel *)retryLabel{
    if (!_retryLabel) {
        _retryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _retryLabel.font = [UIFont systemFontOfSize:14.0f];
        _retryLabel.textAlignment = NSTextAlignmentCenter;
        _retryLabel.textColor = RGB_HEX(0x999999);//[UIColor colorHex:@"#999999"];
        [self addSubview:_retryLabel];
    }
    return _retryLabel;
}

@end
