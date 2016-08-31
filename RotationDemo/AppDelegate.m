//
//  AppDelegate.m
//  RotationTest
//
//  Created by 朱盛雄 on 16/8/31.
//  Copyright © 2016年 朱盛雄. All rights reserved.
//

#import "AppDelegate.h"
//#import "TabBarController.h"
#import "OriginViewController.h"
#import "BaseNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.Rotate = NO;
    self.type = RotationTypeDefault;

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    OriginViewController *originVC = [[OriginViewController alloc] init];
    BaseNavigationController *originNav = [[BaseNavigationController alloc] initWithRootViewController:originVC];
    self.window.rootViewController = originNav;
    [self.window makeKeyAndVisible];

    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (self.Rotate) {
        switch (self.type) {
            case RotationTypeOne:
                return UIInterfaceOrientationMaskLandscape;
                break;
            case RotationTypeTwo:
                return UIInterfaceOrientationMaskAll;
                break;
            default:
                return UIInterfaceOrientationMaskPortrait;
                break;
        }
    }
    else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
