//
//  NetworkConstants.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConstants : NSObject
extern NSString * const RemoteUrl;

extern NSString * const DzhDomain;

extern NSString * const DzhToken;

extern NSString * const ConfigUrl;

/***************个股详情***************/
extern NSString * const secuCominfo;

/***************行情行情***************/
extern NSString * const GlobalMarket;

extern NSString * const TimeTalkInfoApi;

extern NSString * const TimeTalkBsApi;

#ifndef DEBUG
#define BASE_URl_InfoServer @"http://rest.timetalk.vip/timetalk-info-api/"
#define BASE_URl1 @"http://rest.timetalk.vip/"
#define BASE_URl @"http://rest.timetalk.vip/timetalk-bs-api/"

#else
//测试
#define BASE_URl @"http://116.62.246.218:8082/timetalk-bs-api/"
#define BASE_URl1 @"http://116.62.246.218:8082/"
#define BASE_URl_InfoServer @"http://116.62.246.218:8082/timetalk-info-api/"

#endif

@end
