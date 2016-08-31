//
//  OriginViewController.m
//  RotationTest
//
//  Created by 朱盛雄 on 16/8/31.
//  Copyright © 2016年 朱盛雄. All rights reserved.
//

#import "OriginViewController.h"
#import "BaseTabBarController.h"

@implementation OriginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"OriginViewController";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 200, 100);
    button.backgroundColor = [UIColor blueColor];
    button.center = self.view.center;
    [button setTitle:@"Present to Other VC" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(presentToOtherVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)presentToOtherVC {
    BaseTabBarController *presentVC = [[BaseTabBarController alloc] init];
    [self presentViewController:presentVC animated:YES completion:nil];
}

@end
