//
//  NetworkRequest+Dzh.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "NetworkRequest+Dzh.h"
#import "SLDzhStockModel.h"
#import "UserUtils.h"

@implementation NetworkRequest (Dzh)
-(NSString *)getDRKlineTypeByType:(kLineDRType)type
{
    NSString *strDRKlineType = @"1";
    switch (type) {
        case kLineDRTypeFDR:
            strDRKlineType = @"1";
            break;
        case kLineDRTypeBDR:
            strDRKlineType = @"2";
            break;
        case kLineDRTypeDR:
            strDRKlineType = @"0";
            break;
            
        default:
            break;
    }
    
    return strDRKlineType;
}

-(NSString *)getKlineTypeByType:(kLineType)type
{
    NSString *strKlineType = @"1day";
    switch (type) {
        case kLineType1Min:
            strKlineType = @"1min";
            break;
        case kLineType5Min:
            strKlineType = @"5min";
            break;
        case kLineType15Min:
            strKlineType = @"15min";
            break;
        case kLineType30Min:
            strKlineType = @"30min";
            break;
        case kLineType60Min:
            strKlineType = @"60min";
            break;
        case kLineType120Min:
            strKlineType = @"120min";
            break;
        case kLineType1Day:
            strKlineType = @"1day";
            break;
        case kLineType1Week:
            strKlineType = @"week";
            break;
        case kLineType1Month:
            strKlineType = @"month";
            break;
        default:
            break;
    }
    
    return strKlineType;
}

-(NSString *)getSubBySub:(BOOL)sub
{
    NSString *sSub = @"0";
    if (sub) {
        sSub = @"1";
    }
    return sSub;
}

-(RACSignal *)getKlineDataWithCode:(NSString *)sCode
{
    return [self getKlineDataWithCode:sCode kLineType:kLineType1Day drKLineType:kLineDRTypeFDR count:280];
}

-(RACSignal *)getKlineDataWithCode:(NSString *)sCode count:(NSInteger)count
{
    return [self getKlineDataWithCode:sCode kLineType:kLineType1Day drKLineType:kLineDRTypeFDR count:count];
}

-(RACSignal *)getKlineDataWithCode:(NSString *)sCode count:(NSInteger)count endTime:(NSString *)beginTime
{
    return [self getKlineDataWithCode:sCode kLineType:kLineType1Day drKLineType:kLineDRTypeFDR count:count endTime:beginTime];
}

-(RACSignal *)getKlineDataWithCode:(NSString *)sCode kLineType:(kLineType)kLineType drKLineType:(kLineDRType)drKLineType count:(NSInteger)count endTime:(NSString *)beginTime
{
    NSString *strKlineType = [self getKlineTypeByType:kLineType];
    NSString *strDRKlineType = [self getDRKlineTypeByType:drKLineType];
    
    return [self getWithUrlString:[NSString stringWithFormat:@"%@/quote/kline?obj=%@&period=%@&end_time=%@&count=%ld&split=%@&token=%@",DzhDomain,sCode,strKlineType,beginTime,(long)count,strDRKlineType,[UserUtils getDzhAccessToken]] param:nil];
}

-(RACSignal *)getKlineDataWithCode:(NSString *)sCode kLineType:(kLineType)kLineType drKLineType:(kLineDRType)drKLineType count:(NSInteger)count
{
    NSString *strKlineType = [self getKlineTypeByType:kLineType];
    NSString *strDRKlineType = [self getDRKlineTypeByType:drKLineType];
    
    return [self getWithUrlString:[NSString stringWithFormat:@"%@/quote/kline?obj=%@&period=%@&start=-1&count=%ld&split=%@&token=%@",DzhDomain,sCode,strKlineType,(long)-count,strDRKlineType,[UserUtils getDzhAccessToken]] param:nil];
}

+(RACSignal *)getStkMsgWithSendData:(NSString *)sendData key:(NSString *)key
{
    return [[self getDzhMapWithSendData:sendData] map:^id(id value) {
        NSArray* RepDataPaiXu = value[@"Data"][key];
        NSArray* stkModels = [SLDzhStockModel arrayOfModelsFromDictionaries:RepDataPaiXu error:nil];
        return stkModels;
    }];
}

