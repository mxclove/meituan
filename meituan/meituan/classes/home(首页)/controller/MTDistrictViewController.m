//
//  MTDistrictViewController.m
//  meituan
//
//  Created by MC on 16/2/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTDistrictViewController.h"
#import "MTHomeDropdown.h"
#import "Masonry.h"
#import "UIView+Extension.h"
#import "MTCityViewController.h"
#import "MTNavigationController.h"

@interface MTDistrictViewController ()
- (IBAction)changeCity;


@end

@implementation MTDistrictViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建下拉菜单
    MTHomeDropdown *dropdown = [MTHomeDropdown dropdown];
    UIView *title = [self.view.subviews firstObject];
    dropdown.y = title.height;
    [self.view addSubview:dropdown];
    self.preferredContentSize = CGSizeMake(dropdown.width, CGRectGetMaxY(dropdown.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 切换城市
*/

- (IBAction)changeCity {
    MTCityViewController *cityController = [[MTCityViewController alloc] init];
    MTNavigationController *nav = [[MTNavigationController alloc] initWithRootViewController:cityController];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
}


@end
