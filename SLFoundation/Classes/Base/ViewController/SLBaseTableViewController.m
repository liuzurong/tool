//
//  SLBaseTableViewController.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "SLBaseAdapter.h"

@interface SLBaseTableViewController ()

@end

@implementation SLBaseTableViewController

-(void)loadDataSource
{
    
}
    
#pragma mark - Getter
-(NSMutableArray *)dataSource
{
    if (nil == _dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(UITableView *)tableView
{
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;;
        _tableView.backgroundColor = MainBackGroundColor;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50.f;
    }
    _tableView.delegate = self.adapter;
    _tableView.dataSource = self.adapter;
    
    return _tableView;
}
    
-(SLBaseAdapter *) adapter {
    if (nil == _adapter) {
        _adapter = [[[self class] adapterClass] new];
        _adapter.context = self;
    }
    return _adapter;
}

-(void)addHeaderRefreshView
{
    @weakify(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        self.page = 1;
        [self loadDataSource];
    }];
}

-(void)addFootRefreshView
{
    @weakify(self);
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self loadDataSource];
    }];
}

#pragma mark - Refresh Method
-(void)startRefresh
{
    [self.tableView.mj_header beginRefreshing];
}
    
-(void)endRefresh
{
    [super endRefresh];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    if (_tableView && _tableView.superview) {
        [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.left.equalTo(@0);
            make.bottom.equalTo(self.view);
            make.right.equalTo(self.view);
        }];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.page == 1) {
        [self startRefresh];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    self.page = 1;
}
    
+(Class)adapterClass {
    return [SLBaseAdapter class];
}

-(void)reloadDatas
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
