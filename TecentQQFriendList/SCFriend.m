//
//  SCFriend.m
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCFriend.h"

@implementation SCFriend

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)friendWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
