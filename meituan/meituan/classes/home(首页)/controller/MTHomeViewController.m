//
//  MTHomeViewController.m
//  meituan
//
//  Created by MC on 16/2/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MTHomeViewController.h"
#import "MTConst.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import "MTHomeTopItem.h"
#import "MTCategoryViewController.h"
#import "MTDistrictViewController.h"

@interface MTHomeViewController ()
@property (nonatomic, weak) UIBarButtonItem *categoryItem;
@property (nonatomic, weak) UIBarButtonItem *districtItem;
@property (nonatomic, weak) UIBarButtonItem *sortItem;
@end

@implementation MTHomeViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //对与
//    self.view == self.tableview
//    self.view == self.collectionView.superview
    self.collectionView.backgroundColor = MTGlobalBg;
    
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //监听城市改变
    [MTNotificationCenter addObserver:self selector:@selector(cityChanged:) name:MTCItyDidChangeNotification object:nil];
    

    //设置导航栏内容
    [self setupLeftNav];
    [self setupRightNav];
}

-(void)dealloc
{
    [MTNotificationCenter removeObserver:self];
}

#pragma mark - 监听通知

- (void)cityChanged:(NSNotification *)notification
{
    NSString *cityName = notification.userInfo[MTSelectCityName];
    //更换顶部区域item的名字
    MTHomeTopItem *districtTopItem = (MTHomeTopItem *)_districtItem.customView;
    [districtTopItem setTitle:[NSString stringWithFormat:@"%@ - 全部",cityName]];
    [districtTopItem setSubtitle:@""];
    
    //刷新九宫格数据
#warning TODO
    
}

#pragma mark 设置导航栏左右内容
- (void)setupLeftNav
{
    //1 logo
    UIBarButtonItem *logo = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    logo.enabled = NO;
    //2 类别
    MTHomeTopItem *categoryTopItem = [MTHomeTopItem item];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryTopItem];
    [categoryTopItem addTarget:self action:@selector(categoryClick)];
    self.categoryItem = categoryItem;
    //2 地区
    MTHomeTopItem *districtTopItem = [MTHomeTopItem item];
    UIBarButtonItem *districtItem = [[UIBarButtonItem alloc] initWithCustomView:districtTopItem];
    [districtTopItem addTarget:self action:@selector(districtClick)];
    self.districtItem = districtItem;
    
    //2 排序
    MTHomeTopItem *sortTopItem = [MTHomeTopItem item];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortTopItem];
    [sortTopItem addTarget:self action:@selector(sortClick)];
    self.sortItem = sortItem;
    
    self.navigationItem.leftBarButtonItems = @[logo,categoryItem,districtItem,sortItem];
}

- (void)setupRightNav
{
    UIBarButtonItem *mapItem = [UIBarButtonItem itemWithTarget:nil action:nil image:@"icon_map" highImage:@"icon_map_highlighted"];
    mapItem.customView.width = 60;
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithTarget:nil action:nil image:@"icon_search" highImage:@"icon_search_highlighted"];
    searchItem.customView.width = 60;
    
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
}


#pragma mark - 顶部Item点击方法

- (void) categoryClick
{
    //显示分类菜单
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:[[MTCategoryViewController alloc] init]];
    [popover presentPopoverFromBarButtonItem:self.categoryItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}
- (void) districtClick
{
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:[[MTDistrictViewController alloc] init]];
    [popover presentPopoverFromBarButtonItem:self.districtItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
- (void) sortClick
{
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:[[MTCategoryViewController alloc] init]];
    [popover presentPopoverFromBarButtonItem:self.sortItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    MTLog(@"sortClick");
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
