//
//  SLTapRefreshView.h
//  SLSaid
//
//  Created by liuzurong on 2017/11/28.
//  Copyright © 2017年 liuzu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, TapRefreshViewState) {
    TapRefreshViewStateNoData = 0,
    TapRefreshViewStateLoading,
    TapRefreshViewStateSuccess,
    TapRefreshViewStateFailure,
} ;

@class SLTapRefreshView;

@protocol SLTapRefreshViewDelegate <NSObject>

- (void)tapRefreshViewToRequestData;

@optional

//初始化view 不要在此写布局 并没有用
- (void)tapRefreshViewPrepare:(SLTapRefreshView *)tapRefreshView;

//修改布局 有默认布局 用remake
- (void)tapRefreshViewLayoutSubviews:(SLTapRefreshView *)tapRefreshView;

//加载中
- (void)tapRefreshViewStateLoading:(SLTapRefreshView *)tapRefreshView;

//加载失败
- (void)tapRefreshViewStateError:(SLTapRefreshView *)tapRefreshView;

//加载成功
- (void)tapRefreshViewStateSuccess:(SLTapRefreshView *)tapRefreshView;

//无数据
- (void)tapRefreshViewStateNodata:(SLTapRefreshView *)tapRefreshView;

@end
@interface SLTapRefreshView : UIView

@property (weak, nonatomic) id<SLTapRefreshViewDelegate>delegate;

@property (nonatomic, assign) TapRefreshViewState state;

@property (nonatomic, strong, readonly) UILabel *retryLabel;

@property (nonatomic, strong, readonly) UILabel *tiplabel;

@property (nonatomic, strong, readonly) UIImageView *refreshStateView;

@property (nonatomic, assign) CGFloat imgScale;

//imageScale 图片缩放比 默认 img大小 loding中 90 * 135 其他113 *113;
- (instancetype)initWithFrame:(CGRect)frame andImgScale:(CGFloat)scale delegate:(id)delegate;
//title
- (void)setStatusTips:(NSString *)tips forState:(TapRefreshViewState)state;
//title
- (void)setSupplemet:(NSString *)tips forState:(TapRefreshViewState)state;

- (void)tapRefreshViewStateErrorTextColor;

@end
