//
//  CustomUserDefault.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "CustomUserDefault.h"

@implementation CustomUserDefault
+(NSString *)getRealKeyForKey:(CustomUserDefaultsKey)key
{
    return [NSString stringWithFormat:@"SL_USER_DEFAULTS_%d", key];
}

+ (id)valueForKey:(CustomUserDefaultsKey)cusKey {
    return [[NSUserDefaults standardUserDefaults] valueForKey:[self getRealKeyForKey:cusKey]];
}

+ (void)setValue:(id)value forKey:(CustomUserDefaultsKey)cusKey {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:[self getRealKeyForKey:cusKey]];
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:[self getRealKeyForKey:cusKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (BOOL)boolForKey:(CustomUserDefaultsKey)cusKey {
    return [[NSUserDefaults standardUserDefaults] boolForKey:[self getRealKeyForKey:cusKey]];
}


+ (void)setBool:(BOOL)value forKey:(CustomUserDefaultsKey)cusKey {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:[self getRealKeyForKey:cusKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSInteger)integerForKey:(CustomUserDefaultsKey)cusKey {
    return [[NSUserDefaults standardUserDefaults] integerForKey:[self getRealKeyForKey:cusKey]];
}


+ (void)setInteger:(NSInteger)value forKey:(CustomUserDefaultsKey)cusKey {
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:[self getRealKeyForKey:cusKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)removeValueForKey:(CustomUserDefaultsKey)cusKey
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:[self getRealKeyForKey:cusKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
