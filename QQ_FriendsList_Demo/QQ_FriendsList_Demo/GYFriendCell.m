//
//  GYFriendCell.m
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "GYFriendCell.h"
#import "GYFriend.h"
@implementation GYFriendCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"FriendCell";
    GYFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[GYFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setFriends:(GYFriend *)friends
{
    _friends = friends;
    self.imageView.image = [UIImage imageNamed:friends.icon];
    self.textLabel.text = friends.name;
    self.detailTextLabel.text = friends.intro;
    //设置是否为会员
    self.textLabel.textColor = friends.isVip ? [UIColor redColor] : [UIColor blackColor];
    
}
@end
