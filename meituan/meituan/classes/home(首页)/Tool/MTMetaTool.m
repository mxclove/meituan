//
//  MTMetaTool.m
//  meituan
//
//  Created by MC on 16/2/24.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTMetaTool.h"
#import "MTCity.h"
#import "MTCategory.h"
#import "MJExtension.h"
#import "MTSort.h"

@implementation MTMetaTool
static NSArray *_cities;
+ (NSArray *)cities
{
    if (_cities == nil) {
        _cities = [MTCity objectArrayWithFilename:@"cities.plist"];
    }
    return _cities;
}

static NSArray *_categoties;
+ (NSArray *)categoties
{
    if (_categoties == nil) {
        _categoties = [MTCategory objectArrayWithFilename:@"categories.plist"];
    }
    return _categoties;
}

static NSArray *_sorts;
+ (NSArray *)sorts
{
    if (_sorts == nil) {
        _sorts = [MTSort objectArrayWithFilename:@"sorts.plist"];
    }
    return _sorts;
}
@end
