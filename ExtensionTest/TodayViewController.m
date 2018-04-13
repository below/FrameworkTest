//
//  TodayViewController.m
//  ExtensionTest
//
//  Created by Alexander v. Below on 13.04.18.
//  Copyright © 2018 Deutsche Telekom AG. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
@import SHPartner;

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path = bundle.executablePath;
    NSFileManager * fm = [NSFileManager defaultManager];
    NSError * error = nil;
    NSDictionary * attributes = [fm attributesOfItemAtPath:path error:&error];
    if (error != nil) {
        self.label.text = error.localizedDescription;
    }
    else {
        NSString * info = @"Not found";
        NSDate * modificationDate = attributes.fileModificationDate;
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterLongStyle;
        formatter.doesRelativeDateFormatting = YES;
        
        SHPartner * partner = [SHPartner new];
        if (partner != nil) {
            info = @"Found!";
        }
        self.label.text = [NSString stringWithFormat:@"%@\n%@", info, [formatter stringFromDate:modificationDate]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
