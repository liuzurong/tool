//
//  UIView+Util.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "UIView+Util.h"
#import <objc/runtime.h>

@implementation UIView (Util)

+(CGFloat)getViewHeight
{
    return 44.f;
}

-(void)initData {
    
}

-(void)createSubviews
{
    
}

-(void)initView
{
    
}

#pragma mark - 获取Label的frame
+ (CGSize)getLabelSize:(NSString *)title LabelFamily:(NSString *)labelFamily FontSize:(CGFloat)fontSize LabelWidth:(CGFloat)labelWidth
{
    UIFont *familyFont;
    if ([labelFamily isEqualToString:@""]||labelFamily == nil) {
        familyFont = [UIFont systemFontOfSize:fontSize];
    }else {
        familyFont = [UIFont fontWithName:labelFamily size:fontSize];
    }
    CGSize leftLabelSize = CGSizeMake(labelWidth, 20000.0f);
    NSDictionary * leftTdic = [NSDictionary dictionaryWithObjectsAndKeys:familyFont, NSFontAttributeName,nil];
    CGSize labelSize =[title boundingRectWithSize:leftLabelSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:leftTdic context:nil].size;
    return labelSize;
}

-(UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.clipsToBounds = YES;//ios 8以后会出现中文像素混合问题
    label.text = @"--";
    [self addSubview:label];
    return label;
}

-(UIImageView *)createImageView:(UIImage*)image
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    [self addSubview:imageView];
    return imageView;
}

-(UIButton *)buttonWithFont:(UIFont *)font textColor:(UIColor *)color title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.titleLabel setFont:font];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [self addSubview:button];
    return button;
}

/**
 *    @brief    返回Button
 *
 *    @param     rect     坐标
 *    @param     image     图片
 *    @param     imageH     高亮图片
 *    @param     id      Target
 *    @param     sel     所指向的事件
 *
 *    @return    返回Button
 */
-(UIButton *)createButton:(UIImage *)image imageH:(UIImage *)imageH id:(id)id sel:(SEL) sel
{
    UIButton *btn = [[UIButton alloc]init];
    if(![NSString isBlank:image])[btn setImage:image  forState:UIControlStateNormal];
    if(![NSString isBlank:imageH]) [btn setImage:imageH  forState:UIControlStateHighlighted];
    if((![NSString isBlank:id])&&sel!=nil)[btn addTarget:id action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    return btn;
}

- (UITextField *)createTextField:(UIFont *)font textColor:(UIColor *)color placeholderColor:(UIColor *)placeholderColor {
    UITextField*  _rightTextField = [[UITextField alloc]init];
    _rightTextField.font = font;
    _rightTextField.textColor = color;
    [_rightTextField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self addSubview:_rightTextField];
    return _rightTextField;
}


-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(CGFloat)originX
{
    return self.frame.origin.x;
}

-(CGFloat)originY
{
    return self.frame.origin.y;
}

-(CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

-(CGFloat)minX
{
    return CGRectGetMinX(self.frame);
}

-(CGFloat)minY
{
    return CGRectGetMinY(self.frame);
}

-(CGFloat)midX
{
    return CGRectGetMidX(self.frame);
}

-(CGFloat)midY
{
    return CGRectGetMidY(self.frame);
}

//-(void)roundedRectWithRadius:(CGFloat)radius borderColor:(UIColor *)borderColor {
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = CGRectMake(0, 0, self.width, self.height);
//
//    CAShapeLayer *borderLayer = [CAShapeLayer layer];
//    borderLayer.frame = CGRectMake(0, 0, self.width, self.height);
//    borderLayer.lineWidth = 1.f;
//    borderLayer.strokeColor = borderColor.CGColor;
//    borderLayer.fillColor = [UIColor clearColor].CGColor;
//
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.width, self.height) cornerRadius:radius];
//    maskLayer.path = bezierPath.CGPath;
//    borderLayer.path = bezierPath.CGPath;
//
//    @weakify(self);
//    [RACObserve(self, bounds) subscribeNext:^(NSValue*  _Nullable x) {
//        @strongify(self);
//        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.width, self.height) cornerRadius:radius];
//        maskLayer.frame = CGRectMake(0, 0, self.width, self.height);
//        borderLayer.frame = CGRectMake(0, 0, self.width, self.height);
//        maskLayer.path = bezierPath.CGPath;
//        borderLayer.path = bezierPath.CGPath;
//        NSLog(@"%@", x);
//    }];
//
//    [self.layer insertSublayer:borderLayer atIndex:0];
//    [self.layer setMask:maskLayer];
//}

-(void)roundedRectWithRadius:(CGFloat)radius borderColor:(UIColor *)borderColor {
    const static NSString *borderTag;
    const static NSString *maskTag;
    CAShapeLayer *borderLayer = objc_getAssociatedObject(self, &borderTag);
    CAShapeLayer *maskLayer = objc_getAssociatedObject(self, &maskTag);
    if (borderLayer == nil) {
        borderLayer = [CAShapeLayer layer];
        objc_setAssociatedObject(self, &borderTag, borderLayer, OBJC_ASSOCIATION_ASSIGN);
        maskLayer = [CAShapeLayer layer];
        objc_setAssociatedObject(self, &maskTag, maskLayer, OBJC_ASSOCIATION_ASSIGN);
    } else {
        borderLayer.strokeColor = borderColor.CGColor;
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.width, self.height) cornerRadius:radius];
        maskLayer.path = bezierPath.CGPath;
        borderLayer.path = bezierPath.CGPath;
        return;
    }
    
    borderLayer.frame = CGRectMake(0, 0, self.width, self.height);
    borderLayer.lineWidth = 1.f;
    borderLayer.strokeColor = borderColor.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    
    maskLayer.frame = CGRectMake(0, 0, self.width, self.height);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.width, self.height) cornerRadius:radius];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    
    @weakify(self);
    [RACObserve(self, bounds) subscribeNext:^(NSValue*  _Nullable x) {
        @strongify(self);
        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.width, self.height) cornerRadius:radius];
        maskLayer.frame = CGRectMake(0, 0, self.width, self.height);
        borderLayer.frame = CGRectMake(0, 0, self.width, self.height);
        maskLayer.path = bezierPath.CGPath;
        borderLayer.path = bezierPath.CGPath;
        NSLog(@"%@", x);
    }];
    
    [self.layer insertSublayer:borderLayer atIndex:0];
    [self.layer setMask:maskLayer];
}
@end
