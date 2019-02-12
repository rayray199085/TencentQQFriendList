//
//  SCHeaderView.h
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCGroup.h"
@class SCHeaderView;
NS_ASSUME_NONNULL_BEGIN
@protocol SCHeaderViewDelegate <NSObject>
@required
-(void)refreshTableViewWithHeadView:(SCHeaderView *)headView;
@end
@interface SCHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong)SCGroup *group;
@property(nonatomic,weak)id<SCHeaderViewDelegate> delegate;
+(instancetype)headerViewWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
