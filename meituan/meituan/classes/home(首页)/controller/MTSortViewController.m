//
//  MTSortViewController.m
//  meituan
//
//  Created by MC on 16/2/26.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTSortViewController.h"
#import "MTSort.h"
#import "MTMetaTool.h"
#import "UIView+Extension.h"

@interface MTSortViewController ()
@property (nonatomic, assign) NSInteger selectedButtonNum;
@property (nonatomic, strong) UIButton *selectedButton;
@end

@implementation MTSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat btnw = 100;
    CGFloat btnh = 30;
    CGFloat btnx = 15;
    CGFloat btnStartY = 15;
    
    NSArray *sorts = [MTMetaTool sorts];
    for (NSInteger i  = 0; i < sorts.count; i++) {
        MTSort *sort = sorts[i];
        UIButton *button = [[UIButton alloc] init];
        button.height = btnh;
        button.width = btnw;
        button.x = btnx;
        button.y = btnStartY + (btnh+10) * i;
        button.tag = i;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:sort.label forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(BtnClick: ) forControlEvents:UIControlEventTouchUpInside];
        if (i == _selectedButtonNum) {
            button.selected = YES;
            _selectedButton = button;
            
        }
        [self.view addSubview:button];
    }
    
    self.preferredContentSize = CGSizeMake(btnw+2*20, (btnh+10)*7 + btnStartY);
}

- (void)BtnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    _selectedButtonNum = button.tag;
    button.selected = YES;
    _selectedButton = button;
}


@end
