//
//  SLBaseAdapter.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLBaseController;
@interface SLBaseAdapter : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) NSMutableArray *dataSource;
@property (nonatomic, weak) SLBaseController *context;
-(void)initData;
@end
