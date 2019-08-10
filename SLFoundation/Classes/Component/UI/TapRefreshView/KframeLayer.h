//
//  KframeLayer.h
//  TGA
//
//  Created by mafengxin on 16/6/2.
//  Copyright © 2016年 developer. All rights reserved.
//

//给layer 设置若干状态及这些状态下的image,alpha,frame,是否显示

#import <QuartzCore/QuartzCore.h>

@interface KframeLayer : CALayer

@property (nonatomic, assign) CGFloat percentage;

@property (nonatomic, copy) NSArray<NSString *> *imgNames;

@property (nonatomic, copy) NSArray<NSValue *> *moveValues;

@property (nonatomic, copy) NSArray *alphaValus;

@property (nonatomic, copy) NSArray<NSNumber *> *apartments;

@property (nonatomic, copy) NSArray<NSNumber *> *hiddenValues;

@property (nonatomic, copy) NSArray<NSNumber *> *transformYValues;

@property (nonatomic, copy) NSArray<NSNumber *> *transformRotateValues;

@end
