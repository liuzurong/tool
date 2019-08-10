//
//  SLCloseLineVM.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLCloseLineVM.h"

@implementation SLCloseLineVM

-(RACSignal *)getKlineByIndexCode:(NSString *)code count:(NSInteger)count
{
    return [[[NetworkRequest shareRequest] getKlineDataWithCode:code count:count] map:^id(NSDictionary* value) {
        NSArray *datas = nil;
        @try {
            datas = value[@"Data"][@"JsonTbl"][@"data"][0][0][@"data"][0][1][@"data"];
        } @catch (NSException *exception) {
            
        } @finally {
            return datas;
        }
    }];
}
@end
