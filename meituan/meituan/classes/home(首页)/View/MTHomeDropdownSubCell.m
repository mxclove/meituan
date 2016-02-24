//
//  MTHomeDropdownSubCell.m
//  meituan
//
//  Created by MC on 16/2/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTHomeDropdownSubCell.h"

@implementation MTHomeDropdownSubCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"sub";
    MTHomeDropdownSubCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTHomeDropdownSubCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
        self.backgroundView = bg;
        UIImageView *selectedbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        self.backgroundView = selectedbg;
    }
    return self;
}
@end
