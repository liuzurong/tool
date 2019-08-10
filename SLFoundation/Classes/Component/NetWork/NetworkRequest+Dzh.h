//
//  NetworkRequest+Dzh.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "NetworkRequest.h"
typedef enum
{
    kLineType1Min,
    kLineType5Min,
    kLineType15Min,
    kLineType30Min,
    kLineType60Min,
    kLineType120Min,
    kLineType1Day,
    kLineType1Week,
    kLineType1Month,
    kLineTypeNone
}kLineType;

typedef enum
{
    kLineDRTypeFDR,//前复权  forward adjusted price
    kLineDRTypeBDR,//后复权 backward adjusted price
    kLineDRTypeDR,//除权 exit divident and right
}kLineDRType;//除权类型

@interface NetworkRequest (Dzh)

-(RACSignal *)getKlineDataWithCode:(NSString *)sCode;
-(RACSignal *)getKlineDataWithCode:(NSString *)sCode count:(NSInteger)count;
-(RACSignal *)getKlineDataWithCode:(NSString *)sCode count:(NSInteger)count endTime:(NSString *)beginTime;
//-(RACSignal *)getKlineDataWithCode:(NSString *)sCode kLineType:(kLineType)kLineType drKLineType:(kLineDRType)drKLineType;
-(RACSignal *)getKlineDataWithCode:(NSString *)sCode kLineType:(kLineType)kLineType drKLineType:(kLineDRType)drKLineType count:(NSInteger)count;

+(RACSignal *)getDzhMapWithSendData:(NSString *)sendData;
-(RACSignal *)getStockInfoWithCode:(NSString *)code field:(NSString *)field;
-(RACSignal *)getStkDataMsgWithCode:(NSString *)code field:(NSString *)field;

+(RACSignal *)getStkMsgWithSendData:(NSString *)sendData;
+(RACSignal *)getStkMapWithSendData:(NSString *)sendData;
+(RACSignal *)getStkMsgWithSendData:(NSString *)sendData key:(NSString *)key;
+(RACSignal *)getStkMapWithSendData:(NSString *)sendData key:(NSString *)key;
@end
