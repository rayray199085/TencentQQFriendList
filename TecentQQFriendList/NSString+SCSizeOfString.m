//
//  NSString+SCSizeOfString.m
//  TecentQQFriendList
//
//  Created by Stephen Cao on 12/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "NSString+SCSizeOfString.h"

@implementation NSString (SCSizeOfString)
-(CGRect)calculateSize:(CGSize)size andWithFont:(UIFont *)font{
    NSDictionary *dict = @{NSFontAttributeName :font};
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
}
@end
