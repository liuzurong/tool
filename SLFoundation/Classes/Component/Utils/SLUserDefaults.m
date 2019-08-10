//
//  SLUserDefaults.m
//  SLFoundation
//
//  Created by liuzurong on 2018/4/10.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "SLUserDefaults.h"

@implementation SLUserDefaults
+(BOOL)hasObject:(NSString *)key{
    if([NSString isBlank:key])return NO;
    return ![NSString isBlank:[self getObjectForKey:key]];
}

+(void)setObject:(id)obj forKey:(NSString *)key{
    if(![NSString isBlank:key]){
        NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
        [preferences setObject:obj forKey:key];
        [preferences synchronize];
    }
}

+(id)getObjectForKey:(NSString *)key{
    if([NSString isBlank:key])return nil;
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    return [preferences objectForKey:key];
}

+(void)removeObjectForKey:(NSString *)key{
    if(![NSString isBlank:key]){
        NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
        [preferences removeObjectForKey:key];
    }
}
@end
