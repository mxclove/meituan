//
//  MTNavigationController.m
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTNavigationController.h"

@interface MTNavigationController ()

@end

@implementation MTNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
