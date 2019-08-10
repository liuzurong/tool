//
//  CustomUserDefault.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    CustomUserDefaultKeyLoginToken = 0,//用户token
    CustomUserDefaultKeyDzhAccessToken = 1,//大智慧token
    CustomUserDefaultKeyDzhAccessTokenInfo = 2,//大智慧Token相关信息 处理token超时
    CustomUserDefaultKeyDeviceToken = 3,    //推送token
    CustomUserDefaultKeyFirstLaunch = 4,    //是否第一次登陆
    
    CustomUserDefaultsKeyGlobalMarketHKInfo = 5,
    CustomUserDefaultsKeyGlobalMarketUSInfo = 6,
    CustomUserDefaultsKeyGlobalMarketGlobalInfo = 7,
    CustomUserDefaultsKeyGlobalMarketVersion = 8,
    
    CustomUserDefaultsKeyJ2tAccessToken = 9,//J2t 登录token
    CustomUserDefaultsKeyJ2tAccount = 10, //J2t 登录用户名-手机号
    CustomUserDefaultsKeyShowTrade = 11,//是否显示交易，专为apple审核
    CustomUserDefaultsKeyUserInfo = 12,//用户信息
}CustomUserDefaultsKey;

@interface CustomUserDefault : NSObject

+ (id)valueForKey:(CustomUserDefaultsKey)cusKey;
+ (void)setValue:(id)value forKey:(CustomUserDefaultsKey)cusKey;

+ (BOOL)boolForKey:(CustomUserDefaultsKey)cusKey;
+ (void)setBool:(BOOL)value forKey:(CustomUserDefaultsKey)cusKey;

+ (NSInteger)integerForKey:(CustomUserDefaultsKey)cusKey;
+ (void)setInteger:(NSInteger)value forKey:(CustomUserDefaultsKey)cusKey;
+(void)removeValueForKey:(CustomUserDefaultsKey)cusKey;
@end