+(RACSignal *)getStkMsgWithSendData:(NSString *)sendData
{
    //    NSString *urlString = [NSString stringWithFormat:@"http://%@%@&token=%@", DzhDomain,sendData,[CustomUserDefault getDzhAccessToken]];
    //
    //    return [[[NetWorkRequest shareRequest] getWithUrlString:urlString param:nil] map:^id(NSDictionary* value) {
    //        NSArray* RepDataPaiXu = value[@"Data"][@"RepDataPaiXu"];
    //        NSArray* stkModels = [HYDzhStockModel arrayOfModelsFromDictionaries:RepDataPaiXu error:nil];
    //        return stkModels;
    //    }];
    return [self getStkMsgWithSendData:sendData key:@"RepDataStkData"];
    //    return [[self getDzhMapWithSendData:sendData] map:^id(id value) {
    //        NSArray* RepDataPaiXu = value[@"Data"][@"RepDataStkData"];
    //        NSArray* stkModels = [HYDzhStockModel arrayOfModelsFromDictionaries:RepDataPaiXu error:nil];
    //        return stkModels;
    //    }];
}

+(RACSignal *)getStkMapWithSendData:(NSString *)sendData key:(NSString *)key
{
    return [[self getDzhMapWithSendData:sendData] map:^id(id value) {
        return value[@"Data"][key];
    }];
}

+(RACSignal *)getStkMapWithSendData:(NSString *)sendData
{
    //    NSString *urlString = [NSString stringWithFormat:@"http://%@%@&token=%@", DzhDomain,sendData,[CustomUserDefault getDzhAccessToken]];
    //
    //    return [[[NetWorkRequest shareRequest] getWithUrlString:urlString param:nil] map:^id(NSDictionary* value) {
    //        return value[@"Data"][@"RepDataPaiXu"];
    //    }];
    return [self getStkMapWithSendData:sendData key:@"RepDataStkData"];
    //    return [[self getDzhMapWithSendData:sendData] map:^id(id value) {
    //        return value[@"Data"][@"RepDataStkData"];
    //    }];
}

+(RACSignal *)getDzhMapWithSendData:(NSString *)sendData
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@&token=%@", DzhDomain,sendData,[UserUtils getDzhAccessToken]];
    
    return [[NetworkRequest shareRequest] getWithUrlString:urlString param:nil];
}

-(RACSignal *)getStockInfoWithCode:(NSString *)code field:(NSString *)field
{
    //ShiJian,ZuiXinJia,KaiPanJia,KaiPanJia,ZuiDiJia,ZuiGaoJia,ZuoShou,JunJia,ZhangDie,ZhangFu,ZhenFu,ChengJiaoLiang,XianShou,HuanShou,ZhangTing,DieTing,DieTing,WeiBi,WaiPan,NeiPan,ChengJiaoE,LiuTongAGu,ZongGuBen,ZongShiZhi,LiuTongShiZhi,ShiYingLv,ShiJingLv,ShiFouTingPai,LiangBi,ZhongWenJianCheng,RongZiRongQuanBiaoJi
    NSString *sendData = [NSString stringWithFormat:@"%@/stkdata?obj=%@&orderby=ZhangFu&desc=true&field=%@&token=%@",DzhDomain,code,field,[UserUtils getDzhAccessToken]];
    
    return [[NetworkRequest shareRequest] getWithUrlString:sendData param:nil];
}

-(RACSignal *)getStkDataMsgWithCode:(NSString *)code field:(NSString *)field {
    NSString *sendData = [NSString stringWithFormat:@"%@/stkdata?obj=%@&orderby=ZhangFu&desc=true&field=%@&token=%@",DzhDomain,code,field,[UserUtils getDzhAccessToken]];
    
    return [[[NetworkRequest shareRequest] getWithUrlString:sendData param:nil] map:^id(id value) {
        NSArray* RepDataPaiXu = value[@"Data"][@"RepDataStkData"];
        NSArray* stkModels = [SLDzhStockModel arrayOfModelsFromDictionaries:RepDataPaiXu error:nil];
        return stkModels;
    }];
}

@end
