//
//  MTCategoryViewController.m
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//  

#import "MTCategoryViewController.h"
#import "MTHomeDropdown.h"
#import "MTCategory.h"
#import "UIView+Extension.h"
#import "MJExtension.h"
#import "MTMetaTool.h"

@interface MTCategoryViewController () <MTHomeDropdownDataSource>

@end

@implementation MTCategoryViewController
- (void)loadView
{
    /**
     *  加载分类数据
     */

    MTHomeDropdown *dropdown = [MTHomeDropdown dropdown];
    
    /**
     *  自动布局
     */
//    [dropdown mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(300);
//        make.height.mas_equalTo(340);
//    }];
    
    dropdown.dataSource = self;
    self.view = dropdown;
    
    //设置控制器view在popover中的尺寸
    self.preferredContentSize = dropdown.size;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - MTHomeDropdownDataSource
- (NSInteger)numberOfRowsInMainTable:(MTHomeDropdown *)homeDropdown
{
    return [MTMetaTool categoties].count;
}

- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown titleForRowInMainTable:(int)row
{
    MTCategory *category= [MTMetaTool categoties][row];
    return category.name;
}
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown iconForRowInMainTable:(int)row
{
    MTCategory *category= [MTMetaTool categoties][row];
    return category.small_icon;
}
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown selectedIconForRowInMainTable:(int)row
{
    MTCategory *category= [MTMetaTool categoties][row];
    return category.small_highlighted_icon;
}

- (NSArray *)homeDropdown:(MTHomeDropdown *)homeDropdown subDataForRowInMainTable:(int)row
{
    MTCategory *category= [MTMetaTool categoties][row];
    return category.subcategories;
}


@end
