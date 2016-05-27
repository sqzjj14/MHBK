//
//  AppDelegate.m
//  Mabinogi_heroes
//
//  Created by gang liu on 16/3/23.
//  Copyright © 2016年 baiyue. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabbarViewController.h"
#import "UMCommunity.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSnsService.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //检测版本更新
    [self updateVersion];
   
     [UMCommunity setAppKey:@"573a983b67e58ed37400332e" withAppSecret:@"a3b8921355528e47164ed10b5b52f935"];
    
    [UMSocialWechatHandler setWXAppId:@"wxf3e7e31d4c8085c9" appSecret:@"64d5757a0df48f86ab955de5c091c06f" url:@"http://www.umeng.com/social"];
    //设置分享到QQ互联的appId和appKey
    [UMSocialQQHandler setQQWithAppId:@"1105335835" appKey:@"yXXUGRKtHVxXELxO" url:@"http://www.umeng.com/social"];
    
    NSDictionary *notificationDict = [launchOptions valueForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if ([notificationDict valueForKey:@"umwsq"]) {
        [UMComMessageManager startWithOptions:launchOptions];
        if ([notificationDict valueForKey:@"aps"]) // 点击推送进入
        {
            [UMComMessageManager didReceiveRemoteNotification:notificationDict];
        }
    } else {
        [UMComMessageManager startWithOptions:nil];
        //使用你的消息通知处理
    }

    return YES;
}
#pragma mark －版本更新提示－
- (void)updateVersion{
    //获取发布版本的Version
    NSString *string = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://itunes.apple.com/lookup?id=1116582532"] encoding:NSUTF8StringEncoding error:nil];
    
    if (string!=nil && string.length > 0 && [string rangeOfString:@"version"].length ==7 ) {
        
        //获取当前版本
        NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        //appStore版本
        NSString *appStoreVersion = [string substringFromIndex:[string rangeOfString:@"\"version\":"].location+10];
        appStoreVersion = [[appStoreVersion substringToIndex:[appStoreVersion rangeOfString:@"," ].location]stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        if (![currentVersion isEqualToString:appStoreVersion]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"洛英百科有新版本啦！ %@ 已发布",appStoreVersion] delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            alert.delegate =self;
            [alert addButtonWithTitle:@"前往更新"];
            [alert show];
            alert.tag = 20;
        }
        else{
            //[[[UIAlertView alloc]initWithTitle:nil message:@"已是最新版本" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles: nil]show];
            return;
        }
    }
}
#pragma mark -UIAlertView代理方法-
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1 && alertView.tag == 20) {
        NSString *url = @"https://itunes.apple.com/cn/app/hua-hui-tong/id1098073214?mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"----devicetoken------%@",[[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                        stringByReplacingOccurrencesOfString: @">" withString: @""]
                                        stringByReplacingOccurrencesOfString: @" " withString: @""]);
    
     [UMComMessageManager registerDeviceToken:deviceToken];
   
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if ([userInfo valueForKey:@"umwsq"]) {
        [UMComMessageManager didReceiveRemoteNotification:userInfo];
    } else {
        //使用你自己的消息推送处理
    }
}
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Register Remote Notifications error:{%@}",error);
    //    NSLog(@"Register Remote Notifications error:{%@}",error.localizedDescription);
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UMSocialSnsService  applicationDidBecomeActive];
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


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
