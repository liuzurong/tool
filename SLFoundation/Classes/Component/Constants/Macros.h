//
//  Macros.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#ifndef Macros_h
#define Macros_h
#import "UIFont+AdapterFont.h"
#define LocalImage(imageName) [UIImage imageNamed:imageName]

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define FontWithSize(size) [UIFont adaptFontWithSize:size]
#define BoldFontWithSize(size) [UIFont adaptBoldFontWithSize:size]

#define FormatDoubleToString(value) [NSString stringWithFormat:@"%0.2f",value]

#define AdaptHeightByIp6(height) (height) ///667.f * kScreenHeight
#define AdaptWidthByIp6(width) (width) ///375.f * kScreenWidth
#define SLUserLoginSucessNotification  @"userLoginSucessNotification"

#define SLUserLogoutSucessNotification @"userLogoutSucessNotification"
#endif /* Macros_h */
