//
//  SLCloseLineCurrentPriceView.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>

@interface SLCloseLineCurrentPriceView : SLBaseView
@property (nonatomic, assign) NSInteger alignment;//0 left; 1 right;

-(void)setDateString:(NSString *)dateString;
-(void)setPriceText:(NSString *)priceText;
@end
