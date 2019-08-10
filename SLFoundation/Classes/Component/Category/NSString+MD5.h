//
//  NSString+MD5.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
- (NSString *)getMd5_32Bit;
+ (NSString *)base64EncodedStringFrom:(NSData *)data;
@end
