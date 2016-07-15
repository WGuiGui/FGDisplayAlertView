//
//  ViewController.m
//  FGAlertView
//
//  Created by wangguigui on 16/7/15.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import "ViewController.h"
#import "FGAlertView.h"

@interface ViewController ()<FGAlertViewDelegate>

@property (nonatomic, strong) FGAlertView * popView;
@property (nonatomic,weak) IBOutlet UIButton * popBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popView = [[FGAlertView alloc]initWithFrame:self.view.bounds withRootViewController:self];
    self.popView.delegate = self;
    
    self.popBtn.layer.masksToBounds = YES;
    self.popBtn.layer.cornerRadius = self.popBtn.frame.size.width/2;

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)alertViewClickOKButton
{
    NSLog(@"You can do anything what you want!");
}

-(IBAction)popViewClick:(id)sender
{
    [self.popView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
