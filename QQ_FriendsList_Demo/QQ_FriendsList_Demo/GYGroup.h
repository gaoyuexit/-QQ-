//
//  GYGroup.h
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYGroup : NSObject

// 组名
@property (nonatomic,copy)NSString *name;
// 在线人数
@property (nonatomic,assign)int online;
// 当前组中的所有好友数据
@property (nonatomic,strong)NSArray *friends;
// 是否可见
@property (nonatomic,assign,getter = isVisible)BOOL Visible;



- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;



@end
