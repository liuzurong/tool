//
//  NSArray+NumberGetter.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "NSArray+NumberGetter.h"

@implementation NSArray (NumberGetter)

-(NSInteger)getIntegerAtIndex:(int)index
{
    if (self.count > index) {
        if ([self[index] isEqual:[NSNull null]]) {
            return 0.f;
        }
        return [self[index] integerValue];
    }
    return 0;
}

-(double)getDoubleAtIndex:(int)index
{
    if (self.count > index) {
        if ([self[index] isEqual:[NSNull null]]) {
            return 0.f;
        }
        return [self[index] doubleValue];
    }
    return 0.f;
}

-(long long)getLongLongAtIndex:(int)index
{
    if (self.count > index) {
        if ([self[index] isEqual:[NSNull null]]) {
            return 0.f;
        }
        return [self[index] longLongValue];
    }
    return 0;
}
@end
