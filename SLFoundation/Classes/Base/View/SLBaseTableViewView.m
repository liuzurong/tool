//
//  SLBaseTableViewView.m
//  SLFoundation
//
//  Created by tgtao on 2018/3/26.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "SLBaseTableViewView.h"
#import "SLBaseAdapter.h"
#import "SLBaseVM.h"

@implementation SLBaseTableViewView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tableView];
    }
    return self;
}

-(void)loadDataSource {
    
}

#pragma mark - Getter
-(UITableView *)tableView {
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self.adapter;
        _tableView.dataSource = self.adapter;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSMutableArray *)dataSource {
    if (nil == _dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataSource;
}

+(Class)adapterClass {
    return [SLBaseAdapter class];
}

+(Class)viewModelClass {
    return [SLBaseVM class];
}

-(SLBaseAdapter *)adapter {
    if (nil == _adapter) {
        _adapter = [[[self class] adapterClass] new];
    }
    return _adapter;
}

-(SLBaseVM *)viewModel {
    if (nil == _viewModel) {
        _viewModel = [[[self class] viewModelClass] new];
    }
    return _viewModel;
}

#pragma mark - method
-(void)layoutSubviews {
    [super layoutSubviews];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(@0);
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
