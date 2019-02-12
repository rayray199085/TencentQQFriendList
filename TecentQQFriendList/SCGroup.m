//
//  SCGroup.m
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCGroup.h"
@implementation SCGroup

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _online = dictionary[@"online"];
        NSArray *array = dictionary[@"friends"];
        NSMutableArray *tempList = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCFriend *friend = [SCFriend friendWithDictionary:dict];
            [tempList addObject:friend];
        }
        _friends = tempList;
    }
    return self;
}
+(instancetype)groupWithDictionary:(NSDictionary *)dictionary{
    return [[self alloc]initWithDictionary:dictionary];
}
@end
