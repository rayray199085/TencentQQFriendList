//
//  SCTableViewController.m
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCTableViewController.h"
#import "SCGroup.h"
#import "SCTableViewCell.h"
#import "SCHeaderView.h"
#import "NSString+SCSizeOfString.h"
@interface SCTableViewController ()<UITableViewDelegate,UITableViewDataSource, SCHeaderViewDelegate>
@property(nonatomic,strong)NSArray *friendGroups;
@end

@implementation SCTableViewController
- (NSArray *)friendGroups{
    if(_friendGroups == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempGroup = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCGroup *group = [SCGroup groupWithDictionary:dict];
            [tempGroup addObject:group];
        }
        _friendGroups = tempGroup;
    }
    return _friendGroups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 44;
}
#pragma mark - hide status bar
- (BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.friendGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {    SCGroup *group = self.friendGroups[section];
    return group.isVisible ? group.friends.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCGroup *group = self.friendGroups[indexPath.section];
    SCFriend *friend = group.friends[indexPath.row];
    SCTableViewCell *cell = [SCTableViewCell tableViewCellWithTableView:tableView];
    cell.friend = friend;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SCGroup *group = self.friendGroups[section];
    SCHeaderView *headerView = [SCHeaderView headerViewWithTableView:tableView];
    headerView.delegate = self;
    headerView.tag = section;
    headerView.group = group;
    return headerView;
}
- (void)refreshTableViewWithHeadView:(SCHeaderView *)headView{
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headView.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
