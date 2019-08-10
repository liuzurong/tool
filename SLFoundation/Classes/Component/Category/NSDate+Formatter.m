//
//  NSDate+Formatter.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

- (NSInteger)year
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:self];
}

- (NSInteger)month
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:self];
}

- (NSString *)monthStr {
    if ([self month]>9) {
        return   [NSString stringWithFormat:@"%zd",[self month]];
    }else{
        return   [NSString stringWithFormat:@"0%zd",[self month]];
    }
}

- (NSString *)monthChineseStr{
    switch ( [self month]) {
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
        case 5:
            return @"五";
            break;
        case 6:
            return @"六";
            break;
        case 7:
            return @"七";
            break;
        case 8:
            return @"八";
            break;
        case 9:
            return @"九";
            break;
        case 10:
            return @"十";
            break;
        case 11:
            return @"十一";
            break;
        case 12:
            return @"十二";
            break;
            
        default:
            return @"未知";
            break;
    }
   
}

- (NSInteger)day
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:self];
}

- (NSInteger)weekStartday
{
    return  [self bxh_dateByMinusDays:(self.weekday-1)].day;
}

- (NSInteger)weekEndday
{
    return  [self bxh_dateByAddingDays:(7-self.weekday)].day;
}


- (NSString *)dayStr {
    if ([self day]>9) {
        return   [NSString stringWithFormat:@"%zd",[self day]];
    }else{
        return   [NSString stringWithFormat:@"0%zd",[self day]];
    }
}

- (NSString *)hourStr {
    if ([self hour]>9) {
        return   [NSString stringWithFormat:@"%zd",[self hour]];
    }else{
        return   [NSString stringWithFormat:@"0%zd",[self hour]];
    }
}

- (NSString *)minuteStr {
    if ([self minute]>9) {
        return   [NSString stringWithFormat:@"%zd",[self minute]];
    }else{
        return   [NSString stringWithFormat:@"0%zd",[self minute]];
    }
}

- (NSInteger)hour
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:self];
}

- (NSInteger)minute
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:self];
}

- (NSInteger)second
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:self];
}

- (NSInteger)nanosecond
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitNanosecond fromDate:self];
}

- (NSInteger)weekday
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:self];
}



- (NSString*)weekdayEnglishStr
{
    NSInteger weekDay = [self weekday] -1;
    switch (weekDay) {
        case 0:{
            return @"Sunday";
        }
            break;
            
        case 1:{
            return @"Monday";
        }
            break;
        case 2:{
            return @"Tuesday";
        }
            break;
            
        case 3:{
            return @"Tuesday";
        }
            break;
            
        case 4:{
            return @"Thursday";
        }
            break;
            
        case 5:{
            return @"Friday";
        }
            break;
        case 6:{
            return @"Saturday";
        }
            break;
        default:{
            return @"Sunday";
        }
            break;
            
            
    }
    
}

- (NSString*)weekdayStr
{
    NSInteger weekDay = [self weekday] -1;
    switch (weekDay) {
        case 0:{
            return @"日";
        }
            break;
            
        case 1:{
            return @"一";
        }
            break;
        case 2:{
            return @"二";
        }
            break;
            
        case 3:{
            return @"三";
        }
            break;
            
        case 4:{
            return @"四";
        }
            break;
            
        case 5:{
            return @"五";
        }
            break;
        case 6:{
            return @"六";
        }
            break;
        case 7:{
            return @"日";
        }
        default:{
            return @"日";
        }
            break;
            
            
    }
    
}

- (NSDate *)bxh_dateByAddingYears:(NSInteger)years
{
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)bxh_dateByMinusYears:(NSInteger)years
{
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:-years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)bxh_dateByAddingMonths:(NSInteger)months
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)bxh_dateByMinusMonths:(NSInteger)months
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:-months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)bxh_dateByAddingWeeks:(NSInteger)weeks
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)bxh_dateByMinusWeeks:(NSInteger)weeks
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:-weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)bxh_dateByAddingDays:(NSInteger)days
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)bxh_dateByMinusDays:(NSInteger)days
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] - 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)bxh_dateByAddingHours:(NSInteger)hours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)bxh_dateByMinusHours:(NSInteger)hours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] - 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}


- (NSDate *)bxh_dateByAddingMinutes:(NSInteger)minutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)bxh_dateByMinusMinutes:(NSInteger)minutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] - 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)bxh_dateByAddingSeconds:(NSInteger)seconds
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)bxh_dateByMinusSeconds:(NSInteger)seconds
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] - seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}


