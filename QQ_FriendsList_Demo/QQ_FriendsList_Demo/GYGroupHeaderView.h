//
//  GYGroupHeaderView.h
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GYGroup;
@class GYGroupHeaderView;
@protocol GYGroupHeaderViewDelelgate <NSObject>
@optional
- (void)groupHeaderViewDidClick:(GYGroupHeaderView *)groupHeaderView;

@end





@interface GYGroupHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong)GYGroup *group;
//控件的代理用weak
@property (nonatomic,weak)id<GYGroupHeaderViewDelelgate>delegate;
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
