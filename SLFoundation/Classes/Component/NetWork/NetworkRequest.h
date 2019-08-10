//
//  NetWorkRequest.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkConstants.h"
#import <ReactiveObjC/ReactiveObjC.h>

typedef enum {
    DomainTypeNormal,
}DomainType;
@interface NetworkRequest : NSObject
+(instancetype)shareRequest;
- (NSString *)cachePathForUrl:(NSString *)url;
-(void)removeCacheWithUrl:(NSString *)url;
-(RACSignal *)getWithMethod:(NSString *)method param:(id)param;
-(RACSignal *)getWithMethod:(NSString *)method param:(id)param type:(DomainType)type;
-(RACSignal *)getWithMethod:(NSString *)method param:(id)param shouldArchive:(BOOL)bArchive;
-(RACSignal *)getWithMethod:(NSString *)method param:(id)param shouldArchive:(BOOL)bArchive type:(DomainType)type;
-(RACSignal *)postWithMethod:(NSString *)method param:(id)param;
-(RACSignal *)postWithMethod:(NSString *)method param:(id)param type:(DomainType)type;
-(RACSignal *)deleteWithMethod:(NSString *)method param:(id)param;
-(RACSignal *)deleteWithMethod:(NSString *)method param:(id)param type:(DomainType)type;
-(RACSignal *)putWithMethod:(NSString *)method param:(id)param;
-(RACSignal *)getWithUrlString:(NSString *)urlString param:(id)param;
-(RACSignal *)postWithUrlString:(NSString *)urlString param:(id)param;

-(RACSignal *)getJ2tWithMethod:(NSString *)method param:(id)param;
-(RACSignal *)postJ2tWithMethod:(NSString *)method param:(id)param;
- (RACSignal *)uploadWithMethod:(NSString *)method image:(UIImage *)image;//上传图片

//大智慧
-(RACSignal *)getDzhAccessToken;
-(void)updateDzhToken;
@end
