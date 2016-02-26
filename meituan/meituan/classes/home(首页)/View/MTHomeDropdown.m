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
@property (nonatomic, assign) NSInteger selectMainRow;
@end

@implementation MTHomeDropdown
+ (instancetype) dropdown
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MTHomeDropdown" owner:nil options:nil] firstObject];
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
        
        return [self.dataSource numberOfRowsInMainTable:self];
    } else {
        return [self.dataSource homeDropdown:self subDataForRowInMainTable:self.selectMainRow].count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (tableView == self.mainTableView) {
        cell = [MTHomeDropdownMainCell cellWithTableView:tableView];
        if ([self.dataSource respondsToSelector:@selector(homeDropdown:iconForRowInMainTable:)]){
            cell.imageView.image = [UIImage imageNamed:[self.dataSource homeDropdown:self iconForRowInMainTable:indexPath.row]];
        }
        if ([self.dataSource respondsToSelector:@selector(homeDropdown:selectedIconForRowInMainTable:)]){
            cell.imageView.highlightedImage = [UIImage imageNamed:[self.dataSource homeDropdown:self selectedIconForRowInMainTable:indexPath.row]];
        }
        cell.textLabel.text = [self.dataSource homeDropdown:self titleForRowInMainTable:indexPath.row];
        if ([self.dataSource homeDropdown:self subDataForRowInMainTable:indexPath.row].count) {
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    } else { //从表
        cell = [MTHomeDropdownSubCell cellWithTableView:tableView];
        cell.textLabel.text = [self.dataSource homeDropdown:self subDataForRowInMainTable:self.selectMainRow][indexPath.row];
        
    }
    
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.mainTableView) {
        self.selectMainRow = indexPath.row;
        //刷新右边数据
        [self.subTableView reloadData];
            
        
    }
    
}



@end
