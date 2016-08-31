//
//  TabBarController.m
//  RotationTest
//
//  Created by 朱盛雄 on 16/8/31.
//  Copyright © 2016年 朱盛雄. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "ViewController.h"

@implementation BaseTabBarController

- (instancetype)init {
    if (self = [super init]) {
        [self setupViewControllers];
        self.selectedIndex = 0;
    }
    return self;
}

- (void)setupViewControllers {
    NSArray *vcClassNames = @[@"ViewController", @"ViewController", @"ViewController", @"ViewController"];
    NSArray *vcNames = @[@"控制器1",@"控制器2",@"控制器3",@"控制器4"];
    
    for (NSInteger i = 0; i < vcClassNames.count; i ++) {
        NSString *vcClassName = vcClassNames[i];
        Class vcClass = NSClassFromString(vcClassName);
        UIViewController *vc = [[vcClass alloc] init];
        
        BaseNavigationController *navController = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.navigationItem.title = [NSString stringWithFormat:@"控制器%ld", i + 1];
        [navController.tabBarItem setTitle:vcNames[i]];
        [self addChildViewController:navController];
    }
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

@end
