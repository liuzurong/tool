//
//  UIFont+AdapterFont.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "UIFont+AdapterFont.h"

@implementation UIFont (AdapterFont)
+(UIFont *)adaptFontWithSize:(NSInteger)size
    {
//        float newSize = size/667.f * kScreenHeight;
        return [UIFont systemFontOfSize:size];
    }
    
+(UIFont *)adaptBoldFontWithSize:(NSInteger)size
    {
//        float newSize = size/667.f * kScreenHeight;
        return [UIFont boldSystemFontOfSize:size];
    }
@end
