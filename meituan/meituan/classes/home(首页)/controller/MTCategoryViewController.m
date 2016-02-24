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

@interface MTCategoryViewController ()

@end

@implementation MTCategoryViewController
- (void)loadView
{
    /**
     *  加载分类数据
     */

    NSArray *categoryies = [MTCategory objectArrayWithFilename:@"categories.plist"];
    MTHomeDropdown *dropdown = [MTHomeDropdown dropdown];
    
    /**
     *  自动布局
     */
//    [dropdown mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(300);
//        make.height.mas_equalTo(340);
//    }];
    
    dropdown.categories = categoryies;
    self.view = dropdown;
    
    //设置控制器view在popover中的尺寸
    self.preferredContentSize = dropdown.size;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}



@end
