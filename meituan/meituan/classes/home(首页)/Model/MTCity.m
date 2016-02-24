//
//  MTCity.m
//  meituan
//
//  Created by MC on 16/2/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTCity.h"
#import "MJExtension.h"
#import "MTRegion.h"

@implementation MTCity
- (NSDictionary *)objectClassInArray
{
    return @{@"regions" : [MTRegion class]};
}
@end
