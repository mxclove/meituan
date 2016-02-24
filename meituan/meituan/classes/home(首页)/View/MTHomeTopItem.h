//
//  MTHomeTopItem.h
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTHomeTopItem : UIView
+ (instancetype)item;

- (void)addTarget:(id)target action:(nonnull SEL)action;


- (void)setTitle:(NSString *)title;
- (void)setSubtitle:(NSString *)subTitle;
- (void)setIcon:(NSString *)icon highIcon:(NSString *)highIcon;
@end
