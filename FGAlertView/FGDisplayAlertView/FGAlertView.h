//
//  FGAlertView.h
//  弹出自定义视图
//
//  Created by wangguigui on 16/7/15.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FGAlertViewDelegate <NSObject>

-(void)alertViewClickOKButton;

@end

@interface FGAlertView : UIView

@property (nonatomic, strong) UIWindow * alertWindow;
@property (nonatomic, assign) id<FGAlertViewDelegate>delegate;

-(id)initWithFrame:(CGRect)frame withRootViewController:(UIViewController *)rootController;
-(void)show;
-(void)dismiss;

@end
