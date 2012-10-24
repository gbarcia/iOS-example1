//
//  BMFlipsideViewController.m
//  BatteryMonitor
//
//  Created by Gerardo Barcia Palacios on 24/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import "BMFlipsideViewController.h"
#import "BMAppDelegate.h"

@interface BMFlipsideViewController ()

@end

@implementation BMFlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Preferences";
    BMAppDelegate *appDelegate =
    (BMAppDelegate *) [[UIApplication sharedApplication] delegate];
    self.toggleSwitch.on = appDelegate.monitorBattery;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    BMAppDelegate *appDelegate =
    (BMAppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.monitorBattery = self.toggleSwitch.on;
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
