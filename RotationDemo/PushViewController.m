//
//  PushViewController.m
//  RotationTest
//
//  Created by 朱盛雄 on 16/8/31.
//  Copyright © 2016年 朱盛雄. All rights reserved.
//

#import "PushViewController.h"
#import "AppDelegate.h"

@implementation PushViewController
{
    BOOL _shouldAutorotate;
    UIButton *_button;
}

- (void)dealloc {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.Rotate = NO;
    delegate.type = RotationTypeDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(0, 64, 100, 100);
    _button.backgroundColor = [UIColor blueColor];
    _button.center = self.view.center;
    [_button setTitle:@"Pop the VC" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 64, 100, 100);
    button1.backgroundColor = [UIColor redColor];
    [button1 setTitle:@"Allowed Rotation" forState:UIControlStateNormal];
    [button1 setTitle:@"Not Allowed Rotation" forState:UIControlStateSelected];
    
    button1.titleLabel.font = [UIFont systemFontOfSize:12];
    [button1 addTarget:self action:@selector(allowedRotation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)popVC {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)allowedRotation:(UIButton *)button {
    button.selected = !button.selected;
    _shouldAutorotate = button.selected;
}

- (BOOL)shouldAutorotate {
    return _shouldAutorotate;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (_shouldAutorotate) {
        return UIInterfaceOrientationMaskAll;
    }
    else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

/*iOS8以上，旋转控制器后会调用*/
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"%s", __func__);
    _button.center = CGPointMake(size.width / 2.f - _button.bounds.size.width / 2.f, size.height / 2.f - _button.bounds.size.height / 2.f);
}

/*iOS8以下，旋转控制器后会调用*/
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"%s", __func__);
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        _button.center = self.view.center;
    }
    else {
        _button.center = CGPointMake(self.view.bounds.size.width / 2.f - _button.bounds.size.width / 2.f, self.view.bounds.size.height / 2.f - _button.bounds.size.height / 2.f);
    }
}

@end
