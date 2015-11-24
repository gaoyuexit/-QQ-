//
//  GYFriend.h
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYFriend : NSObject
// 头像
@property (nonatomic,copy)NSString *icon;
// 昵称
@property (nonatomic,copy)NSString *name;
// 个性签名
@property (nonatomic,copy)NSString *intro;
// 是否是vip
@property (nonatomic,assign,getter = isVip)BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendWithDict:(NSDictionary *)dict;




@end
