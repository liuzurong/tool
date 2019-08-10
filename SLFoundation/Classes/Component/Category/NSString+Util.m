//
//  NSString+Util.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)


+(BOOL)isBlank:(id)obj
{
    if(obj == [NSNull null] || obj == nil)return YES;
    if([obj isKindOfClass:[NSArray class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSMutableArray class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSDictionary class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSMutableDictionary class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSData class]])
        return [obj length]==0;
    if([obj isKindOfClass:[NSString class]])
        return [obj length]==0;
    return NO;
}


- (NSString *)replacingStr:(NSString*)sourceStr toStr:(NSString*)toStr {
    if ([NSString isBlank:self]) {
        return @"";
        
    }else{
        if ([NSString isBlank:sourceStr]||[NSString isBlank:toStr]){
            return self;
        }
        NSString *strUrl = [self stringByReplacingOccurrencesOfString:sourceStr withString:toStr];
        return strUrl;
    }
    
}

- (NSString *)exceptSpecifyStr:(NSString*)source {
    if ([NSString isBlank:self]||([NSString isBlank:source]&&[NSString isBlank:self])) {
        return @"";
       
    }else{
        if ([NSString isBlank:source]) {
            return self;
        }
        NSString *strUrl = [self stringByReplacingOccurrencesOfString:source withString:@""];
        return strUrl;
    }
}




+(NSString *)replaceNSNull:(id)source {
    if([NSString isBlank:source]){
        return @"";
    }
    return source;
    
}

+(NSString *)trimSpaceStr:(NSString *)str{
    if ([NSString isBlank:str]) {
        return @"";
    }
    //return  [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //字符串通过整理字符 stringByTrimmingCharactersInSet 函数过滤字符串中的特殊符号 去除空格
    //    使用NSString中的stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]方法只是去掉左右两边的空格；
    
    
    //    使用NSString *strUrl = [urlString stringByReplacingOccurrencesOfString:@" " withString:@""];可以去掉空格，注意此时生成的strUrl是autorelease属性的，不要妄想对strUrl进行release操作。
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

-(BOOL)isEmpty
{
    return self == nil || [self isEqual:[NSNull null]] || [self isEqualToString:@""];
}

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(BOOL)judgePassWordLegal:(NSString *)pass regex:(NSString *)regex{
    BOOL result = false;
    if ([pass length] >= 8){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        //        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}

#pragma mark -
#pragma formatter int to 4 lenght string
+(NSString *)getFormateStringByValue:(long long)iValue
{
    NSString *formateString = @"";
    NSString *symbol = @"";
    if (iValue < 0) {
        symbol = @"-";
    }
    iValue = llabs(iValue);
    float fValue = 0.f;
    if (iValue > 1000000000000.f) {
        fValue = iValue/1000000000000.f;
        formateString = [self formate4lengthStringByValue:fValue];
        formateString = [NSString stringWithFormat:@"%@%@万亿",symbol,formateString];
        //        formateString = [NSString stringWithFormat:@"%0.2f万亿",iValue/1000000000000.f];
    }
    if (iValue > 100000000) {
        fValue = iValue/100000000.f;
        formateString = [self formate4lengthStringByValue:fValue];
        formateString = [NSString stringWithFormat:@"%@%@亿",symbol,formateString];
        //        formateString = [NSString stringWithFormat:@"%0.2f亿",iValue/100000000.f];
    }
    else if (iValue > 10000)
    {
        fValue = iValue/10000.f;
        formateString = [self formate4lengthStringByValue:fValue];
        formateString = [NSString stringWithFormat:@"%@%@万",symbol,formateString];
        //        formateString = [NSString stringWithFormat:@"%0.2f万",iValue/10000.f];
    }
    else
    {
        formateString = [NSString stringWithFormat:@"%@%lld",symbol,iValue];
    }
    
    return formateString;
}

+(NSString *)getFormateStringByYIValue:(long long)iValue
{
    NSString *formateString = @"";
    iValue = llabs(iValue);
    float fValue = 0.f;
    if (iValue > 1000000000000.f) {
        fValue = iValue/1000000000000.f;
        formateString = [self formate4lengthStringByValue:fValue];
        formateString = [NSString stringWithFormat:@"%@万",formateString];
    }
    else {// (iValue > 100000000)
        fValue = iValue/100000000.f;
        formateString = [self formate4lengthStringByValue:fValue];
        formateString = [NSString stringWithFormat:@"%@",formateString];
    }
    return formateString;
}

+(NSString *)formate4lengthStringByValue:(float)fValue
{
    NSString *formateString = @"";
    NSInteger iValue = (NSInteger)fValue;
    if (iValue >= 1000) {
        formateString = [NSString stringWithFormat:@"%ld",iValue];
    }
    else if(iValue >= 100)
    {
        formateString = [NSString stringWithFormat:@"%0.1f",fValue];
    }
    else
    {
        formateString = [NSString stringWithFormat:@"%0.2f",fValue];
    }
    
    return formateString;
}

+ (NSString *)cachePathForUrl:(NSString *)url
{
    // This stores in the Caches directory, which can be deleted when space is low, but we only use it for offline access
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *fileName = [NSString stringWithFormat:@"archiveFile_%ld",(long)[url hash]];
    
    return [cachesPath stringByAppendingPathComponent:fileName];
}

+(void)removeCacheWithUrl:(NSString *)url
{
    @try {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [self cachePathForUrl:url];
        if ([fileManager fileExistsAtPath:path]) {
            [fileManager removeItemAtPath:path error:nil];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

+(CGFloat)getStringHeightWithString:(NSString *)string size:(CGSize)size  font:(UIFont *)font
{
    float fHeight = 0.f;
    if (string && ![string isEqualToString:@""]) {
        fHeight = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height + 5;
    }
    return fHeight;
}

+ (NSString *)transformPinYinWithString:(NSString *)chinese
{
    NSString  * pinYinStr = [NSString string];
    if (chinese.length){
        NSMutableString * pinYin = [[NSMutableString alloc]initWithString:chinese];
        //1.先转换为带声调的拼音
        if(CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"带声调的pinyin: %@", pinYin);
        }
        //2.再转换为不带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"不带声调的pinyin: %@", pinYin);
        }
        //3.去除掉首尾的空白字符和换行字符
        pinYinStr = [pinYin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //4.去除掉其它位置的空白字符和换行字符
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        [pinYinStr capitalizedString];
    }
    return pinYinStr;
}
@end
