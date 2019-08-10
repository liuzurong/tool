//
//  CustomFresh.m
//  TGA
//
//  Created by mafengxin on 16/6/1.
//  Copyright © 2016年 developer. All rights reserved.
//

#import "CustomFresh.h"

//动画高度
#define ImgHeight 45
//动画到刷新文字距离
#define ImgToLabelMargin 15
//刷新状态和刷新时间文字距离
#define LabelToLabelMargin 7

@implementation CustomFresh
- (void)prepare
{
    [super prepare];

    NSMutableArray * refreshingImages = [[NSMutableArray alloc]init];
    for (NSInteger index = 0; index<25; index++) {
        NSString *str = [NSString stringWithFormat:@"loading_%zd",index];
        UIImage *image = [UIImage bundleImageWithName:str];
        if (image) {
            [refreshingImages addObject: image];
        }
    }
    
    [self setImages:refreshingImages forState:MJRefreshStateIdle];
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    self.mj_h = ImgHeight + 5;
    self.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:10];
    self.stateLabel.font = [UIFont systemFontOfSize:12];
    self.lastUpdatedTimeLabel.textColor = TextLowGrayDJColor;
    self.stateLabel.textColor = TextLowGrayDKColor;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];

    self.gifView.contentMode = UIViewContentModeScaleAspectFit;
    self.lastUpdatedTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.stateLabel.textAlignment = NSTextAlignmentLeft;

    NSString *str = [NSString stringWithFormat:@"loading_0"];
    UIImage *img = [UIImage bundleImageWithName:str];
    CGFloat imgWidth = img.size.width / img.size.height * ImgHeight;

    [self.lastUpdatedTimeLabel sizeToFit];
    CGFloat width = imgWidth + ImgToLabelMargin + self.lastUpdatedTimeLabel.width;
    CGFloat lablWidth = (self.mj_w + width) / 2 - imgWidth - ImgToLabelMargin;

    self.gifView.frame = CGRectMake((self.mj_w - width) / 2, 5, imgWidth, ImgHeight);
    self.stateLabel.frame = CGRectMake((self.mj_w - width) / 2 + imgWidth + ImgToLabelMargin, (self.mj_h - LabelToLabelMargin) / 2 - self.lastUpdatedTimeLabel.mj_h, lablWidth, self.lastUpdatedTimeLabel.mj_h);
    self.lastUpdatedTimeLabel.frame = CGRectMake((self.mj_w - width) / 2 + imgWidth + ImgToLabelMargin, (self.mj_h + LabelToLabelMargin) / 2, lablWidth, self.lastUpdatedTimeLabel.mj_h);
}

@end
