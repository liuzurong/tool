//
//  UserUtils.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserUtils : NSObject
//manager login token
+(void)setLoginToken:(NSString *)token;
+(NSString *)getLoginToken;

//大智慧
+(NSString *)getDzhAccessToken;
+(void)removeDzhAccessToken;
@end
