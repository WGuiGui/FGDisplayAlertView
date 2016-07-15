//
//  FGAlertPopView.h
//  弹出自定义视图
//
//  Created by wangguigui on 16/7/15.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FGAlertPopViewDelegate <NSObject>

-(void)alertViewDismiss;
-(void)alertViewFinishedShow;

@end

@interface FGAlertPopView : UIView

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton * OKBtn;
@property (nonatomic, strong) UIButton * cancelBtn;
@property (nonatomic, strong) UIView * backView;

@property (nonatomic, assign) id<FGAlertPopViewDelegate>delegate;

@end
