//
//  MTCityViewController.m
//  meituan
//
//  Created by MC on 16/2/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTCityViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "MJExtension.h"
#import "MTCity.h"
#import "MTCityGroup.h"
#import "Masonry.h"
#import "MTConst.h"
#import "MTCitySearchResultViewController.h"
#import "UIView+AutoLayout.h"

const int MTCoverTag = 99;

@interface MTCityViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *seachBar;
- (IBAction)coverClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cover;
@property (nonatomic, strong) NSArray *cityGroups;
@property (nonatomic, weak) MTCitySearchResultViewController *citySearchResultController;
@end

@implementation MTCityViewController

- (MTCitySearchResultViewController *)citySearchResultController
{
    if (!_citySearchResultController) {
        MTCitySearchResultViewController *citySearchResultController = [[MTCitySearchResultViewController alloc] init];
        [self addChildViewController:citySearchResultController];
        self.citySearchResultController = citySearchResultController;
        
        [self.view addSubview:self.citySearchResultController.view];
        [self.citySearchResultController.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.citySearchResultController.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.seachBar withOffset:15];
    }
    return _citySearchResultController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"切换城市";
    self.tableView.sectionIndexColor = [UIColor blackColor];
    self.seachBar.tintColor = MTColor(48, 190, 180);
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(close) image:@"btn_navigation_close" highImage:@"btn_navigation_close_hl"];
    NSArray *cityGroups = [MTCityGroup objectArrayWithFilename:@"cityGroups.plist"];
    self.cityGroups = cityGroups;
}

- (void) close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 搜索框代理方法
/**
 *  键盘框开始编辑文字
 *
 *  @param searchBar
 */
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //1  隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //2 更换search背景
    self.seachBar.backgroundImage = [UIImage imageNamed:@"bg_login_textfield_hl"];
    //3 显示搜索框右侧的取消按钮
    
    [self.seachBar setShowsCancelButton:YES animated:YES];
    
    //3 显示遮盖
//    UIView *cover = [[UIView alloc] init];
//    cover.backgroundColor = [UIColor redColor];
//    cover.alpha = 0.2;
//    cover.tag = MTCoverTag;
//    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:searchBar action:@selector(resignFirstResponder)]];
//    [self.view addSubview:cover];
    
    [UIView animateWithDuration:1 animations:^{
        
        self.cover.alpha = 0.5;
    }];
    
}
/**
 *  键盘框退出编辑
 *
 *  @param searchBar
 */

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    //1  不隐藏导航栏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //2 更换search背景
    self.seachBar.backgroundImage = [UIImage imageNamed:@"bg_login_textfield"];
    //3 隐藏搜索框右侧的取消按钮
    
    [self.seachBar setShowsCancelButton:NO animated:YES];
    //3 遮盖消失
    [UIView animateWithDuration:1 animations:^{
        
        self.cover.alpha = 0;
    }];
    self.citySearchResultController.view.hidden = YES;
    self.seachBar.text = nil;
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.seachBar resignFirstResponder];
}

/**
 *  搜索框文字改变的时候调用
 *
 */
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length) {
        self.citySearchResultController.view.hidden = NO;
        self.citySearchResultController.searchText = searchText;
    } else {
        self.citySearchResultController.view.hidden = YES;
    }
    
    
}


#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cityGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MTCityGroup *group = self.cityGroups[section];
    return group.cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    MTCityGroup *group = self.cityGroups[indexPath.section];
    cell.textLabel.text = group.cities[indexPath.row];
    return cell;
}

#pragma mark - 代理方法
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MTCityGroup *group = self.cityGroups[section];
    
    return group.title;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    NSMutableArray *array = [NSMutableArray array];
//    for (MTCityGroup *group in self.cityGroups) {
//        [array addObject:group.title];
//    }
//    return array;
    
    
    /**
     *  KVC
     */
    return [self.cityGroups valueForKeyPath:@"title"];
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCityGroup * group = _cityGroups[indexPath.section];
    
    
    [MTNotificationCenter postNotificationName:MTCItyDidChangeNotification object:nil userInfo:@{MTSelectCityName : group.cities[indexPath.row]}];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)coverClick:(id)sender {
    [self.seachBar resignFirstResponder];
}
@end
