//
//  NSDate+Formatter.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)

//年
@property (nonatomic, readonly, assign) NSInteger year;
//月
@property (nonatomic, readonly, assign) NSInteger month;
//01 月
@property (nonatomic, readonly, copy) NSString *monthStr;

@property (nonatomic, readonly, copy) NSString *monthChineseStr;

//日
@property (nonatomic, readonly, assign) NSInteger day;
//04 日
@property (nonatomic, readonly, copy) NSString *dayStr;
//时
@property (nonatomic, readonly, assign) NSInteger hour;

@property (nonatomic, readonly, copy) NSString *hourStr;

//分
@property (nonatomic, readonly, assign) NSInteger minute;


@property (nonatomic, readonly, copy) NSString *minuteStr;
//秒
@property (nonatomic, readonly, assign) NSInteger second;

//纳秒
@property (nonatomic, readonly, assign) NSInteger nanosecond;
//周几 1 - 7 first day is based on user setting
@property (nonatomic, readonly, assign) NSInteger weekday;

@property (nonatomic, readonly, assign) NSInteger weekStartday;

@property (nonatomic, readonly, assign) NSInteger weekEndday;
/**
 一 二 .....日
 */
@property (nonatomic, readonly, copy) NSString* weekdayStr;


@property (nonatomic, readonly, copy) NSString *weekdayEnglishStr;

@property (nonatomic, readonly, copy) NSString* AHourMinuteStr;


//=====================method dateAdd ===========//
//当前日期加几年
- (NSDate *)bxh_dateByAddingYears:(NSInteger)years;
//当前日期减几年
- (NSDate *)bxh_dateByMinusYears:(NSInteger)years;
//当前日期加几月
- (NSDate *)bxh_dateByAddingMonths:(NSInteger)months;
//当前日期减几月
- (NSDate *)bxh_dateByMinusMonths:(NSInteger)months;
//当前日期加几周
- (NSDate *)bxh_dateByAddingWeeks:(NSInteger)weeks;
//当前日期减几周
- (NSDate *)bxh_dateByMinusWeeks:(NSInteger)weeks;
//当前日期加几天
- (NSDate *)bxh_dateByAddingDays:(NSInteger)days;
//当前日期减几天
- (NSDate *)bxh_dateByMinusDays:(NSInteger)days;
//当前日期加几小时
- (NSDate *)bxh_dateByAddingHours:(NSInteger)hours;
//当前日期减几小时
- (NSDate *)bxh_dateByMinusHours:(NSInteger)hours;
//当前日期加几分钟
- (NSDate *)bxh_dateByAddingMinutes:(NSInteger)minutes;
//当前日期减几分钟
- (NSDate *)bxh_dateByMinusMinutes:(NSInteger)minutes;
//当前日期加几秒
- (NSDate *)bxh_dateByAddingSeconds:(NSInteger)seconds;
//当前日期减几秒
- (NSDate *)bxh_dateByMinusSeconds:(NSInteger)seconds;

+(NSDateFormatter *)sharedDateFormatter;

+(NSString *)formatStringWithDateString:(NSString *)dateString fromFormat:(NSString *)fromFormatString toFormat:(NSString *)toFormatString;

+(NSString *)formatUTCStringWithDateString:(NSString *)dateString fromFormat:(NSString *)fromFormatString toFormat:(NSString *)toFormatString;

-(NSString *)dateStringFromFormater:(NSDateFormatter *)formatter format:(NSString *)formatString;

+(NSString *)formatStringWithtimeInterVal:(NSTimeInterval)timeInterVal toFromat:(NSString *)toFromatString;

+(NSDate *)getDateFromString:(NSString *)dateString format:(NSString *)formatString;

+(NSDate *)currentDateZeroWithFormat:(NSString *)formatString;

+(NSString *)currentDateWithFormat:(NSString *)formatString;

+ (BOOL)isCurrentDay:(NSDate *)aDate;

+(NSString *)getTimeWithDateString:(NSString *)dateString formatString:(NSString *)formatString;
+(NSString *)getTimeWithTimeInterval:(NSTimeInterval)timeInterval;

+(NSString *)weekWithDateString:(NSString *)dateString format:(NSString *)format;



@end
