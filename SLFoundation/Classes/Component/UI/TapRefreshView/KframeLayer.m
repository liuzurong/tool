//
//  KframeLayer.m
//  TGA
//
//  Created by mafengxin on 16/6/2.
//  Copyright © 2016年 developer. All rights reserved.
//

#import "KframeLayer.h"

@interface KframeLayer ()

@property(nonatomic, assign) NSInteger stage;

@end

@implementation KframeLayer

-(void)setPercentage:(CGFloat)percentage{

    NSAssert(_apartments.count > 0, @"set apartments first");
    _percentage = percentage;
    _stage = [self stageOfPercentage:percentage];
    [self updateWithStage:_stage];

}

- (NSInteger)stageOfPercentage:(CGFloat) percent{
    __block NSInteger stage = 0;
    [_apartments enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        stage = idx;

        if ((idx == 0 && percent <= obj.doubleValue) ||
            (idx > 0 && percent > _apartments[idx - 1].doubleValue && percent <= obj.doubleValue ))
        {
            *stop = YES;

        }else if (idx == _apartments.count - 1 && percent > obj.doubleValue)
        {
            stage = idx + 1;
            *stop = YES;

        }

    }];
    return stage;
}

- (void)setImgOfStage:(NSInteger) stage{

    if (_imgNames.count > 0) {

        UIImage *img ;

        if (stage < _imgNames.count) {

            img  = [UIImage imageNamed:_imgNames[stage]];

        }else{

            img = [UIImage imageNamed:[_imgNames lastObject]];

        }

        self.contents = (__bridge id _Nullable)(img.CGImage);
    }

}

- (void)setAlpnaOfStage:(NSInteger) stage{

    if (_alphaValus.count > 0) {

        CGFloat alpha = 1;

        if (stage == 0) {

             alpha = [_alphaValus[0] doubleValue] ;

        }else if (stage == _apartments.count){

            alpha = [[_alphaValus lastObject] doubleValue];

        }else{

            alpha = [self currentStagePercentage:stage] * ([_alphaValus[stage] doubleValue] - [_alphaValus[stage - 1] doubleValue]) + [_alphaValus[stage - 1] doubleValue];

        }

        self.opacity = 1 - alpha;
    }

}

- (void)setTransformXOfStage:(NSInteger) stage{

    if (_transformYValues.count > 0) {
        
        CGFloat offset = 0;

        if (stage == 0) {

            offset = [_transformYValues[0] doubleValue] ;

        }else if (stage == _apartments.count){

            offset = [[_transformYValues lastObject] doubleValue];

        }else{

            offset = [self currentStagePercentage:stage] * ([_transformYValues[stage] doubleValue] - [_transformYValues[stage - 1] doubleValue]) + [_transformYValues[stage - 1] doubleValue];
            
        }
        self.transform = CATransform3DMakeTranslation(0, [_transformYValues[0] doubleValue] + offset, 0);
    }
    
}

- (void)setTransformRotateOfStage:(NSInteger) stage{

    if (_transformRotateValues.count > 0) {

        CGFloat offset = 0;

        if (stage == 0) {

            offset = [_transformRotateValues[0] doubleValue] ;

        }else if (stage == _apartments.count){

            offset = [[_transformRotateValues lastObject] doubleValue];

        }else{

            offset = [self currentStagePercentage:stage] * ([_transformRotateValues[stage] doubleValue] - [_transformRotateValues[stage - 1] doubleValue]) + [_transformRotateValues[stage - 1] doubleValue];

        }
        self.transform = CATransform3DMakeRotation(offset,0, 0, 1);
    }
    
}

- (CGFloat) currentStagePercentage:(NSInteger) stage{
    return  (_percentage - [_apartments[stage - 1] doubleValue])/ ([_apartments[stage] doubleValue] -  [_apartments[stage - 1] doubleValue]);
}

- (void)setHideOfStage:(NSInteger) stage{

    if (_hiddenValues.count > 0) {

        BOOL hide = NO;

        if (stage < _hiddenValues.count) {

            hide = [_hiddenValues[stage] boolValue];

        }else{

            hide = [[_hiddenValues lastObject] boolValue];
            
        }

        self.hidden = hide;
    }
    
}

- (void)updateWithStage:(NSInteger) stage{

    [self setImgOfStage:stage];
    [self setAlpnaOfStage:stage];
    [self setHideOfStage:stage];
    [self setTransformXOfStage:stage];
    [self setTransformRotateOfStage:stage];
}

-(void)setPosition:(CGPoint)position{

    [super setPosition:position];
    
}

@end
