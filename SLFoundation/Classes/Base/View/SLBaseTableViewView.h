//
//  SLBaseTableViewView.h
//  SLFoundation
//
//  Created by tgtao on 2018/3/26.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "SLBaseView.h"

@class SLBaseAdapter, SLBaseVM;
@interface SLBaseTableViewView : SLBaseView<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) SLBaseAdapter *adapter;
@property (nonatomic, strong) SLBaseVM *viewModel;

-(void)loadDataSource;
+(Class)adapterClass;
+(Class)viewModelClass;
@end
