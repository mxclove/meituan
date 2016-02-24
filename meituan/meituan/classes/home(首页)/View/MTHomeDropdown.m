//
//  MTHomeDropdown.m
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTCategory.h"
#import "MTHomeDropdown.h"
#import "MTConst.h"
#import "MTRegion.h"
#import "MTHomeDropdownMainCell.h"
#import "MTHomeDropdownSubCell.h"



@interface MTHomeDropdown() <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;
@property (nonatomic, strong) MTCategory *selectedCategory;
@end

@implementation MTHomeDropdown
+ (instancetype) dropdown
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MTHomeDropdown" owner:nil options:nil] firstObject];
}

- (void)setCategories:(NSArray *)categories
{
    _categories = categories;
    
}
- (void)awakeFromNib
{
    //不要跟随父控件的尺寸变化而伸缩
    self.autoresizingMask = UIViewAutoresizingNone;
}

#pragma mark -实现数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.mainTableView) {
        
        return self.categories.count;
    } else {
        return self.selectedCategory.subcategories.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (tableView == self.mainTableView) {
        cell = [MTHomeDropdownMainCell cellWithTableView:tableView];
        MTCategory *category = self.categories[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:category.small_icon];
        cell.textLabel.text = category.name;
        if (category.subcategories.count) {
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    } else { //从表
        cell = [MTHomeDropdownSubCell cellWithTableView:tableView];
        cell.textLabel.text = self.selectedCategory.subcategories[indexPath.row];
        
    }
    
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.mainTableView) {
        MTCategory *category =  self.categories[indexPath.row];
        self.selectedCategory = category;
        //刷新右边数据
        [self.subTableView reloadData];
            
        
    }
    
}



@end
