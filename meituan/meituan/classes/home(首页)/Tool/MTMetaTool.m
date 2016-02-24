//
//  MTMetaTool.m
//  meituan
//
//  Created by MC on 16/2/24.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTMetaTool.h"
#import "MTCity.h"
#import "MJExtension.h"

@implementation MTMetaTool
static NSArray *_cities;
+ (NSArray *)cities
{
    if (_cities == nil) {
        _cities = [MTCity objectArrayWithFilename:@"cities.plist"];
    }
    return _cities;
}
@end
