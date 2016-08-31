//
//  NaviController.m
//  RotationTest
//
//  Created by 朱盛雄 on 16/8/31.
//  Copyright © 2016年 朱盛雄. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController


- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (NSUInteger)supportedInterfaceOrientations {
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
#endif
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}
    
@end
