//
//  MTHomeDropdownMainCell.m
//  meituan
//
//  Created by MC on 16/2/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTHomeDropdownMainCell.h"

@implementation MTHomeDropdownMainCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"main";
    MTHomeDropdownMainCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTHomeDropdownMainCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
        self.backgroundView = bg;
        UIImageView *selectedbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
        self.backgroundView = selectedbg;
    }
    return self;
}
@end
