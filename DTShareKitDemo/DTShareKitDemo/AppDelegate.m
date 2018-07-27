//
//  AppDelegate.m
//  DTShareKitDemo
//
//  Created by 青山 on 15/12/23.
//  Copyright © 2015年 QingShan. All rights reserved.
//

#import "AppDelegate.h"
#import <DTShareKit/DTOpenKit.h>

@interface AppDelegate () <DTOpenAPIDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 注册AppId;
    [DTOpenAPI registerApp:@"dingoak5hqhuvmpfhpnjvt"];
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(nonnull NSURL *)url
  sourceApplication:(nullable NSString *)sourceApplication
         annotation:(nonnull id)annotation
{
    return [DTOpenAPI handleOpenURL:url delegate:self];
}

- (void)onReq:(DTBaseReq *)req
{
    
}

- (void)onResp:(DTBaseResp *)resp
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"ErrorCode: %@", @(resp.errorCode)]
                                                                     message:[NSString stringWithFormat:@"ErrorMsg: %@", resp.errorMessage]
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:okAction];
    
    [self.window.rootViewController presentViewController:alertVC
                                                 animated:YES
                                               completion:nil];
}

@end
