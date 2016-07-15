//
//  FGAlertView.m
//  弹出自定义视图
//
//  Created by wangguigui on 16/7/15.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import "FGAlertView.h"
#import "FGAlertPopView.h"

@interface FGAlertView ()<FGAlertPopViewDelegate>

@property (nonatomic, strong) UIViewController * rootViewController;
@property (nonatomic, strong) FGAlertPopView * popView;

@end

@implementation FGAlertView

-(id)initWithFrame:(CGRect)frame withRootViewController:(UIViewController *)rootController
{
    self = [super initWithFrame:frame];
    if (self) {
        self.rootViewController = rootController;
    }
    return self;
}

-(void)show
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    window.opaque = NO;
    window.alpha = 0.0;
    window.windowLevel = UIWindowLevelAlert;
    window.rootViewController = self.rootViewController;
    self.alertWindow = window;
    [UIView animateWithDuration:0.1 animations:^{
        window.alpha = 0.6;
    }];
    
    self.popView = [[FGAlertPopView alloc]initWithFrame:self.frame];
    self.popView.delegate = self;
    self.popView.autoresizingMask = UIViewAutoresizingNone;
    
    [self.alertWindow makeKeyAndVisible];
    [self.alertWindow addSubview:self.popView];
    
    CGRect backFrame = self.popView.backView.frame;
    backFrame.origin.y -= 100;
    [UIView animateWithDuration:0.25 animations:^{
        [self.popView.backView setFrame:backFrame];
    }];
}

-(void)alertViewDismiss
{
    [self dismiss];
}

-(void)alertViewFinishedShow
{
    [self.delegate alertViewClickOKButton];
}

-(void)dismiss
{
    CGRect backFrame = self.popView.backView.frame;
    backFrame.origin.y += 100;
    [UIView animateWithDuration:0.25 animations:^{
        self.alertWindow.alpha = 0.0;
        [self.popView.backView setFrame:backFrame];
    }];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.popView removeFromSuperview];
        self.popView = nil;
        [self.alertWindow removeFromSuperview];
        self.alertWindow = nil;
    });

}

@end
