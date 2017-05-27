//
//  ViewController.m
//  ConfirmOrder
//
//  Created by zhangxing on 2017/5/26.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "ViewController.h"
#import "ConfirmOrderViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)test:(id)sender {
    ConfirmOrderViewController *vc = [[ConfirmOrderViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
