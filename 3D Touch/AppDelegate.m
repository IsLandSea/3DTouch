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
        
        return NO;
    }

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/** 处理shortcutItem */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
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
