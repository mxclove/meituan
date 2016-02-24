//
//  MTHomeTopItem.m
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTHomeTopItem.h"

@interface MTHomeTopItem()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end


@implementation MTHomeTopItem

+ (instancetype)item
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MTHomeTopItem" owner:nil options:nil] firstObject];
}
- (void)setIcon:(NSString *)icon highIcon:(NSString *)highIcon
{
    [self.iconButton setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [self.iconButton setImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
}
- (void)setSubtitle:(NSString *)subTitle
{
    self.subTitleLabel.text = subTitle;
}
-(void)setTitle:(NSString *)title
{
 
    self.titleLabel.text = title;
}
- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
}

/*
 设置监听的监听器
 target 监听器
 action 监听方法
 */
- (void)addTarget:(id)target action:(nonnull SEL)action
{
    [self.iconButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
