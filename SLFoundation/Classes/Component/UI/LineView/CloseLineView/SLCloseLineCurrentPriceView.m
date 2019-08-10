//
//  SLCloseLineCurrentPriceView.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLCloseLineCurrentPriceView.h"
#import "SLPriceView.h"

@interface SLCloseLineCurrentPriceView ()

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) SLPriceView *priceView;
@end
@implementation SLCloseLineCurrentPriceView
-(void)createSubviews
{
    _dateLabel = [self createLabelWithFont:FontWithSize(10.f) textColor:TextNormalColor textAlignment:NSTextAlignmentLeft];
    _dateLabel.text = @"2017-07-24";
    
    _priceView = [SLPriceView new];
    _priceView.image = LocalImage(@"dot_blue");
    _priceView.text = @"5.12%";
    
    [self addSubview:_priceView];
    
    _priceView.font = FontWithSize(10.);
}

-(void)layoutSubviews
{
    @weakify(self);
    //    [_leftSpaceView mas_updateConstraints:^(MASConstraintMaker *make) {
    //        @strongify(self);
    //        make.left.equalTo(@0);
    //        make.width.equalTo(self.rightSpaceView);
    //    }];
    //
    //    [_rightSpaceView mas_updateConstraints:^(MASConstraintMaker *make) {
    //        @strongify(self);
    //        make.right.equalTo(@0);
    //        make.width.equalTo(self.leftSpaceView);
    //    }];
    //
    //    [_dateLabel mas_updateConstraints:^(MASConstraintMaker *make) {
    //        @strongify(self);
    //        make.left.equalTo(self.leftSpaceView.mas_right);
    //        make.centerY.equalTo(self);
    //    }];
    //
    //    [_priceView1 mas_updateConstraints:^(MASConstraintMaker *make) {
    //        @strongify(self);
    //        make.left.equalTo(self.dateLabel.mas_right);
    //        make.centerY.equalTo(self);
    //    }];
    //
    //    [_priceView2 mas_updateConstraints:^(MASConstraintMaker *make) {
    //        @strongify(self);
    //        make.left.equalTo(self.priceView1.mas_right);
    //        make.right.equalTo(self.rightSpaceView.mas_left);
    //        make.centerY.equalTo(self);
    //    }];
    
    if (self.alignment == 0) {
        [_dateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(@10);
            make.centerY.equalTo(self);
        }];
        
        [_priceView mas_remakeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.dateLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self);
        }];
    }
    else
    {
        [_dateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.equalTo(self.priceView.mas_left).with.offset(-5);
            make.centerY.equalTo(self);
        }];
        
        [_priceView mas_remakeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.equalTo(@(-10));
            make.centerY.equalTo(self);
        }];
    }
}

-(void)setDateString:(NSString *)dateString
{
    _dateLabel.text = dateString;
}

-(void)setPriceText:(NSString *)priceText
{
    _priceView.text = priceText;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
