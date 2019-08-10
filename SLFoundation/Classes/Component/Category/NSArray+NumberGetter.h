//
//  NSArray+NumberGetter.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (NumberGetter)
-(NSInteger)getIntegerAtIndex:(int)index;
-(double)getDoubleAtIndex:(int)index;
-(long long)getLongLongAtIndex:(int)index;
@end
