//
//  SCFriend.h
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCFriend : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign,getter=isVip)BOOL vip;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
