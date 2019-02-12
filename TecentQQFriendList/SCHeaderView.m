//
//  SCHeaderView.m
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCHeaderView.h"
@interface SCHeaderView()
@property(nonatomic,weak)UIButton *groupNameBtn;
@property(nonatomic,weak)UILabel *groupOnlineCount;
@end
@implementation SCHeaderView
// this method would be called when the frame of header view change
- (void)layoutSubviews{
    [super layoutSubviews];
    [_groupNameBtn setTitle:_group.name forState:UIControlStateNormal];
    [_groupNameBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _groupNameBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _groupNameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [_groupNameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
     [_groupNameBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
    [_groupNameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_groupNameBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _groupNameBtn.imageView.contentMode = UIViewContentModeCenter;
    _groupNameBtn.imageView.clipsToBounds = NO;
    
    if(_group.isVisible){
        _groupNameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _groupNameBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
    _groupOnlineCount.text = [NSString stringWithFormat:@"%d/%lu",_group.online.intValue,_group.friends.count];
    _groupNameBtn.frame = self.bounds;
    _groupOnlineCount.textAlignment = NSTextAlignmentRight;
    _groupOnlineCount.frame = CGRectMake(self.frame.size.width - 110, 0, 100, self.frame.size.height);
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        UIButton *button = [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        self.groupNameBtn = button;
        UILabel *label = [[UILabel alloc]init];
        [self.contentView addSubview:label];
        self.groupOnlineCount = label;
    }
    return self;
}
+(instancetype)headerViewWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"header_view";
    SCHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if(headerView == nil){
        headerView = [[SCHeaderView alloc]initWithReuseIdentifier:identifier];
    }
    return headerView;
}
-(void)buttonClick:(UIButton *)button{
    _group.visible = ! _group.isVisible;
    if([self.delegate respondsToSelector:@selector(refreshTableViewWithHeadView:)]){
        [self.delegate refreshTableViewWithHeadView:self];
    }
}
@end
