//
//  GYGroupHeaderView.m
//  QQ_FriendsList_Demo
//
//  Created by 郜宇 on 15/11/3.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "GYGroupHeaderView.h"
#import "GYGroup.h"
@interface GYGroupHeaderView ()

@property (nonatomic,weak)UIButton *nameBtn;
@property (nonatomic,weak)UILabel *countLabel;
@end


@implementation GYGroupHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"HeaderView";
    GYGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[GYGroupHeaderView alloc] initWithReuseIdentifier:ID];
    }
//    headerView.contentView.backgroundColor = [UIColor redColor];
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [nameBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [nameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        //设置按钮内容整体左对齐
        nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置按钮的整体的内边距
        nameBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置按钮标题的左边距
        nameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [nameBtn addTarget:self action:@selector(nameBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //设置按钮的显示模式(防止旋转后,按钮被拉伸)
        nameBtn.imageView.contentMode = UIViewContentModeCenter;
        //设置按钮图片超出部分,不要被截掉(默认为截掉)
        nameBtn.imageView.clipsToBounds = NO;
        
        [self addSubview:nameBtn];
        self.nameBtn = nameBtn;
        UILabel *countLabel = [[UILabel alloc] init];
        [self addSubview:countLabel];
        self.countLabel = countLabel;
    }
    return self;
}
//按钮的点击事件
- (void)nameBtnClick
{
    //设置组的状态
    self.group.Visible = !self.group.isVisible;
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(groupHeaderViewDidClick:)]) {
        [self.delegate groupHeaderViewDidClick:self];
    }
    
    //设置小三角旋转
    //在这里设置不对,这里设置的话,上面的代理方法,会刷新tableView会将控件重新加载,旋转就没有了
    //刷新的时候会移除所有控件,然后重新加载,所以HearderView也被移除了,重新加载
    //所以我们在didMoveToSuperview方法中,加载完HearderView再进行旋转
}

// 当一个新的HearderView已经加到某个父控件中的时候执行
- (void)didMoveToSuperview
{
    if (self.group.isVisible) {//展开
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}




- (void)setGroup:(GYGroup *)group
{
    _group = group;
    //设置数据
    [self.nameBtn setTitle:group.name forState:UIControlStateNormal];
    self.countLabel.text = [NSString stringWithFormat:@"%d / %lu",group.online,group.friends.count];
    
#pragma mark --- 这里设置frame是,self.bounds为0,我们要在layoutSubviews中设置
    //设置frame
//    self.nameBtn.frame = self.bounds;
//    CGFloat lblW = 100;
//    CGFloat lblH = self.frame.size.height;
//    CGFloat lblX = self.bounds.size.width - 10 - lblW;
//    CGFloat lblY = 0;
//    self.countLabel.frame = CGRectMake(lblX, lblY, lblW, lblH);
    
    
    //因为重用问题,我们在拿到每一个新的HeaderView的时候,要判断图片是否要要向下还是向右
    if (self.group.isVisible) {//展开
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
    
    
}

// 当当前控件的frame发生改变的时候会调用这个方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nameBtn.frame = self.bounds;
    CGFloat lblW = 100;
    CGFloat lblH = self.frame.size.height;
    CGFloat lblX = self.bounds.size.width - 10 - lblW;
    CGFloat lblY = 0;
    self.countLabel.frame = CGRectMake(lblX, lblY, lblW, lblH);
    
}



@end
