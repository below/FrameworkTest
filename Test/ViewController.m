//
//  ViewController.m
//  Test
//
//  Created by Alexander v. Below on 05.04.18.
//  Copyright © 2018 Deutsche Telekom AG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    double x = 2;
    self.label.text = [NSString stringWithFormat:@"%.0f", x];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
