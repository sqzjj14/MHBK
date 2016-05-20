//
//  UMComUMengMessage.m
//  UMCommunity
//
//  Created by Gavin Ye on 11/10/14.
//  Copyright (c) 2014 Umeng. All rights reserved.
//

#import "UMComUMengMessageHandler.h"
#import "UMComMessageManager.h"
#import "UMUtils.h"

@interface UMComUMengMessageHandler()

@property (nonatomic, strong) NSDictionary  * userInfo;

@end

@implementation UMComUMengMessageHandler

- (void)startWithAppKey:(NSString *)appKey launchOptions:(NSDictionary *)launchOptions
{
    [UMessage startWithAppkey:appKey launchOptions:launchOptions];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:nil];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:uns];
    }
    else {
        UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge);
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
    }
}

- (void)registerDeviceToken:(NSData *)deviceToken
{
    [UMessage registerDeviceToken:deviceToken];
}

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo{
    //关闭友盟自带的弹出框
    [UMessage setAutoAlert:NO];
    self.userInfo = userInfo;
    [UMessage didReceiveRemoteNotification:userInfo];
    NSString *content = [userInfo valueForKeyPath:@"aps.alert"];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"收到一条通知" message:content delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:@"查看",nil];
    [alertView show];
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [UMComMessageManager handleUserInfo:self.userInfo];
    }
}

- (void)addAlias:(NSString *)name type:(NSString *)type response:(void (^)(id, NSError *))handle
{
    [UMessage addAlias:name type:type response:^(id responseObject, NSError *error) {
        handle(responseObject,error);
    }];
}

- (void)removeAlias:(NSString *)name type:(NSString *)type response:(void (^)(id, NSError *))handle
{
    [UMessage removeAlias:name type:type response:handle];
}
@end
