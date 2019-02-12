//
//  SCTableViewCell.h
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCFriend.h"
NS_ASSUME_NONNULL_BEGIN

@interface SCTableViewCell : UITableViewCell
@property(nonatomic,strong)SCFriend *friend;
+(instancetype)tableViewCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
