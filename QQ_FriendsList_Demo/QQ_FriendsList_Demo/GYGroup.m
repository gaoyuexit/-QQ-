//
//  GYGroup.m
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "GYGroup.h"
#import "GYFriend.h"
@implementation GYGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //将盛放字典的数组转换为模型数组
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dict_sub in self.friends) {
            GYFriend *friend = [GYFriend friendWithDict:dict_sub];
            [modelArray addObject:friend];
        }
        self.friends = modelArray;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
