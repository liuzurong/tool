//
//  UserInfoModel.h
//  SLFoundation
//
//  Created by tgtao on 2018/1/31.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserInfoModel : JSONModel

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *province;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *token;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *refresh_token;

@property (nonatomic, copy) NSString *openid;

@property (nonatomic, copy) NSString *unionid;
@end
