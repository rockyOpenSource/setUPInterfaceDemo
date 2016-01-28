//
//  WZGBaseViewController.m
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "WZGBaseViewController.h"
#import "SetUpCell.h"
#import "SetUpItem.h"
#import "SetUpGroup.h"
@interface WZGBaseViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation WZGBaseViewController

- (NSMutableArray *)allGroups {
    
    if (_allGroups == nil) {
        
        _allGroups = [NSMutableArray array];
    }
    return _allGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view = tableView;
}

#pragma mark ---- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    SetUpGroup *group = _allGroups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SetUpCell *cell = [SetUpCell setUpCellWithTableView:tableView];
    
    //2, 取出这行对应得模型
    SetUpGroup *group = _allGroups[indexPath.section];
    cell.item = group.items[indexPath.row];

    __block SetUpCell *weakCell = cell;
    
    cell.switchChangeBlock = ^(BOOL on) {
    
        if (weakCell.item.switchBlock) {
            weakCell.item.switchBlock(on);
        }
    };
    return cell;
}

#pragma mark 点击cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    SetUpGroup *group = _allGroups[indexPath.section];
    SetUpItem *item = group.items[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (item.operation) {
        
        item.operation();
    }
}

#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SetUpGroup *group = _allGroups[section];
    
    return group.header;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    SetUpGroup *group = _allGroups[section];
    
    return group.footer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
