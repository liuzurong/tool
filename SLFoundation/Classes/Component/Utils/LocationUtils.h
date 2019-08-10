//
//  LocationUtils.h
//  SLFoundation
//
//  Created by tgtao on 2018/2/3.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationUtils : NSObject

+(NSString *)getDistanceWith:(double)latitude longitude:(double)longitude;
@end
