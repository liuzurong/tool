//
//  UIView+Util.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)
//@property (nonatomic, assign) CGFloat width;
//@property (nonatomic, assign) CGFloat height;
//@property (nonatomic, assign) CGFloat originX;
//@property (nonatomic, assign) CGFloat originX;
+(CGFloat)getViewHeight;

-(CGFloat)width;
-(CGFloat)height;
-(CGFloat)originX;
-(CGFloat)originY;
-(CGFloat)maxX;
-(CGFloat)maxY;
-(CGFloat)minX;
-(CGFloat)minY;
-(CGFloat)midX;
-(CGFloat)midY;

-(void)createSubviews;
-(void)initData;
-(void)initView;

-(UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;
-(UIButton *)buttonWithFont:(UIFont *)font textColor:(UIColor *)color title:(NSString *)title;

-(UIButton *)createButton:(UIImage *)image imageH:(UIImage *)imageH id:(id)id sel:(SEL) sel;

-(void)roundedRectWithRadius:(CGFloat)radius borderColor:(UIColor *)borderColor;

+ (CGSize)getLabelSize:(NSString *)title LabelFamily:(NSString *)labelFamily FontSize:(CGFloat)fontSize LabelWidth:(CGFloat)labelWidth;

- (UITextField *)createTextField:(UIFont *)font textColor:(UIColor *)color placeholderColor:(UIColor *)placeholderColor;

-(UIImageView *)createImageView:(UIImage*)image;
@end
