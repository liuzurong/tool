//
//  LocalCache.m
//  SLFoundation
//
//  Created by tgtao on 2018/1/31.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "LocalCache.h"
#import "CustomUserDefault.h"

@implementation LocalCache

+(instancetype)cache {
    static LocalCache *instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [LocalCache new];
    });
    return instance;
}

+(void)saveUserInfo:(id)userInfo {
    if (![userInfo isKindOfClass:[NSDictionary class]]) {
        return;
    }
    NSMutableDictionary *info = [userInfo mutableCopy];
    
    NSMutableArray *nullArray = [NSMutableArray array];
    for (NSString *key in info.allKeys) {
        NSObject *value = info[key];
        if ([value isEqual:[NSNull null]]) {
            [nullArray addObject:key];
        }
    }
    for (NSString *key in nullArray) {
        [info setObject:@"" forKey:key];
    }
    [CustomUserDefault setValue:info forKey:CustomUserDefaultsKeyUserInfo];
    [LocalCache cache].userModel = [[UserInfoModel alloc] initWithDictionary:userInfo error:nil];
}

-(UserInfoModel *)userModel {
    if (nil == _userModel && [CustomUserDefault valueForKey:CustomUserDefaultsKeyUserInfo]) {
        _userModel = [[UserInfoModel alloc] initWithDictionary:[CustomUserDefault valueForKey:CustomUserDefaultsKeyUserInfo] error:nil];
    }
    return _userModel;
}
@end
