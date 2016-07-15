//
//  FGAlertPopView.m
//  弹出自定义视图
//
//  Created by wangguigui on 16/7/15.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import "FGAlertPopView.h"

@implementation FGAlertPopView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addSubViews];
    }
    return self;
}

-(void)addSubViews
{
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 100)];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"确定要点确定吗？";
    [self.backView addSubview:self.titleLabel];
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.frame = CGRectMake(2, 50, (self.frame.size.width-6)/2, 40);
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    self.cancelBtn.backgroundColor = [UIColor lightGrayColor];
    [self.backView addSubview:self.cancelBtn];
    
    self.OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.OKBtn.frame = CGRectMake(CGRectGetMaxX(self.cancelBtn.frame) + 2, self.cancelBtn.frame.origin.y, (self.frame.size.width-6)/2, 40);
    [self.OKBtn setTitle:@"确定" forState:UIControlStateNormal];
    self.OKBtn.backgroundColor = [UIColor lightGrayColor];
    [self.OKBtn addTarget:self action:@selector(finishClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:self.OKBtn];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    int y = point.y;
    if (y<self.backView.frame.origin.y && touch.view != self.backView) {
        [self.delegate alertViewDismiss];
    }
}

-(void)cancelClick
{
    [self.delegate alertViewDismiss];
}

-(void)finishClick
{
    [self.delegate alertViewFinishedShow];
    [self.delegate alertViewDismiss];
}

@end
