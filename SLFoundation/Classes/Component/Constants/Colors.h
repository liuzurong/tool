//
//  Colors.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#ifndef Colors_h
#define Colors_h

/** 色值 RGBA **/
#define RGB_A(r, g, b, a) [UIColor colorWithRed:(CGFloat)(r)/255.0f green:(CGFloat)(g)/255.0f blue:(CGFloat)(b)/255.0f alpha:(CGFloat)(a)]

/** 色值 RGB **/
#define RGB(r, g, b) RGB_A(r, g, b, 1)
#define RGB_HEX(__h__) RGB((__h__ >> 16) & 0xFF, (__h__ >> 8) & 0xFF, __h__ & 0xFF)

#define MainBackGroundColor RGB_HEX(0xF4EFEF)
#define ViceBackGroundColor RGB_HEX(0x1e1f2b)


#define NavBackGroundColor RGB_HEX(0xf6f6f6)
#define TabBarBackGroundColor RGB_HEX(0xf6f6f6)

#define NormalBackGroundColor RGB_HEX(0x444444)
#define GrayBackGroundColor RGB_HEX(0xdedede)
#define LightGrayBackGroundColor RGB_HEX(0xFAFAFA)//RGB_HEX(0xedf0f5)
#define LightGray999Color RGB_HEX(0x999999)
#define LightGrayF5Color RGB_HEX(0xf5f5f5)
#define BlueBackGroundColor RGB_HEX(0x2196F3)
#define YellowBackGroundColor RGB_HEX(0xf5a623)
#define PurpleBackGroundColor RGB_HEX(0x7a4fdf)
#define BlackBackGroundColor RGB_HEX(0x000000)
#define WhiteBackGroundColor RGB_HEX(0xffffff)
#define PinkBackGroundColor RGB_HEX(0xFF4F59)
#define RedBackGroundColor RGB_HEX(0xFF4F59)

#define TextBlackColor RGB_HEX(0x000000)
#define TextRedColor RGB_HEX(0xFF4F59)
#define TextNormalColor RGB_HEX(0x383838)
#define TextGrayColor RGB_HEX(0xCCC8C8)
#define TextGray5CColor RGB_HEX(0x5C5C5C)
#define TextLightGrayColor RGB_HEX(0x999999)
#define TextGrayDEColor RGB_HEX(0xdedede)
#define TextBlueColor RGB_HEX(0x007AFF)
#define TextStockRise RGB_HEX(0xf40016)
#define TextStockFall RGB_HEX(0x1bb31d)
#define TextWhiteColor RGB_HEX(0xffffff)
#define TextYellowColor RGB_HEX(0xf5a623)
#define TextPinkColor RGB_HEX(0xFF4F59)
#define TextLightGrayDEColor RGB_HEX(0xC7C7C7)
#define TextLightGrayDFColor RGB_HEX(0x808080)
#define TextLightGrayDGColor RGB_HEX(0xFAFAFA)
#define TextLowGrayColor RGB_HEX(0xA3A3A3)
#define TextLowGrayDEColor RGB_HEX(0xD8D8D8)
#define TextLowGrayDFColor RGB_HEX(0xCCCCCC)
#define TextLowGrayDHColor RGB_A(0,0,0,0.05)
#define TextLowRedColor RGB_A(255,79,89,0.6)
#define TextLowGrayDGColor RGB_HEX(0xEDEDED)
#define TextLowGrayDJColor RGB_HEX(0x999999)
#define TextLowGrayDKColor RGB_HEX(0x666666)
#define TextLowGrayDLColor RGB_HEX(0xE5E5E5)
#define TextLowGrayDMColor RGB_HEX(0x333333)
#define TextLowGrayDNColor RGB_HEX(0x4A4A4A)
#define TextLowGrayDOColor RGB_HEX(0x4A4A4A)

//[UIColor colorHex:@"FF4F59" alpha:0.6]

#endif /* Colors_h */

