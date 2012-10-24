//
//  BMFlipsideViewController.h
//  BatteryMonitor
//
//  Created by Gerardo Barcia Palacios on 24/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMFlipsideViewController;

@protocol BMFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(BMFlipsideViewController *)controller;
@end

@interface BMFlipsideViewController : UIViewController

@property (weak, nonatomic) id <BMFlipsideViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;

- (IBAction)done:(id)sender;

@end
