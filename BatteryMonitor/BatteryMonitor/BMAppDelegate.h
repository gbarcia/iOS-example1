//
//  BMAppDelegate.h
//  BatteryMonitor
//
//  Created by Gerardo Barcia Palacios on 24/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMMainViewController;

@interface BMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BMMainViewController *mainViewController;

@property (nonatomic) BOOL monitorBattery;

@end
