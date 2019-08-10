//
//  DDXSegmentButton.h
//  DDXStockGuard
//
//  Created by tongt-PC on 16/2/22.
//  Copyright © 2016年 tongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    SegmentTitleAlignmentLeft,
    SegmentTitleAlignmentCenter,
    SegmentTitleAlignmentRight
}SegmentTitleAlignment;

typedef enum
{
    SegmentTitlePositonLeft,
    SegmentTitlePositonRight
}SLSegmentTitlePositon;


@interface DDXSegmentButton : UIControl
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) SegmentTitleAlignment segmentAlignment;

@property (nonatomic, assign) SLSegmentTitlePositon SegmentTitlePositon;

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(NSString *)imageName;

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title imageInstance:(UIImage *)imageInstance;

-(NSString *)getTitle;
-(void)setTitle:(NSString *)title;
-(void)setImage:(UIImage *)image;
-(void)setTitleColor:(UIColor *)titleColor;
-(void)setTitleFont:(UIFont *)font;
-(void)setTitleAligment:(SegmentTitleAlignment)segmentAlignment;

@end
