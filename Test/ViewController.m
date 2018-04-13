//
//  ViewController.m
//  Test
//
//  Created by Alexander v. Below on 05.04.18.
//  Copyright © 2018 Deutsche Telekom AG. All rights reserved.
//

#import "ViewController.h"
@import SHPartner;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SHPartner * partner = [SHPartner new];
    self.label.text = partner.supportedLanguages.firstObject;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
