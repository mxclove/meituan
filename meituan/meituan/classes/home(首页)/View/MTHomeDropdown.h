//
//  MTHomeDropdown.h
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTHomeDropdown;
//@protocol MTHomeDropdownData <NSObject>
//
//- (NSString *)tital;
//- (NSString *)icon;
//- (NSString *)selectedIcon;
//- (NSArray *)subData;
//
//@end
@protocol MTHomeDropdownDataSource <NSObject>
/**
 *  左边的表格一共有多少行
 *
 */
- (NSInteger)numberOfRowsInMainTable:(MTHomeDropdown *)homeDropdown;
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown titleForRowInMainTable:(int)row;
- (NSArray *)homeDropdown:(MTHomeDropdown *)homeDropdown subDataForRowInMainTable:(int)row;
@optional
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown iconForRowInMainTable:(int)row;
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown selectedIconForRowInMainTable:(int)row;


@end



@interface MTHomeDropdown : UIView
+ (instancetype) dropdown;
@property (nonatomic, weak) id dataSource;
//@property (nonatomic, strong) NSArray *categories;


@end
