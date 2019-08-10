//
//  SLBaseAdapter.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseAdapter.h"
#import "SLBaseController.h"
#import "SLBaseCell.h"

@implementation SLBaseAdapter
-(instancetype)init {
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

-(void)initData {
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [SLBaseCell constructorCell:tableView indexPath:indexPath];
}

#pragma mark - UITableViewDelegate

@end
