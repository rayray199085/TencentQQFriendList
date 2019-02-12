//
//  NSString+SCSizeOfString.h
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (SCSizeOfString)
-(CGRect)calculateSize:(CGSize)size andWithFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
