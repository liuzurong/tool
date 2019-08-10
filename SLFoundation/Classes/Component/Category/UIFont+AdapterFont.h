//
//  UIFont+AdapterFont.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (AdapterFont)
+(UIFont *)adaptFontWithSize:(NSInteger)size;
+(UIFont *)adaptBoldFontWithSize:(NSInteger)size;
@end
