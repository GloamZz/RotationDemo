//
//  ViewController.m
//  RotationTest
//
//  Created by 朱盛雄 on 16/8/31.
//  Copyright © 2016年 朱盛雄. All rights reserved.
//

#import "ViewController.h"
#import "PresentViewController.h"
#import "PushViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 64, 100, 100);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Present to Other VC" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(presentToOtherVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 100.f, 64, 100, 100);
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"Push to Other VC" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:12];
    [button1 addTarget:self action:@selector(pushToOtherVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)presentToOtherVC {
    PresentViewController *presentVC = [[PresentViewController alloc] init];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.Rotate = YES;
    delegate.type = RotationTypeTwo;
    [self presentViewController:presentVC animated:YES completion:nil];
}

- (void)pushToOtherVC {
    PushViewController *pushVC = [[PushViewController alloc] init];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.Rotate = YES;
    delegate.type = RotationTypeOne;
    [self.navigationController pushViewController:pushVC animated:YES];
}

@end
