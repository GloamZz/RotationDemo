//
//  AppDelegate.h
//  RotationTest
//
//  Created by 朱盛雄 on 16/8/31.
//  Copyright © 2016年 朱盛雄. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    RotationTypeDefault,
    RotationTypeOne,
    RotationTypeTwo
}RotationType;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) BOOL Rotate;

@property (nonatomic, assign) RotationType type;

@end

