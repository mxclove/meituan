//
//  MTCategory.h
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCategory : NSObject
@property (nonatomic, copy) NSString *name;
/**
 *  子类别的名称
 */
@property (nonatomic, strong) NSArray *subcategories;
/**
 *  显示在下拉菜单的小图标
 */
@property (nonatomic, copy) NSString *small_highlighted_icon;
@property (nonatomic, copy) NSString *small_icon;

/**
 *  显示在导航栏顶部的大图标
 */
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *highlighted_icon;

/**
 *  显示在地图上的图标
 */
@property (nonatomic, copy) NSString *map_icon;

@end
