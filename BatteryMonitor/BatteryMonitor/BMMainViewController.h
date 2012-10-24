//
//  BMMainViewController.h
//  BatteryMonitor
//
//  Created by Gerardo Barcia Palacios on 24/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import "BMFlipsideViewController.h"

@interface BMMainViewController : UIViewController <BMFlipsideViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

- (IBAction)showInfo:(id)sender;

- (void)batteryChanged:(NSNotification *)note;
- (NSString *)batteryLevel;
- (NSString *)batteryState:(UIDeviceBatteryState )batteryState;

@end
