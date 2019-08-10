//
//  NSString+Util.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

/**
 除去字符串

 @param source <#source description#>
 @return <#return value description#>
 */
- (NSString *)exceptSpecifyStr:(NSString*)source;

- (NSString *)replacingStr:(NSString*)sourceStr toStr:(NSString*)sourceStr ;

+(NSString *)replaceNSNull:(id)source;

+(NSString *)trimSpaceStr:(NSString *)str;

+(BOOL)isBlank:(id)obj;

-(BOOL)isEmpty;

+ (BOOL)isMobileNumber:(NSString *)mobileNum;

+(BOOL)judgePassWordLegal:(NSString *)pass regex:(NSString *)regex;

+(NSString *)getFormateStringByValue:(long long)iValue;

+ (NSString *)cachePathForUrl:(NSString *)url;

+(void)removeCacheWithUrl:(NSString *)url;

+(CGFloat)getStringHeightWithString:(NSString *)string size:(CGSize)size font:(UIFont *)font;

+ (NSString *)transformPinYinWithString:(NSString *)chinese;
@end
