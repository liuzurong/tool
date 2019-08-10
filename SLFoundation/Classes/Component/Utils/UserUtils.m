//
//  UserUtils.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "UserUtils.h"
#import "CustomUserDefault.h"

@implementation UserUtils
#pragma mark - Login Token Manager
+(void)setLoginToken:(NSString *)token
{
    [CustomUserDefault setValue:token forKey:CustomUserDefaultKeyLoginToken];
    NSLog(@"token:%@",token);
}

+(NSString *)getLoginToken
{
    return [CustomUserDefault valueForKey:CustomUserDefaultKeyLoginToken];
}

+(void)removeLoginToken
{
    [CustomUserDefault removeValueForKey:CustomUserDefaultKeyLoginToken];
    NSLog(@"remove token");
}

#pragma mark - Dzh Access Token
+(NSString*)getDzhAccessToken
{
    NSString *token = [CustomUserDefault valueForKey:CustomUserDefaultKeyDzhAccessToken];
    //    if (token == nil) {
    //        [[[NetWorkRequest shareRequest] getDzhAccessToken] subscribeNext:^(id x) {
    //            NSLog(@"%@",x);
    //        }];
    //    }
    
    return token;
}

+(void)removeDzhAccessToken
{
    [CustomUserDefault removeValueForKey:CustomUserDefaultKeyDzhAccessToken];
    [CustomUserDefault removeValueForKey:CustomUserDefaultKeyDzhAccessTokenInfo];
}
@end
