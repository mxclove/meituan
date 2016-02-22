//
//  MTHomeTopItem.m
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTHomeTopItem.h"

@implementation MTHomeTopItem

+ (instancetype)item
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MTHomeTopItem" owner:nil options:nil] firstObject];
}
@end
