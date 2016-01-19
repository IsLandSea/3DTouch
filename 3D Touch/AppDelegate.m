//
//  AppDelegate.m
//  3D Touch
//
//  Created by IsLand on 15/10/9.
//  Copyright © 2015年 IsLand. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@property (nonatomic,strong) ViewController *vc;
@property (nonatomic,strong) UIApplicationShortcutItem *currentItem;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
     当程序启动时
     
     1、判断launchOptions字典内的UIApplicationLaunchOptionsShortcutItemKey是否为空
     2、当不为空时,application:didFinishLaunchWithOptions方法返回NO，否则返回YES
     3、在application:performActionForShortcutItem:completionHandler方法内处理点击事件
     */
    
    [self creatUIApplicationShortcutItems];
    
    if (launchOptions[@"UIApplicationLaunchOptionsShortcutItemKey"] == nil) {
        
        return YES;
        
    } else {
        
        _currentItem = launchOptions[UIApplicationLaunchOptionsShortcutItemKey];
        
        return NO;
    }
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    if (_currentItem) {
        [self handleShortcartItem:_currentItem];
        _currentItem = nil;
    }
    
}
/** 处理shortcutItem */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    [self handleShortcartItem:shortcutItem];
    
}
- (void)handleShortcartItem:(UIApplicationShortcutItem *)shortcutItem {
    
    
    if ([shortcutItem.type isEqualToString:@"first"])
    {
        
        NSLog(@"doSomeThing");
        
    }else if ([shortcutItem.type isEqualToString:@"second"]) {
        
        NSLog(@"doSomething");
        
    }
    
}
-(void)creatUIApplicationShortcutItems
{
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"gouwuche"];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"gouwuche"];
    
    
    //创建快捷item的userinfo 即UIApplicationShortcutItemUserInfo
    
    NSDictionary *info1 = @{@"url":@"money"};
    
    //创建ShortcutItem
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"first" localizedTitle:@"大标题" localizedSubtitle:@"小标题" icon:icon1 userInfo:info1];
    
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"second" localizedTitle:@"大标题" localizedSubtitle:@"小标题" icon:icon2 userInfo:info1];
    
    NSArray *items = @[item1,item2];
    
    [UIApplication sharedApplication].shortcutItems = items;
    
}
-(void)actionWithShortcutItem:(UIApplicationShortcutItem *)item
{
    if (item.userInfo)
    {
        NSLog(@"%@",item.userInfo[@"url"]);
    }
}
@end
