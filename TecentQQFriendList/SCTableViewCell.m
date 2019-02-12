//
//  SCTableViewCell.m
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCTableViewCell.h"

@implementation SCTableViewCell
- (void)setFriend:(SCFriend *)friend{
    _friend = friend;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    if(friend.isVip){
        self.textLabel.textColor = [UIColor redColor];
    }else{
         self.textLabel.textColor = [UIColor blackColor];
    }
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
}
+(instancetype)tableViewCellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"group_cell";
    SCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[SCTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
