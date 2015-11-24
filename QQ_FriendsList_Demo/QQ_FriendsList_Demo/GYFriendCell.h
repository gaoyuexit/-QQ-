//
//  GYFriendCell.h
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GYFriend;
@interface GYFriendCell : UITableViewCell

@property (nonatomic,strong)GYFriend *friends;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
