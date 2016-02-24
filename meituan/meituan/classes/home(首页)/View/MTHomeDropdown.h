//
//  MTHomeDropdown.h
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTHomeDropdown : UIView
+ (instancetype) dropdown;
@property (nonatomic, strong) NSArray *categories;
@end
