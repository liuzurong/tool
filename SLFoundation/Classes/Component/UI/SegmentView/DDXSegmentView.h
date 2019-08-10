//
//  DDXSegmentView.h
//  DDXStockGuard
//
//  Created by DDX-A2 on 16/1/9.
//  Copyright © 2016年 tongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "DDXSegmentButton.h"

typedef enum{
    SegmentStyleBorder,
    SegmentStyleUnderLine
}SegmentStyle;

@interface DDXSegmentView : UIView

@property (nonatomic, strong) RACSignal *selectedSignal;
@property (nonatomic, assign) NSInteger selectedIndex;

-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles;
-(instancetype)initUnderLineWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles;
//-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles segmentStyle:(SegmentStyle)style;
-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles images:(NSArray *)arrImages;
-(instancetype)initWithFrame:(CGRect)frame selectIndex:(NSInteger)index titles:(NSArray *)arrTitles images:(NSArray *)arrImages showDevision:(BOOL)show;

-(void)setIndicatorColor:(UIColor *)indicatorColor;
-(void)setIndicatorImage:(UIImage *)image;
-(void)setIndicatoPosition:(NSInteger)position;
-(void)setIndicatorHeight:(CGFloat)height;
-(void)setIndicatorWidth:(CGFloat)width;
-(void)setUnderlineColor:(UIColor *)underlineColor;
-(void)setUnderlinePadding:(float)padding;

-(void)setTextAligment:(SegmentTitleAlignment)segmentAligment atIndex:(NSInteger)index;

-(void)setTextPostion:(SLSegmentTitlePositon)titlePositon atIndex:(NSInteger)index;;

-(void)setTextColor:(UIColor *)color;
-(void)setImage:(UIImage *)image atIndex:(NSInteger)index;
-(void)setTextFont:(UIFont *)font atIndex:(NSInteger)index;
-(void)setTextFont:(UIFont *)font;
-(void)setTextColor:(UIColor *)color atIndex:(NSInteger)index;
-(void)setText:(NSString *)text atIndex:(NSInteger)index;
-(void)setBackGroundColor:(UIColor *)color atIndex:(NSInteger)index;
-(NSString *)getTextAtIndex:(NSInteger)index;

@end
