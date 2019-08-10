//
//  PLUDragonHatchView.m
//  TGA
//
//  Created by mafengxin on 16/6/2.
//  Copyright © 2016年 developer. All rights reserved.
//

#import "SLDragonHatchView.h"
#import "KframeLayer.h"

@interface SLDragonHatchView ()

@property (nonatomic, weak) KframeLayer *baseLayer;

@property (nonatomic, weak) KframeLayer *uperlayer;

@end

@implementation SLDragonHatchView

-(void)setPercentage:(CGFloat)percentage{

    _percentage = percentage;
    self.baseLayer.percentage = percentage;
    self.uperlayer.percentage = percentage;

}

-(KframeLayer *)baseLayer{

    if (!_baseLayer) {

        KframeLayer *layer = [[KframeLayer alloc] init];
        [self.layer addSublayer:layer];
        _baseLayer = layer;

        CGSize size = [UIImage imageNamed:@"initPullStep_1"].size;
        layer.bounds = CGRectMake(0, 0, size.width, size.height);
        layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"initPullStep_1"].CGImage);

        layer.apartments = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.71, @1];
        layer.transformRotateValues = @[@0,@(-M_PI_4),@(M_PI_4),@(-M_PI_4 *0.8),@(M_PI_4 * 0.8),@(-M_PI_4 * 0.5),@(M_PI_4 * 0.5),@0,@0,@0,@0,];
        layer.imgNames = @[@"initPullStep_1",@"initPullStep_1",@"initPullStep_1",@"initPullStep_1",@"initPullStep_1",
                           @"initPullStep_1",@"initPullStep_1",@"initPullStep_1", @"basePullStep_1", @"basePullStep_2"];
        CGPoint point = layer.position;
        layer.anchorPoint = CGPointMake(0.5, 1);
        layer.position = CGPointMake(point.x, point.y + size.height / 2);


    }
    return _baseLayer;
}

-(KframeLayer *)uperlayer{

    if (!_uperlayer) {

        KframeLayer *layer = [[KframeLayer alloc] init];
        [self.layer addSublayer:layer];
        _uperlayer = layer;
        CGSize size = [UIImage imageNamed:@"upperPullStep_1"].size;
        layer.bounds = CGRectMake(0, 0, size.width, size.height);
        layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"upperPullStep_1"].CGImage);
//        layer.hidden = YES;

        layer.apartments = @[@0, @0.7,@0.7, @0.71, @0.9, @1];
        layer.alphaValus = @[@1, @1,@0, @0, @0.2, @1, @1];
        layer.transformYValues = @[@0, @(0),@0, @(-2), @(-30), @(-50), @(-50)];

    }

    return _uperlayer;
}

-(void)updateLayer{
    _baseLayer.position = CGPointMake(self.layer.position.x, self.layer.position.y + _baseLayer.bounds.size.height / 2);
    _uperlayer.position = self.layer.position;
}

-(void)hidelayer:(BOOL)hidden{
    _uperlayer.hidden = hidden;
    _baseLayer.hidden = hidden;
}

@end
