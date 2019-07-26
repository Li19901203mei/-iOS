//
//  AppDelegate.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/3/13.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "AppDelegate.h"
#import "BeeCloud.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainTabbarViewController *mainVC = [[MainTabbarViewController alloc]init];
    self.window.rootViewController = mainVC;
    mainVC.selectedIndex = 0;
    [self.window makeKeyWindow];
    
    [NSThread sleepForTimeInterval:1];
    [UITabBar appearance].translucent = NO;
    
    [BeeCloud initWithAppID:@"a00dcbe7-782a-475e-b51b-23c7cdee40f0" andAppSecret:@"dabeb2a0-fb73-4eb7-9fe8-1d49a0b20219"];
    //初始化微信官方APP支付
    //此处的微信appid必须是在微信开放平台创建的移动应用的appid，且必须与在『BeeCloud控制台-》微信APP支付』配置的"应用APPID"一致，否则会出现『跳转到微信客户端后只显示一个确定按钮的现象』。
    [BeeCloud initWeChatPay:@"wx028de10dec21e271"];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