+ (NSDateFormatter *)sharedDateFormatter {
    static NSDateFormatter * sharedDateFormatterInstance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedDateFormatterInstance = [[NSDateFormatter alloc] init];
    });
    return sharedDateFormatterInstance;
}

+(NSString *)formatStringWithDateString:(NSString *)dateString fromFormat:(NSString *)fromFormatString toFormat:(NSString *)toFormatString
{
    NSDateFormatter *formatter = [self sharedDateFormatter];
    [formatter setDateFormat:fromFormatString];
    NSDate *date = [formatter dateFromString:dateString];
    date = [date dateByAddingTimeInterval:8 * 60 * 60];
    [formatter setDateFormat:toFormatString];
    return [formatter stringFromDate:date];
}

+(NSString *)formatUTCStringWithDateString:(NSString *)dateString fromFormat:(NSString *)fromFormatString toFormat:(NSString *)toFormatString
{
    NSDateFormatter *formatter = [self sharedDateFormatter];
    [formatter setDateFormat:fromFormatString];
    NSDate *date = [formatter dateFromString:dateString];
    [formatter setDateFormat:toFormatString];
    return [formatter stringFromDate:date];
}


-(NSString *)dateStringFromFormater:(NSDateFormatter *)formatter format:(NSString *)formatString
{
    if (formatter == nil) {
        formatter = [[self class] sharedDateFormatter];
    }
    [formatter setDateFormat:formatString];
    
    return [formatter stringFromDate:self];
}

+(NSString *)formatStringWithtimeInterVal:(NSTimeInterval)timeInterVal toFromat:(NSString *)toFromatString
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterVal];
    NSDateFormatter *formatter = [self sharedDateFormatter];
    [formatter setDateFormat:toFromatString];
    return [formatter stringFromDate:date];
}

+(NSDate *)getDateFromString:(NSString *)dateString format:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    [dateFormatter setDateFormat:formatString];
    
    return [dateFormatter dateFromString:dateString];
}

+(NSDate *)currentDateZeroWithFormat:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    [dateFormatter setDateFormat:formatString];
    
    NSDate *date = [NSDate date]; // 获得时间对象
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
    
    [dateFormatter setTimeZone:zone];
    //
    //    NSTimeInterval time = [zone secondsFromGMTForDate:date];// 以秒为单位返回当前时间与系统格林尼治时间的差
    //
    //    NSDate *dateNow = [date dateByAddingTimeInterval:time];// 然后把差的时间加上,就是当前系统准确的时间
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return [dateFormatter dateFromString:dateString];
}

+(NSString *)currentDateWithFormat:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    [dateFormatter setDateFormat:formatString];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (BOOL)isCurrentDay:(NSDate *)aDate
{
    if (aDate==nil) return NO;
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:aDate];
    NSDate *otherDate = [cal dateFromComponents:components];
    if([today isEqualToDate:otherDate])
        return YES;
    
    return NO;
}

+(NSString *)getTimeWithDateString:(NSString *)dateString formatString:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    [dateFormatter setDateFormat:formatString];
    NSDate *date = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    double timeInterval = [date timeIntervalSince1970];
    return [self getTimeWithTimeInterval:timeInterval];
}

+(NSString *)getTimeWithTimeInterval:(NSTimeInterval)timeInterval {
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    double currentInterval = [[NSDate date] timeIntervalSince1970];
    
    NSString *result = @"";
    double deltaInterval = currentInterval - timeInterval;
    if (deltaInterval < 60) {
        result = @"刚刚";
    } else if (deltaInterval < 3600) {
        result = [NSString stringWithFormat:@"%ld分钟前", (long)deltaInterval/60];
    } else if(deltaInterval < 24 * 3600) {
        result = [NSString stringWithFormat:@"%ld小时前", (long)deltaInterval/3600];
    } else {
        result = [dateFormatter stringFromDate:date];
    }
    
    return result;
}

+(NSString *)weekWithDateString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *dateFormatter = [self sharedDateFormatter];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday) fromDate:date];
    
    NSDictionary *weekMap = @{@1 : @"周日", @2 : @"周一", @3 : @"周二", @4 : @"周三", @5 : @"周四", @6 : @"周五", @7 : @"周六"};
    return weekMap[@(components.weekday)];
}

@end
