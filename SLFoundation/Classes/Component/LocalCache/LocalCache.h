//
//  LocalCache.h
//  SLFoundation
//
//  Created by tgtao on 2018/1/31.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface LocalCache : NSObject
@property (nonatomic, strong) UserInfoModel *userModel;

+(instancetype)cache;

+(void)saveUserInfo:(id)userInfo;

@end
