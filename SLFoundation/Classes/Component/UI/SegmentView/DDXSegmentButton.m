//
//  DDXSegmentButton.m
//  DDXStockGuard
//
//  Created by tongt-PC on 16/2/22.
//  Copyright © 2016年 tongtao. All rights reserved.
//

#import "DDXSegmentButton.h"

@interface DDXSegmentButton ()

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
@implementation DDXSegmentButton

-(void)createSubviews
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_titleLabel];
    
    _imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
}

-(void)layoutSubviews
{
    float fWidth = self.frame.size.width;
    float fHPadding = 5.f;
    CGSize sizeName = [_titleLabel.text sizeWithFont:_titleLabel.font
                        constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                            lineBreakMode:NSLineBreakByWordWrapping];
    CGSize imageSize = _imageView.image.size;
    
    float fOriginX = (fWidth - fHPadding - sizeName.width - imageSize.width)/2;
    
    @weakify(self);
    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(@0);
//        make.width.equalTo(@(fOriginX + sizeName.width));
        make.height.equalTo(self);
        
        if (self->_segmentAlignment == SegmentTitleAlignmentCenter) {
            if (_SegmentTitlePositon == SegmentTitlePositonRight) {
                make.left.equalTo(self).with.offset(fOriginX+imageSize.width+fHPadding);
            }else{
              make.left.equalTo(self).with.offset(fOriginX);
            }
        }
        else if(self->_segmentAlignment == SegmentTitleAlignmentLeft)
        {
            if (_SegmentTitlePositon == SegmentTitlePositonRight) {
                make.left.equalTo(self).with.offset(imageSize.width+fHPadding);
            }else{
               make.left.equalTo(@(0));
            }
        }
        else if(self->_segmentAlignment == SegmentTitleAlignmentRight)
        {
            float fOffset = self.imageView.image == nil? 0 : (-(imageSize.width + 5));
            
            if (_SegmentTitlePositon == SegmentTitlePositonRight) {
                make.right.equalTo(self);
            }else{
               make.right.equalTo(self).with.offset(fOffset);
            }
        }
        
       
        
    }];
    if (_imageView.image) {
        [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            if (self->_segmentAlignment == SegmentTitleAlignmentCenter) {
                if (_SegmentTitlePositon == SegmentTitlePositonRight) {
                    make.right.equalTo(self->_titleLabel.mas_left).offset(-fHPadding);
                }else{
                   make.left.equalTo(self->_titleLabel.mas_right).with.offset(fHPadding);
                }
            }
            else if(self->_segmentAlignment == SegmentTitleAlignmentLeft)
            {
                if (_SegmentTitlePositon == SegmentTitlePositonRight) {
                    make.right.equalTo(self->_titleLabel.mas_left).offset(-fHPadding);
                }else{
                  make.left.equalTo(self->_titleLabel.mas_right).with.offset(fHPadding);
                }
                //            make.left.equalTo(self).with.offset(5 + sizeName.width);
            }
            else if(self->_segmentAlignment == SegmentTitleAlignmentRight)
            {
                if (_SegmentTitlePositon == SegmentTitlePositonRight) {
                    make.right.equalTo(self->_titleLabel.mas_left).offset(-fHPadding);
                }else{
                    make.right.equalTo(self);
                }
            }
            
            make.centerY.equalTo(self);
        }];
    }
}

-(instancetype)init
{
    if (self = [super init]) {
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createSubviews];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title imageInstance:(UIImage *)imageInstance{
    if (self = [super initWithFrame:frame]) {
        self.segmentAlignment = SegmentTitleAlignmentCenter;
        [self createSubviews];
        _titleLabel.text = title;
        _titleLabel.font = FontWithSize(15.5f);
        if (imageInstance) {
            _imageView.image = imageInstance;
        }
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(NSString *)imageName
{
    if (self = [super initWithFrame:frame]) {
        self.segmentAlignment = SegmentTitleAlignmentCenter;
        [self createSubviews];
        _titleLabel.text = title;
        _titleLabel.font = FontWithSize(15.5f);
        if (imageName && ![imageName isEqualToString:@""]) {
            _imageView.image = [UIImage imageNamed:imageName];
        }
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

-(NSString *)getTitle
{
    return _titleLabel.text;
}

-(void)setImage:(UIImage *)image
{
    _imageView.image = image;
    [self setNeedsLayout];
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleLabel.textColor = titleColor;
}

-(void)setTitleFont:(UIFont *)font
{
    _titleLabel.font = font;
}

-(void)setTitleAligment:(SegmentTitleAlignment)segmentAlignment
{
    self.segmentAlignment = segmentAlignment;
}

-(void)setSegmentTitlePositon:(SLSegmentTitlePositon)SegmentTitlePositon{
     _SegmentTitlePositon = SegmentTitlePositon;

}
#pragma clang diagnostic pop
@end
