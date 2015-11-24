//
//  QQFriendsListController.m
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "QQFriendsListController.h"
#import "GYGroup.h"
#import "GYFriendCell.h"
#import "GYFriend.h"
#import "GYGroupHeaderView.h"
@interface QQFriendsListController ()<GYGroupHeaderViewDelelgate>

// 保存所有的朋友信息(分组信息)
@property (nonatomic,strong)NSArray *groups;
@end

@implementation QQFriendsListController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    GYGroup *group = self.groups[section];
    
    if (group.isVisible) { //可见
        return group.friends.count;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GYGroup *group = self.groups[indexPath.section];
    GYFriend *friend = group.friends[indexPath.row];
    GYFriendCell *cell = [GYFriendCell cellWithTableView:tableView];
    cell.friends = friend;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    //为GYGroup模型增加一个用来保存"是否为展开"状态的属性
    
    GYGroup *group = self.groups[section];
    GYGroupHeaderView *headerView = [GYGroupHeaderView headerViewWithTableView:tableView];
    headerView.group = group;
    headerView.delegate = self;
    //headerView记录为第几组
    headerView.tag = section;
    return headerView;
}
#pragma mark -- GYGroupHeaderViewDelelgate
- (void)groupHeaderViewDidClick:(GYGroupHeaderView *)groupHeaderView
{
    //全部刷新浪费资源,我们使用局部刷新,只刷新某个组
//    [self.tableView reloadData];
    //indexSet 表示组  indexSetWithIndex:根据第几组来判断为哪一组
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    
}




#pragma mark -- 懒加载
- (NSArray *)groups
{
    if (!_groups) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            GYGroup *group = [GYGroup groupWithDict:dict];
            [modelArray addObject:group];
        }
        _groups = modelArray;
    }
    return _groups;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}







@end
