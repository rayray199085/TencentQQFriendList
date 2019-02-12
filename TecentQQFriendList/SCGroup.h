//
//  SCGroup.h
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCFriend.h"
NS_ASSUME_NONNULL_BEGIN

@interface SCGroup : NSObject
@property(nonatomic,strong)NSArray *friends;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSNumber *online;
@property(nonatomic,assign,getter=isVisible)BOOL visible;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
+(instancetype)groupWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
