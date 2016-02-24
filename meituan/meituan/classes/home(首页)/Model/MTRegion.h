//
//  MTRegion.h
//  meituan
//
//  Created by MC on 16/2/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTRegion : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray *subregions;
@end
