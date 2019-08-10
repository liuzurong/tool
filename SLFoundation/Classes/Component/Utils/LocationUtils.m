//
//  LocationUtils.m
//  SLFoundation
//
//  Created by tgtao on 2018/2/3.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "LocationUtils.h"

@implementation LocationUtils

+(NSString *)getDistanceWith:(double)latitude longitude:(double)longitude {
    double localLatitude = [[[NSUserDefaults standardUserDefaults] valueForKey:@"locationx"] doubleValue];
    double localLongitude = [[[NSUserDefaults standardUserDefaults] valueForKey:@"locationY"] doubleValue];
    CLLocation *orig= [[CLLocation alloc] initWithLatitude: localLatitude  longitude:localLongitude] ;
    CLLocation* dist=[[CLLocation alloc] initWithLatitude:latitude  longitude:longitude] ;
    CLLocationDistance kilometers=[orig distanceFromLocation:dist]/1000;
    NSString *kilometer =  [NSString stringWithFormat:@"%.1f",kilometers];
    return  kilometer;
}
@end
