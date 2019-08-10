//
//  SLUserDefaults.h
//  SLFoundation
//
//  Created by liuzurong on 2018/4/10.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLUserDefaults : NSObject

+(BOOL)hasObject:(NSString *)key;

+(void)setObject:(id)obj forKey:(NSString *)key;

+(id)getObjectForKey:(NSString *)key;

+(void)removeObjectForKey:(NSString *)key;
@end
