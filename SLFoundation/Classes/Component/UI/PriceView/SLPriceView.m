//
//  SLPriceView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLPriceView.h"

@interface SLPriceView ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIView *leftSpaceView, *rightSpaceView;
@end
@implementation SLPriceView

    -(instancetype)init
    {
        if (self = [super init]) {
            
        }
        return self;
    }
    
-(CGSize)intrinsicContentSize
    {
        CGSize priceSize = [_priceLabel intrinsicContentSize];
        CGSize iconSize = [_iconView intrinsicContentSize];
        if (iconSize.width) {
            return CGSizeMake(priceSize.width + iconSize.width + 5, MAX(priceSize.height, iconSize.height));
        }
        return priceSize;
    }
    
-(void)createSubviews
    {
        _iconView = [UIImageView new];
        //    _iconView.image = [UIImage imageNamed:@"price_up"];
        [self addSubview:_iconView];
        
        _priceLabel = [self createLabelWithFont:FontWithSize(16) textColor:TextNormalColor textAlignment:NSTextAlignmentLeft];
        
        _leftSpaceView = [UIView new];
        [self addSubview:_leftSpaceView];
        
        _rightSpaceView = [UIView new];
        [self addSubview:_rightSpaceView];
    }
    
-(void)layoutSubviews
    {
        @weakify(self);
        [_leftSpaceView mas_updateConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(@0);
            make.width.equalTo(self.rightSpaceView);
        }];
        
        [_rightSpaceView mas_updateConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.equalTo(@0);
            make.width.equalTo(self.leftSpaceView);
        }];
        
        [_iconView mas_updateConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.leftSpaceView.mas_right);
            make.centerY.equalTo(self);
        }];
        
        [_priceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.equalTo(self.rightSpaceView.mas_left);
            if (self.iconView.image.size.width > 0) {
                make.left.equalTo(self.iconView.mas_right).with.offset(5);
            }else
            {
                //            make.centerX.equalTo(self);
                make.left.equalTo(self.leftSpaceView.mas_right);
            }
            
            make.centerY.equalTo(self);
        }];
    }
    
#pragma mark - Setter
-(void)setImage:(UIImage *)image
    {
        _iconView.image = image;
    }
    
-(void)setText:(NSString *)text
    {
        _priceLabel.text = text;
    }
    
-(void)setFont:(UIFont *)font
    {
        _priceLabel.font = font;
    }
    
-(void)setTextColor:(UIColor *)textColor
    {
        _priceLabel.textColor = textColor;
    }
    
#pragma mark - Getter
-(UIImage *)image
    {
        return _iconView.image;
    }
    
-(NSString *)text
    {
        return _priceLabel.text;
    }
    
-(UIFont *)font
    {
        return _priceLabel.font;
    }
    
-(UIColor *)textColor
    {
        return _priceLabel.textColor;
    }
    
-(void)showUpImage
    {
        NSString *imageName = @"price_up";
        _iconView.image = LocalImage(imageName);
    }
    
-(void)showDownImage
    {
        NSString *imageName = @"price_down";
        _iconView.image = LocalImage(imageName);
    }
    
#pragma mark - Setter
-(void)setDoubleValue:(double)fValue
    {
        NSString *imageName = @"price_up";
        UIColor *priceColor = TextStockRise;
        if (fValue < 0) {
            imageName = @"price_down";
            priceColor = TextStockFall;
        }
        
        _priceLabel.text = [NSString stringWithFormat:@"%0.2f%%",fValue];
        _priceLabel.textColor = priceColor;
        _iconView.image = LocalImage(imageName);
    }
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
