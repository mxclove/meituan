//
//  MTCitySearchResultViewController.m
//  meituan
//
//  Created by MC on 16/2/24.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTCitySearchResultViewController.h"
#import "MTConst.h"
#import "MTCity.h"
#import "MJExtension.h"
#import "MTMetaTool.h"

@interface MTCitySearchResultViewController ()
@property (nonatomic, strong) NSArray *citySearchResults;
@end

@implementation MTCitySearchResultViewController

- (NSMutableArray *)citySearchResults
{
    if (!_citySearchResults) {
        self.citySearchResults = [NSArray array];
    }
    return _citySearchResults;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 拦截set方法实现以下操作
 通过检索字符检索数据源
 方法1.通过循环遍历数组
 方法2.通过过滤器
 */
- (void)setSearchText:(NSString *)searchText
{
    self.citySearchResults = [NSArray array];
    _searchText = [searchText copy];
    searchText = searchText.lowercaseString;
//    for (MTCity *city in self.cities) {
//        // 城市的name中包含searchtext
//        //城市的pinYin中包含searchtext
//        //城市的pinYinHead包含searchtext
//        if ([city.name containsString:searchText] || [city.pinYin containsString:searchText] || [city.pinYinHead containsString:searchText]) {
//            [self.citySearchResults addObject:city];
//        }
//        
//    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains %@ or pinYin contains %@ or pinYinHead contains %@",searchText, searchText, searchText];
    _citySearchResults = [[MTMetaTool cities] filteredArrayUsingPredicate:predicate];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.citySearchResults.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"共有%d个搜索结果",self.citySearchResults.count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"citySearchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    MTCity *city = self.citySearchResults[indexPath.row];
    cell.textLabel.text = city.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCity *city = _citySearchResults[indexPath.row];
    
    
    [MTNotificationCenter postNotificationName:MTCItyDidChangeNotification object:nil userInfo:@{MTSelectCityName : city.name}];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
