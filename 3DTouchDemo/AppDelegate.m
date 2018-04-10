//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by shenyanlong on 2018/4/11.
//  Copyright © 2018年 shenyanlong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    /**
     3D Touch 有三大模块:
     1.Home Screen Quick Actions 通过主屏幕的应用Icon,我们可以用3D Touch 呼出一个菜单,进行快速定位应用功能模块相关功能的开发.
     2.peek and pop 类似于系统邮件,QQ这样的APP,在消息列表页面按压某条邮件或会话,则会弹出这个邮件或会话的阅览,如果继续施加压力按压,则会弹出完整的邮件详情页面或会话对话框.
     3.Force Properties iOS9 为我们提供一个新的交互参数:力度,我么可以检测某一交互 的力度值,例如,我么可以通过力度来控制快进的快慢,音量增加的快慢等.
     */
    //创建3DTouch标签
    [self create3DTouchItems];
    //(程序不在后台)如果从快捷选项标签启动APP,则根据不同的标识执行不同的操作,然后返回NO,防止再次调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
    //获取启动原因
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (shortcutItem)
    {
        //判断从哪个标签进入应用程序
        if ([shortcutItem.type isEqualToString:@"A"])
        {
            self.window.rootViewController.view.backgroundColor = [UIColor cyanColor];
        }
        else if ([shortcutItem.type isEqualToString:@"B"])
        {
            self.window.rootViewController.view.backgroundColor = [UIColor grayColor];
        }
        else if([shortcutItem.type isEqualToString:@"C"])
        {
            self.window.rootViewController.view.backgroundColor = [UIColor purpleColor];
        }
        else if([shortcutItem.type isEqualToString:@"D"])
        {
            self.window.rootViewController.view.backgroundColor = [UIColor orangeColor];
        }
        return NO;
    }
    return YES;
}

#pragma mark -- 创建3DTouch标签
- (void)create3DTouchItems
{
    //UIApplicationShortcutItem, 标签, 最多有4个
    //Type, 唯一的标识属性(必填)
    //Title, 标题(必填)
    //SubTitle, 二级标题
    //Icon, 显示的图标, 可以是系统给我们提供的, 也可以是自定义
    //UserInfo, 包含一些其他信息
    
    //创建标签
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"A" localizedTitle:@"张三" localizedSubtitle:@"张三很傻" icon:[UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeHome)] userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"B" localizedTitle:@"李四" localizedSubtitle:@"李四很二" icon:[UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeMarkLocation)] userInfo:nil];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"C" localizedTitle:@"王五" localizedSubtitle:@"王五很牛" icon:[UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeFavorite)] userInfo:nil];
    UIApplicationShortcutItem *item4 = [[UIApplicationShortcutItem alloc] initWithType:@"D" localizedTitle:@"赵六" localizedSubtitle:@"赵六很溜" icon:[UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeLove)] userInfo:nil];
    //将标签添加到application的shortItems中
    [UIApplication sharedApplication].shortcutItems = @[item1, item2, item3, item4];
    
}

#pragma mark -- 通过3D标签会执行的方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    //判断从哪个标签进入应用程序
    //如果APP在后台,通过快捷选项进入APP,则调用该方法,如果APP不在后台已经杀死,则处理通过快捷选项标签进入APP的逻辑在-didFinishLunching中处理
    if ([shortcutItem.type isEqualToString:@"A"])
    {
        self.window.rootViewController.view.backgroundColor = [UIColor yellowColor];
    }
    else if ([shortcutItem.type isEqualToString:@"B"])
    {
        self.window.rootViewController.view.backgroundColor = [UIColor redColor];
    }
    else if([shortcutItem.type isEqualToString:@"C"])
    {
        self.window.rootViewController.view.backgroundColor = [UIColor colorWithRed:0.0335 green:1.0 blue:0.7559 alpha:1.0];
    }
    else if([shortcutItem.type isEqualToString:@"D"])
    {
        self.window.rootViewController.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    }
    //执行这个方法的回调
    if (completionHandler) {
        completionHandler(YES);
    }
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
