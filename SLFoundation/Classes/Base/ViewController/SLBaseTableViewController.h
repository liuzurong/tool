//
//  SLBaseTableViewController.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseController.h"
#import "SLBaseAdapter.h"

@interface SLBaseTableViewController : SLBaseController
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) SLBaseAdapter *adapter;

+(Class)adapterClass;
-(void)loadDataSource;
-(void)endRefresh;

-(void)addHeaderRefreshView;
-(void)addFootRefreshView;
-(void)startRefresh;
@end
