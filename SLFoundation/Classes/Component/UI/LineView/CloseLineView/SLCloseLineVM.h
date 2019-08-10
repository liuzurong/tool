//
//  SLCloseLineVM.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>

@interface SLCloseLineVM : SLBaseAdapter

-(RACSignal *)getKlineByIndexCode:(NSString *)code count:(NSInteger)count;
@end
