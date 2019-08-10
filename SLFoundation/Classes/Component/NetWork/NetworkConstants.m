//
//  NetworkConstants.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "NetworkConstants.h"

@implementation NetworkConstants
NSString * const DzhDomain = @"http://gw.yundzh.com";
#ifdef DEBUG
NSString * const RemoteUrl = @"http://116.62.189.185";//@"http://10.5.202.175";
//NSString * const RemoteUrl = @"http://api.lmx360.com";//@"http://180.169.118.86:4000";//@"http://116.62.189.185";
//NSString * const J2tRemoteUrl = @"http://118.31.39.51:8080";//@"https://tst133.just2trade.online/api2";
NSString * const TradeRemoteUrl = @"http://10.5.204.144:8080";
NSString * const ConfigUrl = @"http://116.62.189.185/Infos/0cdbdeb2-7547-489d-ba4c-381a87047c64/data.json?nsukey=bjTpp5RJ8EXYlbqD2TSwoNNsLX05pdsmbUYcU2jPsZ0hg%2Bsfm7gZ%2BJGFUTY6Cal4HC38TplBk5%2Bw3M0ZF6GG%2FRzexd55J7X7PhZmSxi547uYeATmN%2BHaBS2WcZ7EjtyDAkXmxHnumFFh42Th0o3%2FAhRp7QRob3W1OE91QhKJHJk%3D";
#else
NSString * const RemoteUrl = @"http://116.62.189.185";//@"http://116.62.189.185";
//NSString * const J2tRemoteUrl = @"http://118.31.39.51:9000";//@"http://10.5.204.144:8080";//@"https://tst133.just2trade.online/api2";
NSString * const TradeRemoteUrl = @"http://118.31.39.51:8080";
NSString * const ConfigUrl = @"http://116.62.189.185/Infos/0cdbdeb2-7547-489d-ba4c-381a87047c64/data.json?nsukey=bjTpp5RJ8EXYlbqD2TSwoNNsLX05pdsmbUYcU2jPsZ0hg%2Bsfm7gZ%2BJGFUTY6Cal4HC38TplBk5%2Bw3M0ZF6GG%2FRzexd55J7X7PhZmSxi547uYeATmN%2BHaBS2WcZ7EjtyDAkXmxHnumFFh42Th0o3%2FAhRp7QRob3W1OE91QhKJHJk%3D";
#endif

NSString * const DzhToken = @"bigWisdom/getToken?appId=null&secret_key=null";

/***************个股详情***************/
NSString * const secuCominfo = @"hy_api/tactDetail/secuCominfo";

/***************行情行情***************/
NSString * const GlobalMarket = @"quotes";

NSString * const TimeTalkInfoApi = @"timetalk-info-api";
NSString * const TimeTalkBsApi = @"timetalk-bs-api";
@end
