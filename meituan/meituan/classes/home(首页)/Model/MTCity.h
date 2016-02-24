//
//  MTCity.h
//  meituan
//
//  Created by MC on 16/2/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTRegion.h"

@interface MTCity : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pinYin;
@property (nonatomic, copy) NSString *pinYinHead;
@property (nonatomic, strong) NSArray *regions;


@end
